#include "ECS.h"
#include "../Logger/Logger.h"

int IComponent::nextId = 0;

int Entity::GetId() const {
	return id;
}

void Entity::Kill() {
	registry->KillEntity(*this);
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
	int entityId;

	if (freeIds.empty()) {
		entityId = numEntities++;
		if (entityId >= entityComponentSignatures.size()) {
			entityComponentSignatures.resize(entityId + 1);
		}
	}
	else {
		entityId = freeIds.front();
		freeIds.pop_front();
	}

	Entity entity(entityId);
	entity.registry = this;
	entitiesToBeAdded.insert(entity);

	Logger::Log("Created entity with id: " + std::to_string(entityId));

	return entity;
}

void Registry::KillEntity(Entity entity) {
	Logger::Log("Killing entity with id: " + std::to_string(entity.GetId()));
	entitiesToBeKilled.insert(entity);
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

void Registry::RemoveEntityFromSystems(Entity entity) {
	for (auto& system : systems) {
		system.second->RemoveEntityFromSystem(entity);
	}
}

void Registry::Update() {
	// Add entities that are waiting to be added to entities vector
	for (auto entity : entitiesToBeAdded) {
		AddEntityToSystems(entity);
	}
	entitiesToBeAdded.clear();
	
	// Remove entities that are waiting to be killed from entities vector
	for (auto entity : entitiesToBeKilled) {
		RemoveEntityFromSystems(entity);
		int entityId = entity.GetId();

		entityComponentSignatures[entityId].reset();

		// Make the entity id available for reuse
		freeIds.push_back(entityId);
	}
	entitiesToBeKilled.clear();
}