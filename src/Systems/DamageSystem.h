#ifndef DAMAGESYSTEM_H
#define DAMAGESYSTEM_H

#include "../Logger/Logger.h"
#include "../ECS/ECS.h"
#include "../Components/BoxColliderComponent.h"
#include "../EventBus/EventBus.h"
#include "../Events/CollisionEvent.h"

class DamageSystem : public System {
public:
	DamageSystem() {
		RequireComponent<BoxColliderComponent>();
	}
	
	void SubscribeToEvents(std::unique_ptr<EventBus>& eventBus) {
		eventBus->SubscribeToEvent<CollisionEvent>(this, &DamageSystem::OnCollision);
	}

	void OnCollision(CollisionEvent& e) {
		Logger::Log("The Damage system received an event collision between entities" + std::to_string(e.entity1.GetId()) + " and " + std::to_string(e.entity2.GetId()));
		e.entity1.Kill();
		e.entity2.Kill();
	}

	void Update() {
		
	}
};

#endif
