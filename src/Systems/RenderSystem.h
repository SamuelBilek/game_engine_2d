#ifndef RENDERSYSTEM_H
#define RENDERSYSTEM_H

#include "../Logger/Logger.h"
#include "../ECS/ECS.h"
#include "../AssetStore/AssetStore.h"
#include "../Components/TransformComponent.h"
#include "../Components/SpriteComponent.h"
#include "SDL.h"
#include <vector>
#include <algorithm>


// Helper struct for sorting by zIndex
struct RenderableEntity 
{
	TransformComponent transformComponent;
	SpriteComponent spriteComponent;
};


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
		// Sorting by zIndex
		std::vector<RenderableEntity> renderableEntities;

		for (auto& entity : GetSystemEntities())
		{
			RenderableEntity renderableEntity;
			renderableEntity.transformComponent = entity.GetComponent<TransformComponent>();
			renderableEntity.spriteComponent = entity.GetComponent<SpriteComponent>();

			renderableEntities.emplace_back(renderableEntity);
		}
		std::sort(renderableEntities.begin(), renderableEntities.end(), [](const RenderableEntity& a, const RenderableEntity& b) {
			return a.spriteComponent.zIndex < b.spriteComponent.zIndex;
		});
		
		for (auto& entity : renderableEntities)
		{
			const auto transform = entity.transformComponent;
			const auto sprite = entity.spriteComponent;

			// Set the source rectangle of our original sprite texture
			SDL_Rect srcRect = sprite.srcRect;

			// Set the destination rectangle with the x and y position to be rendered
			SDL_Rect dstRect{
				static_cast<int>(transform.position.x),
				static_cast<int>(transform.position.y),
				static_cast<int>(sprite.width * transform.scale.x),
				static_cast<int>(sprite.height* transform.scale.y)
			};

			SDL_RenderCopyEx(
				renderer,
				assetStore->GetTexture(sprite.assetId),
				&srcRect,
				&dstRect,
				transform.rotation,
				NULL,
				SDL_FLIP_NONE
			);
		}
	}
};

#endif