#include "ECS.h"
#include "../Logger/Logger.h"

int IComponent::nextId = 0;

int Entity::GetId() const {
	return id;
}

void System::AddEntityToSystem(Entity entity) {
	for (auto& e : entities) {
		if (e == entity) {
			Logger::Log("Entity already exists in system.");
			return;
		}
	}
	Logger::Log("Adding entity with id: " + std::to_string(entity.GetId()) + " to system.");
	entities.push_back(entity);
}

void System::RemoveEntityFromSystem(Entity entity) {
	Logger::Log("Removing entity with id: " + std::to_string(entity.GetId()) + " from system.");
	entities.erase(std::remove_if(
		entities.begin(), 
		entities.end(),
		[&entity](Entity& e) {
			return e == entity;
		}
	), entities.end());
}

std::vector<Entity> System::GetSystemEntities() const {
	return entities;
}
const Signature& System::GetComponentSignature() const {
	return componentSignature;
}

Entity Registry::CreateEntity() {
	int entityId = numEntities++;

	Entity entity(entityId);
	entity.registry = this;
	entitiesToBeAdded.insert(entity);

	if (entityId >= entityComponentSignatures.size()) {
		entityComponentSignatures.resize(entityId + 1);
	}

	Logger::Log("Created entity with id: " + std::to_string(entityId));

	return entity;
}

void Registry::AddEntityToSystems(Entity entity) {
	const int entityId = entity.GetId();

	const Signature& entitySignature = entityComponentSignatures[entityId];
	for (auto& system : systems) {
		const Signature& systemComponentSignature = system.second->GetComponentSignature();

		bool isInterested = (entitySignature & systemComponentSignature) == systemComponentSignature;
		if (isInterested) {
			system.second->AddEntityToSystem(entity);
		}
	}
}

void Registry::Update() {
	// Add entities that are waiting to be added to entities vector
	for (auto entity : entitiesToBeAdded) {
		AddEntityToSystems(entity);
	}
	entitiesToBeAdded.clear();
	
	// TODO: Remove entities that are waiting to be killed from entities vector
}