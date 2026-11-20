#pragma once

#include "../ECS.h"
#include <optional>
#include <string>

struct HealthComponent : Component<HealthComponent>
{
    struct PercentageDisplay
    {
        std::string fontId{};
    };

    struct BarDisplay
    {
        int maxWidth{32};
        int maxHeight{4};
    };

    int healthPercentage{};
    std::optional<PercentageDisplay> percentageDisplay{std::nullopt};
    std::optional<BarDisplay> barDisplay{std::nullopt};

    HealthComponent() = default;

    HealthComponent(int healthPercentage, std::optional<PercentageDisplay> percentageDisplay = std::nullopt,
                    std::optional<BarDisplay> barDisplay = std::nullopt)
        : healthPercentage{healthPercentage}, percentageDisplay{percentageDisplay}, barDisplay{barDisplay}
    {
    }
};