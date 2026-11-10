#pragma once

#include "../../Logger/Logger.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <string>

class MovementSystem : public System
{
  public:
    MovementSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<RigidBodyComponent>();
    }

    void Update(double deltaTime)
    {
        for (const auto& entity : GetSystemEntities())
        {
            if (!(entity.HasComponent<TransformComponent>() && entity.HasComponent<RigidBodyComponent>()))
            {
                Logger::Err("Entity id = " + std::to_string(entity.GetId()) + " has invalid components");
                continue;
            }

            auto& transform{entity.GetComponent<TransformComponent>()};
            const auto& rigidbody{entity.GetComponent<RigidBodyComponent>()};

            transform.position.x += rigidbody.velocity.x * deltaTime;
            transform.position.y += rigidbody.velocity.y * deltaTime;
        }
    }
};