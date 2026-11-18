#pragma once

#include "../../EventBus/EventBus.h"
#include "../../Events/KeyPressedEvent.h"
#include "../../Events/PlayerShootEvent.h"
#include "../Components/KeyboardControlledComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/SpriteComponent.h"
#include "../ECS.h"
#include <SDL.h>

class KeyboardControlSystem : public System
{
  public:
    KeyboardControlSystem()
    {
        RequireComponent<KeyboardControlledComponent>();
        RequireComponent<SpriteComponent>();
        RequireComponent<RigidBodyComponent>();
    }

    void SubscribeToEvents()
    {
        EventBus::GetInstance().SubscribeToEvent<KeyboardControlSystem, KeyPressedEvent>(
            this, &KeyboardControlSystem::OnKeyPressed);
    }

    void OnKeyPressed(KeyPressedEvent& event)
    {
        enum AnimationRow
        {
            UP,
            RIGHT,
            DOWN,
            LEFT
        };

        for (const auto& entity : GetSystemEntities())
        {
            const auto& keyboardControl{entity.GetComponent<KeyboardControlledComponent>()};
            auto& sprite{entity.GetComponent<SpriteComponent>()};
            auto& rigidBody{entity.GetComponent<RigidBodyComponent>()};

            switch (event.symbol)
            {
            case SDLK_UP:
                rigidBody.velocity = keyboardControl.upVelocity;
                sprite.srcRect.y = sprite.height * UP;
                break;
            case SDLK_RIGHT:
                rigidBody.velocity = keyboardControl.rightVelocity;
                sprite.srcRect.y = sprite.height * RIGHT;
                break;
            case SDLK_DOWN:
                rigidBody.velocity = keyboardControl.downVelocity;
                sprite.srcRect.y = sprite.height * DOWN;
                break;
            case SDLK_LEFT:
                rigidBody.velocity = keyboardControl.leftVelocity;
                sprite.srcRect.y = sprite.height * LEFT;
                break;
            case SDLK_SPACE:
                EventBus::GetInstance().EmitEvent<PlayerShootEvent>();

            default:
                break;
            }
        }
    }

    void Update()
    {
    }
};