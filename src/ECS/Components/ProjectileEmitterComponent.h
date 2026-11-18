#pragma once

#include "../ECS.h"
#include <SDL.h>
#include <glm.hpp>

struct ProjectileEmitterComponent : public Component<ProjectileEmitterComponent>
{
    glm::vec2 projectileVelocity{};
    int repeatFrequency{};
    int projectileDuration{};
    int hitPercentDamage{};
    bool isFriendly{};
    int lastEmissionTime{};

    ProjectileEmitterComponent(glm::vec2 projectileVelocity = glm::vec2(0), int repeatFrequency = 0,
                               int projectileDuration = 10000, int hitPercentDamage = 10, bool isFriendly = false)
        : projectileVelocity{projectileVelocity}, repeatFrequency{repeatFrequency},
          projectileDuration{projectileDuration}, hitPercentDamage{hitPercentDamage}, isFriendly{isFriendly}
    {
        lastEmissionTime = SDL_GetTicks();
    }
};