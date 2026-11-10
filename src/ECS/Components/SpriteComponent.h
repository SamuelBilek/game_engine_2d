#pragma once

#include "../ECS.h"
#include <glm.hpp>

struct SpriteComponent : Component<SpriteComponent>
{
    int width{};
    int height{};

    SpriteComponent() = default;

    SpriteComponent(int width, int height) : width{width}, height{height}
    {
    }
};