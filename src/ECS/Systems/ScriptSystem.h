#pragma once

#include "../../Lua/Context.h"
#include "../Components/ProjectileEmitterComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/ScriptComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <tuple>

inline std::tuple<double, double> GetEntityPosition(const Entity& entity)
{
    if (entity.HasComponent<TransformComponent>())
    {
        auto& transform{entity.GetComponent<TransformComponent>()};
        return std::make_tuple(transform.position.x, transform.position.y);
    }
    else
    {
        Logger::Err("Trying to get a position of an entity without Transform Component!");
        return std::make_tuple(0, 0);
    }
}

inline void SetEntityPosition(const Entity& entity, double x, double y)
{
    if (entity.HasComponent<TransformComponent>())
    {
        auto& transform{entity.GetComponent<TransformComponent>()};
        transform.position.x = x;
        transform.position.y = y;
    }
    else
    {
        Logger::Err("Trying to set a position of an entity without Transform Component!");
    }
}

inline void SetEntityRotation(const Entity& entity, double rotation)
{
    if (entity.HasComponent<TransformComponent>())
    {
        auto& transform{entity.GetComponent<TransformComponent>()};
        transform.rotation = rotation;
    }
    else
    {
        Logger::Err("Trying to set rotation of an entity without Transform Component!");
    }
}

inline std::tuple<double, double> GetEntityVelocity(const Entity& entity)
{
    if (entity.HasComponent<RigidBodyComponent>())
    {
        auto& rigidbody{entity.GetComponent<RigidBodyComponent>()};
        return std::make_tuple(rigidbody.velocity.x, rigidbody.velocity.y);
    }
    else
    {
        Logger::Err("Trying to get velocity of an entity without Rigidbody Component!");
        return std::make_tuple(0, 0);
    }
}

inline void SetEntityVelocity(const Entity& entity, double x, double y)
{
    if (entity.HasComponent<RigidBodyComponent>())
    {
        auto& rigidbody{entity.GetComponent<RigidBodyComponent>()};
        rigidbody.velocity.x = x;
        rigidbody.velocity.y = y;
    }
    else
    {
        Logger::Err("Trying to set velocity of an entity without Rigidbody Component!");
    }
}

inline void SetProjectileVelocity(const Entity& entity, double x, double y)
{
    if (entity.HasComponent<ProjectileEmitterComponent>())
    {
        auto& emitter{entity.GetComponent<ProjectileEmitterComponent>()};
        emitter.projectileVelocity.x = x;
        emitter.projectileVelocity.y = y;
    }
    else
    {
        Logger::Err("Trying to set projectile velocity of an entity without Projectile Emitter Component!");
    }
}

class ScriptSystem : public System
{
  public:
    ScriptSystem()
    {
        RequireComponent<ScriptComponent>();
    }

    void CreateLuaBindings()
    {
        Lua::Context.new_usertype<Entity>("entity",
                                          "get_id",
                                          &Entity::GetId,
                                          "destroy",
                                          &Entity::Kill,
                                          "has_tag",
                                          &Entity::HasTag,
                                          "belongs_to_group",
                                          &Entity::BelongsToGroup);
        Lua::Context.set_function("get_position", GetEntityPosition);
        Lua::Context.set_function("set_position", SetEntityPosition);
        Lua::Context.set_function("set_rotation", SetEntityRotation);
        Lua::Context.set_function("get_velocity", GetEntityVelocity);
        Lua::Context.set_function("set_velocity", SetEntityVelocity);
        Lua::Context.set_function("set_projectile_velocity", SetProjectileVelocity);
    }

    void Update(double deltaTime, int elapsedTime)
    {
        for (const auto& entity : GetSystemEntities())
        {
            auto& script{entity.GetComponent<ScriptComponent>()};
            if (script.func != sol::nil)
            {
                script.func(entity, deltaTime, elapsedTime);
            }
        }
    }
};