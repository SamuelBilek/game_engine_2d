#pragma once

#include "../Components/AnimationComponent.h"
#include "../Components/SpriteComponent.h"
#include "../ECS.h"
#include <SDL.h>

class AnimationSystem : public System
{
  public:
    AnimationSystem()
    {
        RequireComponent<SpriteComponent>();
        RequireComponent<AnimationComponent>();
    }

    void Update()
    {
        for (const auto& entity : GetSystemEntities())
        {
            if (!(entity.HasComponent<SpriteComponent>() && entity.HasComponent<AnimationComponent>()))
            {
                continue;
            }

            auto& animation{entity.GetComponent<AnimationComponent>()};
            auto& sprite{entity.GetComponent<SpriteComponent>()};

            animation.currentFrame =
                static_cast<int>((SDL_GetTicks() - animation.startTime) * animation.frameSpeedRate / 1000.0) %
                animation.numFrames;
            sprite.srcRect.x = animation.currentFrame * sprite.width;
        }
    }
};