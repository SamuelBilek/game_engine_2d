#pragma once

#include "../ECS.h"
#include <glm.hpp>

struct TransformComponent : Component<TransformComponent>
{
    glm::vec2 position{glm::vec2{0.0, 0.0}};
    glm::vec2 scale{glm::vec2{1.0, 1.0}};
    double rotation{0.0};

    TransformComponent() = default;

    TransformComponent(const glm::vec2& position, const glm::vec2& scale, double rotation)
        : position{position}, scale{scale}, rotation{rotation}
    {
    }
};