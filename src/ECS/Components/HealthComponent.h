#pragma once

#include "../ECS.h"

struct HealthComponent : Component<HealthComponent>
{
    int healthPercentage{};

    HealthComponent() = default;

    HealthComponent(int healthPercentage) : healthPercentage{healthPercentage}
    {
    }
};