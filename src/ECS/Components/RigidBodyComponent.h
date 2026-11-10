#pragma once

#include "../ECS.h"
#include <glm.hpp>

struct RigidBodyComponent : Component<RigidBodyComponent>
{
    glm::vec2 velocity{glm::vec2{0, 0}};

    RigidBodyComponent() = default;

    RigidBodyComponent(const glm::vec2& velocity) : velocity{velocity}
    {
    }
};