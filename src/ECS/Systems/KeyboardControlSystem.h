#pragma once

#include "../../EventBus/EventBus.h"
#include "../../Events/KeyPressedEvent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include <string>

class KeyboardControlSystem : public System
{
  public:
    KeyboardControlSystem()
    {
        RequireComponent<TransformComponent>();
    }

    void SubscribeToEvents(std::unique_ptr<EventBus>& eventBus)
    {
        eventBus->SubscribeToEvent<KeyboardControlSystem, KeyPressedEvent>(this, &KeyboardControlSystem::OnKeyPressed);
    }

    void OnKeyPressed(KeyPressedEvent& event)
    {
        Logger::Log("Key pressed [" + std::to_string(event.symbol) + "] " +
                    std::string{static_cast<char>(event.symbol)});
    }

    void Update()
    {
    }
};