#pragma once

#include "../ECS.h"
#include <glm.hpp>

struct BoxColliderComponent : public Component<BoxColliderComponent>
{
    int width{};
    int heigth{};
    glm::vec2 offset{};

    BoxColliderComponent() = default;

    BoxColliderComponent(int width, int heigth, glm::vec2 offset = glm::vec2(0))
        : width{width}, heigth{heigth}, offset{offset}
    {
    }
};