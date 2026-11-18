#pragma once

#include "../Components/BoxColliderComponent.h"
#include "../Components/ProjectileComponent.h"
#include "../Components/ProjectileEmitterComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/SpriteComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <SDL.h>
#include <glm.hpp>
#include <memory>
#include <string_view>

class ProjectileEmitSystem : public System
{
  public:
    ProjectileEmitSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<ProjectileEmitterComponent>();
    }

    void Update(std::string_view projectileId, glm::vec2 projectileSize)
    {
        for (auto& entity : GetSystemEntities())
        {
            auto& projectileEmitter{entity.GetComponent<ProjectileEmitterComponent>()};
            const auto& transform{entity.GetComponent<TransformComponent>()};

            if (static_cast<int>(SDL_GetTicks()) - projectileEmitter.lastEmissionTime >
                projectileEmitter.repeatFrequency)
            {
                glm::vec2 projectilePosition{transform.position};
                if (entity.HasComponent<SpriteComponent>())
                {
                    const auto& sprite{entity.GetComponent<SpriteComponent>()};
                    projectilePosition.x += transform.scale.x * sprite.width / 2;
                    projectilePosition.y += transform.scale.y * sprite.height / 2;
                }

                Entity projectile{Registry::GetInstance().CreateEntity()};
                projectile.AddComponent<TransformComponent>(projectilePosition, glm::vec2(1.0, 1.0), 0.0);
                projectile.AddComponent<RigidBodyComponent>(projectileEmitter.projectileVelocity);
                projectile.AddComponent<SpriteComponent>(
                    projectileId, static_cast<int>(projectileSize.x), static_cast<int>(projectileSize.y), 99);
                projectile.AddComponent<BoxColliderComponent>(static_cast<int>(projectileSize.x),
                                                              static_cast<int>(projectileSize.y));
                projectile.AddComponent<ProjectileComponent>(projectileEmitter.isFriendly,
                                                             projectileEmitter.hitPercentDamage,
                                                             projectileEmitter.projectileDuration);

                projectileEmitter.lastEmissionTime = SDL_GetTicks();
            }
        }
    }
};