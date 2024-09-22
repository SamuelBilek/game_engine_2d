#include "ECS.h"
#include "../Logger/Logger.h"

int Entity::GetId() const {
	return id;
}

void System::AddEntityToSystem(Entity entity) {
	int entityId = entity.GetId();
	for (auto& e : entities) {
		if (e.GetId() == entityId) {
			Logger::Log("Entity already exists in system.");
			return;
		}
	}
	Logger::Log("Adding entity with id: " + std::to_string(entityId) + " to system.");
	entities.push_back(entity);
}

void System::RemoveEntityFromSystem(Entity entity) {
	int entityId = entity.GetId();
	Logger::Log("Removing entity with id: " + std::to_string(entityId) + " from system.");
	entities.erase(std::remove_if(
		entities.begin(), 
		entities.end(), 
		[&entityId](Entity e) {
			return e.GetId() == entityId;
		}
	), entities.end());
}

std::vector<Entity> System::GetSystemEntities() const {
	return entities;
}
const Signature& System::GetComponentSignature() const {
	return componentSignature;
}