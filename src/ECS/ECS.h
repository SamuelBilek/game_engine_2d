#ifndef ECS_H
#define ECS_H

#include <vector>
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
		data.reserve(size);
	}

	virtual ~Pool() = default;

	bool IsEmpty() const {
		return data.empty();
	}

	int GetSize() const {
		return data.size();
	}

	int Resize(int size) {
		data.reserve(size);
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

public:
	Registry() = default;
	
	// TODO:
	// CreateEntity
	// KillEntity

	// AddComponent
	// RemoveComponent
	// HasComponent
	// GetComponent

	// AddSystem
	// RemoveSystem
	// HasSystem
	// GetSystem
};

#endif