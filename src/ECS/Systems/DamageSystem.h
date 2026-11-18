#pragma once

#include "../../EventBus/EventBus.h"
#include "../../Events/CollisionEvent.h"
#include "../Components/BoxColliderComponent.h"
#include "../ECS.h"

class DamageSystem : public System
{
  public:
    DamageSystem()
    {
        RequireComponent<BoxColliderComponent>();
    }

    void SubscribeToEvents()
    {
        EventBus::GetInstance().SubscribeToEvent<DamageSystem, CollisionEvent>(this, &DamageSystem::OnCollision);
    }

    void OnCollision(CollisionEvent& event)
    {
        Logger::Log("DamageSystem received a CollisionEvent between entity " + std::to_string(event.a.GetId()) +
                    " and entity " + std::to_string(event.b.GetId()));
        // event.a.Kill();
        // event.b.Kill();
    }

    void Update()
    {
    }
};