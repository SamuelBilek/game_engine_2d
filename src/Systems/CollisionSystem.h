#ifndef COLLISIONSYSTEM_H
#define COLLISIONSYSTEM_H

#include "../Logger/Logger.h"
#include "../ECS/ECS.h"
#include "../Components/TransformComponent.h"
#include "../Components/BoxColliderComponent.h"

class CollisionSystem : public System {
public:
	CollisionSystem() {
		RequireComponent<TransformComponent>();
		RequireComponent<BoxColliderComponent>();
	}

	void Update() {
		auto entities = GetSystemEntities();
		// Loop all entities the system is interested in
		for (auto i = entities.begin(); i != entities.end(); i++) {
			Entity entity = *i;
			auto& transform = entity.GetComponent<TransformComponent>();
			auto& collider = entity.GetComponent<BoxColliderComponent>();
			// Loop only entities that havent been compared yet
			// Reduces the number of comparisons
			for (auto j = i + 1; j != entities.end(); j++) {
				Entity otherEntity = *j;
				auto& otherTransform = otherEntity.GetComponent<TransformComponent>();
				auto& otherCollider = otherEntity.GetComponent<BoxColliderComponent>();

				if (CheckAABBCollision(
					transform.position.x + collider.offset.x,
					transform.position.y + collider.offset.y,
					collider.width,
					collider.height,
					otherTransform.position.x + otherCollider.offset.x,
					otherTransform.position.y + otherCollider.offset.y,
					otherCollider.width,
					otherCollider.height
				)) {
					Logger::Log("Entity " + std::to_string(entity.GetId()) + " is colliding with entity " + std::to_string(otherEntity.GetId()));
					// TODO: Dispatch collision event

				}
			}
		}
	}

	bool CheckAABBCollision(int aX, int aY, int aW, int aH, int bX, int bY, int bW, int bH) {
		return (
			aX < bX + bW &&
			aX + aW > bX && 
			aY < bY + bH && 
			aY + aH > bY
		);
	}
};

#endif // COLLISIONSYSTEM_H