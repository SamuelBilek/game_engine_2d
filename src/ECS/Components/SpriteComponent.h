#pragma once

#include "../ECS.h"
#include <SDL.h>
#include <string>
#include <string_view>

struct SpriteComponent : Component<SpriteComponent>
{
    std::string assetId{};
    int width{};
    int height{};
    SDL_Rect srcRect;

    SpriteComponent() = default;

    SpriteComponent(std::string_view assetId, int width, int height, int srcRectX = 0, int srcRectY = 0)
        : assetId{assetId}, width{width}, height{height}, srcRect{srcRectX, srcRectY, width, height}
    {
    }
};