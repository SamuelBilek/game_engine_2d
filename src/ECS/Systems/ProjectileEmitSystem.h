#pragma once

#include "../../Events/PlayerShootEvent.h"
#include "../Components/BoxColliderComponent.h"
#include "../Components/CameraFollowComponent.h"
#include "../Components/ProjectileComponent.h"
#include "../Components/ProjectileEmitterComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/SpriteComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <SDL.h>
#include <glm.hpp>

class ProjectileEmitSystem : public System
{
  public:
    ProjectileEmitSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<ProjectileEmitterComponent>();
    }

    void SubscribeToEvents()
    {
        EventBus::GetInstance().SubscribeToEvent<ProjectileEmitSystem, PlayerShootEvent>(
            this, &ProjectileEmitSystem::OnPlayerShoot);
    }

    void Update()
    {
        for (auto& entity : GetSystemEntities())
        {
            auto& projectileEmitter{entity.GetComponent<ProjectileEmitterComponent>()};

            if (projectileEmitter.repeatFrequency == 0)
            {
                continue;
            }

            if (static_cast<int>(SDL_GetTicks()) - projectileEmitter.lastEmissionTime >
                projectileEmitter.repeatFrequency)
            {
                CreateProjectile(projectileEmitter, GetProjectilePosition(entity));
            }
        }
    }

    void OnPlayerShoot(PlayerShootEvent& event)
    {
        for (auto& entity : GetSystemEntities())
        {
            // Player has this
            if (!(entity.HasComponent<CameraFollowComponent>() && entity.HasComponent<RigidBodyComponent>()))
            {
                continue;
            }

            auto& projectileEmitter{entity.GetComponent<ProjectileEmitterComponent>()};

            if (static_cast<int>(SDL_GetTicks()) - projectileEmitter.lastEmissionTime >
                projectileEmitter.repeatFrequency)
            {
                auto& rigidBody{entity.GetComponent<RigidBodyComponent>()};
                CreateProjectile(projectileEmitter, GetProjectilePosition(entity), &rigidBody);
            }
        }
    }

  private:
    glm::vec2 GetProjectilePosition(const Entity& entity)
    {
        const auto& transform{entity.GetComponent<TransformComponent>()};

        glm::vec2 projectilePosition{transform.position};
        if (entity.HasComponent<SpriteComponent>())
        {
            const auto& sprite{entity.GetComponent<SpriteComponent>()};
            projectilePosition.x += transform.scale.x * sprite.width / 2;
            projectilePosition.y += transform.scale.y * sprite.height / 2;
        }
        return projectilePosition;
    }

    glm::vec2 GetProjectileVelocity(const ProjectileEmitterComponent& projectileEmitter,
                                    const RigidBodyComponent* const rigidBody = nullptr)
    {
        if (!rigidBody)
        {
            return projectileEmitter.projectileVelocity;
        }

        glm::vec2 velocity{projectileEmitter.projectileVelocity};
        int directionX{0};
        int directionY{0};

        directionX = rigidBody->velocity.x > 0 ? 1 : directionX;
        directionX = rigidBody->velocity.x < 0 ? -1 : directionX;
        directionY = rigidBody->velocity.y > 0 ? 1 : directionY;
        directionY = rigidBody->velocity.y < 0 ? -1 : directionY;

        velocity.x *= directionX;
        velocity.y *= directionY;

        return velocity;
    }

    void CreateProjectile(ProjectileEmitterComponent& projectileEmitter, glm::vec2 projectilePosition,
                          const RigidBodyComponent* const rigidBody = nullptr)
    {
        Entity projectile{Registry::GetInstance().CreateEntity()};
        projectile.AddComponent<TransformComponent>(projectilePosition, glm::vec2(1.0, 1.0), 0.0);
        projectile.AddComponent<RigidBodyComponent>(GetProjectileVelocity(projectileEmitter, rigidBody));
        projectile.AddComponent<SpriteComponent>(projectileEmitter.projectileId,
                                                 static_cast<int>(projectileEmitter.projectileSize.x),
                                                 static_cast<int>(projectileEmitter.projectileSize.y),
                                                 99);
        projectile.AddComponent<BoxColliderComponent>(static_cast<int>(projectileEmitter.projectileSize.x),
                                                      static_cast<int>(projectileEmitter.projectileSize.y));
        projectile.AddComponent<ProjectileComponent>(
            projectileEmitter.isFriendly, projectileEmitter.hitPercentDamage, projectileEmitter.projectileDuration);

        projectileEmitter.lastEmissionTime = SDL_GetTicks();
    }
};