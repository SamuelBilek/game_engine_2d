#pragma once

#include "../../AssetStore/AssetStore.h"
#include "../../Logger/Logger.h"
#include "../Components/SpriteComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include "SDL.h"
#include <memory>
#include <string>

class RenderSystem : public System
{
  public:
    RenderSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<SpriteComponent>();
    }

    void Update(SDL_Renderer* renderer, std::unique_ptr<AssetStore>& assetStore)
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

            SDL_Rect srcRect{sprite.srcRect}; // source rect of the original sprite texture
            SDL_Rect dstRect{
                static_cast<int>(transform.position.x),
                static_cast<int>(transform.position.y),
                static_cast<int>(sprite.width * transform.scale.x),
                static_cast<int>(sprite.height * transform.scale.y),
            };
            SDL_RenderCopyEx(renderer, assetStore->GetTexture(sprite.assetId), &srcRect, &dstRect, transform.rotation,
                             nullptr, SDL_FLIP_NONE);
        }
    }
};