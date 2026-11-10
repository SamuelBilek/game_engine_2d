#pragma once

#include "../../Logger/Logger.h"
#include "../Components/SpriteComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include "SDL.h"
#include <string>

class RenderSystem : public System
{
  public:
    RenderSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<SpriteComponent>();
    }

    void Update(SDL_Renderer* renderer)
    {
        for (const auto& entity : GetSystemEntities())
        {
            if (!(entity.HasComponent<TransformComponent>() && entity.HasComponent<SpriteComponent>()))
            {
                Logger::Err("Entity id = " + std::to_string(entity.GetId()) + " has invalid components");
                continue;
            }

            const auto& transform{entity.GetComponent<TransformComponent>()};
            const auto& sprite{entity.GetComponent<SpriteComponent>()};

            SDL_Rect objRect{
                static_cast<int>(transform.position.x),
                static_cast<int>(transform.position.y),
                sprite.width,
                sprite.height,
            };

            SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
            SDL_RenderFillRect(renderer, &objRect);
        }
    }
};