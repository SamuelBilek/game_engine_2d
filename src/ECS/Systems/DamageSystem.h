#pragma once

#include "../../EventBus/EventBus.h"
#include "../../Events/CollisionEvent.h"
#include "../Components/BoxColliderComponent.h"
#include "../Components/HealthComponent.h"
#include "../Components/ProjectileComponent.h"
#include "../ECS.h"
#include "../Groups.h"
#include "../Tags.h"

class DamageSystem : public System
{
  public:
    DamageSystem()
    {
        RequireComponent<BoxColliderComponent>();
    }

    void SubscribeToEvents()
    {
        EventBus::GetInstance().SubscribeToEvent<DamageSystem, CollisionEvent>(this, &DamageSystem::OnCollision);
    }

    void OnCollision(CollisionEvent& event)
    {
        if (event.a.BelongsToGroup(Groups::PROJECTILES) && event.b.HasTag(Tags::PLAYER))
        {
            if (!event.a.GetComponent<ProjectileComponent>().isFriendly)
            {
                OnProjectileHit(event.a, event.b);
            }
        }

        if (event.b.BelongsToGroup(Groups::PROJECTILES) && event.a.HasTag(Tags::PLAYER))
        {
            if (!event.b.GetComponent<ProjectileComponent>().isFriendly)
            {
                OnProjectileHit(event.b, event.a);
            }
        }

        if (event.a.BelongsToGroup(Groups::PROJECTILES) && event.b.BelongsToGroup(Groups::ENEMIES))
        {
            if (event.a.GetComponent<ProjectileComponent>().isFriendly)
            {
                OnProjectileHit(event.a, event.b);
            }
        }

        if (event.b.BelongsToGroup(Groups::PROJECTILES) && event.a.BelongsToGroup(Groups::ENEMIES))
        {
            if (event.b.GetComponent<ProjectileComponent>().isFriendly)
            {
                OnProjectileHit(event.b, event.a);
            }
        }
    }

    void Update()
    {
    }

  private:
    void OnProjectileHit(Entity& projectile, Entity& target)
    {
        auto& projectileComponent{projectile.GetComponent<ProjectileComponent>()};

        auto& health{target.GetComponent<HealthComponent>()};
        health.healthPercentage -= projectileComponent.hitPercentDamage;

        if (health.healthPercentage <= 0)
        {
            target.Kill();
        }

        projectile.Kill();

        Logger::Debug("Projectile id " + std::to_string(projectile.GetId()) + " hit target " +
                      std::to_string(target.GetId()));
    }
};