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

    void SubscribeToEvents()
    {
        EventBus::GetInstance().SubscribeToEvent<MovementSystem, CollisionEvent>(this, &MovementSystem::OnCollision);
    }

    void Update(double deltaTime)
    {
        for (auto& entity : GetSystemEntities())
        {
            if (!(entity.HasComponent<TransformComponent>() && entity.HasComponent<RigidBodyComponent>()))
            {
                continue;
            }

            auto& transform{entity.GetComponent<TransformComponent>()};
            const auto& rigidbody{entity.GetComponent<RigidBodyComponent>()};

            transform.position.x += rigidbody.velocity.x * deltaTime;
            transform.position.y += rigidbody.velocity.y * deltaTime;

            bool isEntityOutsideMap{transform.position.x < 0 || transform.position.x > Game::s_mapWidth ||
                                    transform.position.y < 0 || transform.position.y > Game::s_mapHeigth};

            if (isEntityOutsideMap)
            {
                if (entity.HasTag(Tags::PLAYER))
                {
                    int boundaryPosX{-1};
                    int boundaryPosY{-1};

                    const auto& sprite{entity.GetComponent<SpriteComponent>()};

                    const int scaledSizeX{static_cast<int>(static_cast<float>(sprite.width) * transform.scale.x)};
                    const int scaledSizeY{static_cast<int>(static_cast<float>(sprite.height) * transform.scale.y)};

                    if (transform.position.x < 0 - scaledSizeX)
                    {
                        boundaryPosX = 0 - scaledSizeX;
                    }
                    if (transform.position.x > Game::s_mapWidth - scaledSizeX)
                    {
                        boundaryPosX = Game::s_mapWidth;
                    }
                    if (transform.position.y < 0 - scaledSizeX)
                    {
                        boundaryPosY = 0 - scaledSizeX;
                    }
                    if (transform.position.y > Game::s_mapHeigth - scaledSizeY)
                    {
                        boundaryPosY = Game::s_mapHeigth;
                    }

                    transform.position.x = boundaryPosX != -1 ? boundaryPosX : transform.position.x;
                    transform.position.y = boundaryPosY != -1 ? boundaryPosY : transform.position.y;
                }
                else
                {
                    entity.Kill();
                }
            }
        }
    }

    void OnCollision(CollisionEvent& event)
    {
        if (event.a.BelongsToGroup(Groups::ENEMIES) && event.b.BelongsToGroup(Groups::OBSTACLES))
        {
            OnEnemyHitsObstacle(event.a);
        }

        if (event.b.BelongsToGroup(Groups::ENEMIES) && event.a.BelongsToGroup(Groups::OBSTACLES))
        {
            OnEnemyHitsObstacle(event.b);
        }
    }

    void OnEnemyHitsObstacle(Entity& enemy)
    {
        if (!(enemy.HasComponent<RigidBodyComponent>() && enemy.HasComponent<SpriteComponent>()))
        {
            return;
        }

        auto& rigidbody{enemy.GetComponent<RigidBodyComponent>()};
        auto& sprite{enemy.GetComponent<SpriteComponent>()};
        if (rigidbody.velocity.x != 0)
        {
            rigidbody.velocity.x *= -1;
            sprite.flip = (sprite.flip == SDL_FLIP_NONE) ? SDL_FLIP_HORIZONTAL : SDL_FLIP_NONE;
        }
        if (rigidbody.velocity.y != 0)
        {
            rigidbody.velocity.y *= 1;
        }
    }
};