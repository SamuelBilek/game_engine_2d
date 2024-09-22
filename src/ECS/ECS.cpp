#include "ECS.h"
#include "../Logger/Logger.h"

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
	entitiesToBeAdded.insert(entity);

	Logger::Log("Created entity with id: " + std::to_string(entityId));

	return entity;
}

void Registry::Update() {
	// TODO: Add entities that are waiting to be added to entities vector
	// TODO: Remove entities that are waiting to be killed from entities vector
}