#ifndef ECS_H
#define ECS_H

#include <vector>
#include <bitset>

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

class Registry {

};

#endif