#ifndef ECS_H
#define ECS_H

#include <vector>
#include <set>
#include <bitset>
#include <unordered_map>
#include <typeindex>

const int MAX_COMPONENTS = 32;

// Signature
// A bitset to keep track of what components an entity has
// and also to know which components a system is interested in
typedef std::bitset<MAX_COMPONENTS> Signature;

struct IComponent {
protected:
	static int nextId;
};

template <typename T>
class Component : public IComponent {
public:
	static int GetID() {
		// Each new component type will have a unique id
		static int id = nextId++;
		return id;
	}
};

class Entity {
private:
	int id;
public:
	Entity(int id) : id(id) {}
	int GetId() const;

	// Overload the == operator to compare entities
	bool operator ==(const Entity& other) const {
		return id == other.id;
	}

	bool operator !=(const Entity& other) const {
		return !(id == other.id);
	}

	// Set insert requieres the insterted object to work with < comparison
	bool operator <(const Entity& other) const {
		return id < other.id;
	}

	bool operator >(const Entity& other) const {
		return id > other.id;
	}
};

// System
// Process entities that contain a specific signature
class System {
private:
	Signature componentSignature;
	std::vector<Entity> entities;

public:
	System() = default;
	~System() = default;

	void AddEntityToSystem(Entity entity);
	void RemoveEntityFromSystem(Entity entity);
	std::vector<Entity> GetSystemEntities() const;
	const Signature& GetComponentSignature() const;

	// Defines the component type that entities must have to be constidered by the system
	template <typename TComponent> void RequireComponent();
};

template <typename TComponent>
void System::RequireComponent() {
	const auto componentId = Component<TComponent>::GetID();
	componentSignature.set(componentId);
}

// Pool
// Vector that contains objects of a specific type
class IPool {
public:
	virtual ~IPool();

};

template <typename T>
class Pool : public IPool {
private:
	std::vector<T> data;

public:
	Pool(int size = 100) {
		data.resize(size);
	}

	virtual ~Pool() = default;

	bool IsEmpty() const {
		return data.empty();
	}

	int GetSize() const {
		return data.size();
	}

	int Resize(int size) {
		data.resize(size);
	}

	void Clear() {
		data.clear();
	}

	void Add(T object) {
		data.push_back(object);
	}

	void Set(int index, T object) {
		data[index] = object;
	}

	T& Get(int index) const {
		return static_cast<T&>(data[index]);
	}

	T& operator [](int index) const {
		return Get(index);
	}
};

// Registry
// Manages creation and destruction of entities,
// adding systems and components
class Registry {
private:
	int numEntities = 0;

	// Vector of component pools. Each pool contains all instances of a specific component type
	// Vector index is the component id
	// Pool index is the entity id
	std::vector<IPool*> componentPools;

	// Vector of component signatures used by entities
	// Vector index is the entity id
	std::vector<Signature> entityComponentSignatures;

	std::unordered_map<std::type_index, System*> systems;

	//Sets of entities to be added and killed in the next frame
	std::set<Entity> entitiesToBeAdded;
	std::set<Entity> entitiesToBeKilled;


public:
	Registry() = default;

	void Update();
	
	// Entity management
	Entity CreateEntity();

	// Component management
	template <typename TComponent, typename ...TArgs> void AddComponent(Entity& entity, TArgs&& ...args);
	template <typename TComponent> void RemoveComponent(Entity& entity);
	template <typename TComponent> bool HasComponent(Entity& entity) const;
	
	// TODO:
	// KillEntity

	// GetComponent

	// AddSystem
	// RemoveSystem
	// HasSystem
	// GetSystem
};

template <typename TComponent, typename ...TArgs>
void Registry::AddComponent(Entity& entity, TArgs&& ...args) {
	const int componentId = Component<TComponent>::GetID();
	const int entityId = entity.GetId();

	// Resize component pools if needed
	if (componentPools.size() <= componentId) {
		componentPools.resize(componentId + 1);
	}

	if (!componentPools[componentId]) {
		Pool<TComponent>* newPool = new Pool<TComponent>();
		componentPools[componentId] = newPool;
	}

	Pool<TComponent>* componentPool = static_cast<Pool<TComponent>*>(componentPools[componentId]);
	
	if (componentPool->GetSize() <= entityId) {
		componentPool->Resize(numEntities);
	}

	TComponent newComponent(std::forward<TArgs>(args)...);

	componentPool->Set(entityId, newComponent);

	entityComponentSignatures[entityId].set(componentId);
}

template <typename TComponent>
void Registry::RemoveComponent(Entity& entity) {
	const int componentId = Component<TComponent>::GetID();
	const int entityId = entity.GetId();

	// No need to physically remove the component from the pool
	entityComponentSignatures[entityId].set(componentId, false);
}

template <typename TComponent>
bool Registry::HasComponent(Entity& entity) const {
	const int componentId = Component<TComponent>::GetID();
	const int entityId = entity.GetId();

	return entityComponentSignatures[entityId].test(componentId);
}

#endif