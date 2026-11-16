#pragma once

#include "../ECS.h"
#include <SDL.h>

struct AnimationComponent : Component<AnimationComponent>
{
    int numFrames{1};
    int currentFrame{1};
    int frameSpeedRate{1};
    bool isLoop{true};
    uint32_t startTime{SDL_GetTicks()};

    AnimationComponent() = default;

    AnimationComponent(int numFrames, int frameSpeedRate, bool isLoop)
        : numFrames{numFrames}, frameSpeedRate{frameSpeedRate}, isLoop{isLoop}
    {
    }
};