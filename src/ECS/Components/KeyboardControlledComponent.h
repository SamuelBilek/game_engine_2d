#pragma once

#include "../ECS.h"
#include <glm.hpp>

struct KeyboardControlledComponent : public Component<KeyboardControlledComponent>
{
    glm::vec2 upVelocity{};
    glm::vec2 rightVelocity{};
    glm::vec2 downVelocity{};
    glm::vec2 leftVelocity{};

    KeyboardControlledComponent() = default;

    KeyboardControlledComponent(glm::vec2 up, glm::vec2 right, glm::vec2 down, glm::vec2 left)
        : upVelocity{up}, rightVelocity{right}, downVelocity{down}, leftVelocity{left}
    {
    }
};
