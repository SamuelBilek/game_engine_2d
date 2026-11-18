#pragma once

#include "../../EventBus/EventBus.h"
#include "../../Events/CollisionEvent.h"
#include "../../Logger/Logger.h"
#include "../Components/BoxColliderComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"

class CollisionSystem : public System
{
  public:
    CollisionSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<BoxColliderComponent>();
    }

    void Update()
    {
        auto& entities{GetSystemEntities()};
        for (auto i{entities.begin()}; i < entities.end() - 1; ++i)
        {
            Entity& entityA{*i};
            const auto& aTransform{entityA.GetComponent<TransformComponent>()};
            const auto& aCollider{entityA.GetComponent<BoxColliderComponent>()};
            for (auto j{i + 1}; j < entities.end(); ++j)
            {
                Entity& entityB{*j};

                const auto& bTransform{entityB.GetComponent<TransformComponent>()};
                const auto& bCollider{entityB.GetComponent<BoxColliderComponent>()};

                bool collisionHappened{CheckAABBCollision(aTransform.position.x + aCollider.offset.x,
                                                          aTransform.position.y + aCollider.offset.y,
                                                          aCollider.width,
                                                          aCollider.heigth,
                                                          bTransform.position.x + bCollider.offset.x,
                                                          bTransform.position.y + bCollider.offset.y,
                                                          bCollider.width,
                                                          bCollider.heigth)};
                if (collisionHappened)
                {
                    EventBus::GetInstance().EmitEvent<CollisionEvent>(entityA, entityB);
                }
            }
        }
    }

    bool CheckAABBCollision(double aX, double aY, double aW, double aH, double bX, double bY, double bW, double bH)
    {
        return (aX < bX + bW) && (aX + aW > bX) && (aY < bY + bH) && (aY + aH > bY);
    }
};