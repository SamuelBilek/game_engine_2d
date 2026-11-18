#pragma once

#include "../Logger/Logger.h"
#include "Event.h"
#include <functional>
#include <list>
#include <map>
#include <memory>
#include <typeindex>

class IEventCallback
{
  private:
    virtual void Call(Event& e) = 0;

  public:
    virtual ~IEventCallback() = default;

    void Execute(Event& e)
    {
        Call(e);
    }
};

template <typename TOwner, typename TEvent>
class EventCallback : public IEventCallback
{
    using CallbackFunction = void (TOwner::*)(TEvent&);

  private:
    // Pointer to a member function

    TOwner* m_ownerInstance{nullptr};
    CallbackFunction m_callbackFunction{nullptr};

    virtual void Call(Event& e) override
    {
        std::invoke(m_callbackFunction, m_ownerInstance, static_cast<TEvent&>(e));
    }

  public:
    EventCallback(TOwner* ownerInstance, CallbackFunction callbackFunction)
        : m_ownerInstance{ownerInstance}, m_callbackFunction{callbackFunction}
    {
    }
    virtual ~EventCallback() override = default;
};

using HandlerList = std::list<std::unique_ptr<IEventCallback>>;

class EventBus
{
  private:
    std::map<std::type_index, std::unique_ptr<HandlerList>> m_subscribers{};

    // Private constructor for singleton
    EventBus()
    {
    }

  public:
    ~EventBus()
    {
    }

    static EventBus& GetInstance()
    {
        static EventBus eventBus{};
        return eventBus;
    }

    void Reset()
    {
        m_subscribers.clear();
    }

    template <typename TOwner, typename TEvent>
    void SubscribeToEvent(TOwner* ownerInstance, void (TOwner::*callbackFunction)(TEvent&))
    {
        if (!m_subscribers[typeid(TEvent)].get())
        {
            m_subscribers[typeid(TEvent)] = std::make_unique<HandlerList>();
        }
        auto subscriber{std::make_unique<EventCallback<TOwner, TEvent>>(ownerInstance, callbackFunction)};
        m_subscribers[typeid(TEvent)]->push_back(std::move(subscriber));
    }

    template <typename TEvent, typename... TArgs>
    void EmitEvent(TArgs&&... args)
    {
        auto handlers{m_subscribers[typeid(TEvent)].get()};
        if (handlers)
        {
            for (auto it{handlers->begin()}; it != handlers->end(); ++it)
            {
                TEvent event{std::forward<TArgs>(args)...};
                auto handler{it->get()};
                handler->Execute(event);
            }
        }
    }
};