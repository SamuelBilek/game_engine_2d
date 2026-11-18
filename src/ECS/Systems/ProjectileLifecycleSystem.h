#pragma once

#include "../Components/ProjectileComponent.h"

#include "../ECS.h"
#include <SDL.h>
#include <glm.hpp>

class ProjectileLifecycleSystem : public System
{
  public:
    ProjectileLifecycleSystem()
    {
        RequireComponent<ProjectileComponent>();
    }

    void Update()
    {
        for (auto& entity : GetSystemEntities())
        {
            const auto& projectile{entity.GetComponent<ProjectileComponent>()};

            if (static_cast<int>(SDL_GetTicks()) - projectile.startTime > projectile.duration)
            {
                entity.Kill();
            }
        }
    }
};