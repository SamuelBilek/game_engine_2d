#pragma once

#include "../Components/BoxColliderComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <SDL.h>

class RenderCollisionSystem : public System
{
  public:
    RenderCollisionSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<BoxColliderComponent>();
    }

    void Update(SDL_Renderer* renderer)
    {
        for (const auto& entity : GetSystemEntities())
        {
            auto& transform{entity.GetComponent<TransformComponent>()};
            auto& collider{entity.GetComponent<BoxColliderComponent>()};

            SDL_Rect colliderRect{
                static_cast<int>(transform.position.x + collider.offset.x),
                static_cast<int>(transform.position.y + collider.offset.y),
                static_cast<int>(collider.width),
                static_cast<int>(collider.heigth),
            };
            SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
            SDL_RenderDrawRect(renderer, &colliderRect);
        }
    }
};