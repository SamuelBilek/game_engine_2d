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
    int zIndex{};
    SDL_RendererFlip flip{SDL_FLIP_NONE};
    bool isFixed{};
    SDL_Rect srcRect;

    SpriteComponent() = default;

    SpriteComponent(std::string_view assetId, int width, int height, int zIndex = 0, bool isFixed = false,
                    int srcRectX = 0, int srcRectY = 0)
        : assetId{assetId}, width{width}, height{height}, zIndex{zIndex}, isFixed{isFixed},
          srcRect{srcRectX, srcRectY, width, height}
    {
    }
};