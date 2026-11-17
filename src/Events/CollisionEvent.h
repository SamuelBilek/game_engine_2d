#pragma once

#include "../ECS/ECS.h"
#include "../EventBus/Event.h"

class CollisionEvent : public Event
{
  public:
    Entity a;
    Entity b;
    CollisionEvent(const Entity& a, const Entity& b) : a{a}, b{b}
    {
    }
};