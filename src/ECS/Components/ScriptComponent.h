#pragma once

#include "../ECS.h"
#include <sol.hpp>

struct ScriptComponent : Component<ScriptComponent>
{
    sol::function func{};

    ScriptComponent(sol::function func = sol::lua_nil) : func{func}
    {
    }
};