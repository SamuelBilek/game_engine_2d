#ifndef RENDERCOLLISIONSYSTEM_H
#define RENDERCOLLISIONSYSTEM_H

#include <SDL.h>
#include "../ECS/ECS.h"
#include "../Components/TransformComponent.h"
#include "../Components/BoxColliderComponent.h"

class RenderCollisionSystem : public System {
public:
	RenderCollisionSystem() {
		RequireComponent<TransformComponent>();
		RequireComponent<BoxColliderComponent>();
	}

	void Update(SDL_Renderer* renderer) {
		for (auto& entity : GetSystemEntities()) {
			auto& transform = entity.GetComponent<TransformComponent>();
			auto& collider = entity.GetComponent<BoxColliderComponent>();

			SDL_Rect rect = {
				transform.position.x + collider.offset.x,
				transform.position.y + collider.offset.y,
				collider.width,
				collider.height
			};

			SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
			SDL_RenderDrawRect(renderer, &rect);
		}
	}
};

#endif