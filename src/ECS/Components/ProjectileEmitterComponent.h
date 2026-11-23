#pragma once

#include "../ECS.h"
#include <SDL.h>
#include <glm.hpp>
#include <string>

struct ProjectileEmitterComponent : public Component<ProjectileEmitterComponent>
{
    std::string projectileId{};
    glm::vec2 projectileSize{};
    glm::vec2 projectileVelocity{};
    int repeatFrequency{};
    int projectileDuration{};
    int hitPercentDamage{};
    bool isFriendly{};
    int lastEmissionTime{};

    ProjectileEmitterComponent(std::string projectileId = "", glm::vec2 projectileSize = glm::vec2(4, 4),
                               glm::vec2 projectileVelocity = glm::vec2(0), int repeatFrequency = 0,
                               int projectileDuration = 10000, int hitPercentDamage = 10, bool isFriendly = false)
        : projectileId{projectileId}, projectileSize{projectileSize}, projectileVelocity{projectileVelocity},
          repeatFrequency{repeatFrequency}, projectileDuration{projectileDuration}, hitPercentDamage{hitPercentDamage},
          isFriendly{isFriendly}
    {
        lastEmissionTime = SDL_GetTicks();
    }
};