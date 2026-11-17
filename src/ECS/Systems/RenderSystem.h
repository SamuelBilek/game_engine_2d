#pragma once

#include "../../AssetStore/AssetStore.h"
#include "../../Logger/Logger.h"
#include "../Components/SpriteComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include "SDL.h"
#include <algorithm>
#include <memory>
#include <ranges>
#include <vector>

class RenderSystem : public System
{
  public:
    RenderSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<SpriteComponent>();
    }

    void Update(SDL_Renderer* renderer, std::unique_ptr<AssetStore>& assetStore, SDL_Rect& camera)
    {
        auto filteredEntities{GetSystemEntities() | std::ranges::views::filter(SatisfiesRequirements)};
        std::vector<Entity> zSortedEntities{filteredEntities.begin(), filteredEntities.end()};
        std::ranges::sort(zSortedEntities, [](const Entity& entityA, const Entity& entityB) {
            return entityA.GetComponent<SpriteComponent>().zIndex < entityB.GetComponent<SpriteComponent>().zIndex;
        });

        for (const auto& entity : zSortedEntities)
        {
            const auto& transform{entity.GetComponent<TransformComponent>()};
            const auto& sprite{entity.GetComponent<SpriteComponent>()};

            SDL_Rect srcRect{sprite.srcRect}; // source rect of the original sprite texture
            SDL_Rect dstRect{
                static_cast<int>(transform.position.x - (sprite.isFixed ? 0 : camera.x)),
                static_cast<int>(transform.position.y - (sprite.isFixed ? 0 : camera.y)),
                static_cast<int>(sprite.width * transform.scale.x),
                static_cast<int>(sprite.height * transform.scale.y),
            };
            SDL_RenderCopyEx(renderer,
                             assetStore->GetTexture(sprite.assetId),
                             &srcRect,
                             &dstRect,
                             transform.rotation,
                             nullptr,
                             SDL_FLIP_NONE);
        }
    }

  private:
    static bool SatisfiesRequirements(const Entity& entity)
    {
        return entity.HasComponent<TransformComponent>() && entity.HasComponent<SpriteComponent>();
    }
};