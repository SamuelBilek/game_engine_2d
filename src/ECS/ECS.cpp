#include "ECS.h"
#include "../Logger/Logger.h"
#include <algorithm>

////////////////////////////////////////
// Component implementation
////////////////////////////////////////

////////////////////////////////////////
// Entity implementation
////////////////////////////////////////

int Entity::GetId() const
{
    return m_id;
}

void Entity::Kill()
{
    m_registry->KillEntity(*this);
}

////////////////////////////////////////
// System implementation
////////////////////////////////////////

void System::AddEntityToSystem(const Entity& entity)
{
    m_entitites.push_back(entity);
}

void System::RemoveEntityFromSystem(const Entity& entity)
{
    m_entitites.erase(
        std::remove_if(m_entitites.begin(), m_entitites.end(), [&entity](Entity& other) { return entity == other; }),
        m_entitites.end());
}

std::vector<Entity>& System::GetSystemEntities()
{
    return m_entitites;
}

const Signature& System::GetComponentSignature() const
{
    return m_componentSignature;
}

////////////////////////////////////////
// Registry implementation
////////////////////////////////////////

Entity Registry::CreateEntity()
{
    int entityId{};

    if (m_freeIds.empty())
    {
        entityId = m_numEntities++;
        if (static_cast<std::size_t>(entityId) >= m_entityComponentSignatures.size())
        {
            m_entityComponentSignatures.resize(entityId + 1);
        }
    }
    else
    {
        entityId = m_freeIds.front();
        m_freeIds.pop_front();
    }

    Entity entity{entityId, this};
    m_entitiesToBeAdded.insert(entity);

    Logger::Log("Entity created with id = " + std::to_string(entityId));

    return entity;
}

void Registry::KillEntity(const Entity& entity)
{
    m_entitiesToBeKilled.insert(entity);
}

void Registry::AddEntityToSystems(const Entity& entity)
{
    const int entityId{entity.GetId()};
    const Signature& entityComponentSignature{m_entityComponentSignatures[entityId]};

    for (auto& system : m_systems)
    {
        const auto& systemComponentSignature{system.second->GetComponentSignature()};
        // All system requirements must be satisfied
        bool isInterested{(entityComponentSignature & systemComponentSignature) == systemComponentSignature};

        if (isInterested)
        {
            system.second->AddEntityToSystem(entity);
        }
    }
}

void Registry::RemoveEntityFromSystems(const Entity& entity)
{
    for (auto& system : m_systems)
    {
        system.second->RemoveEntityFromSystem(entity);
    }
}

void Registry::Update()
{
    for (const auto& entity : m_entitiesToBeAdded)
    {
        AddEntityToSystems(entity);
    }
    m_entitiesToBeAdded.clear();

    for (const auto& entity : m_entitiesToBeKilled)
    {
        RemoveEntityFromSystems(entity);

        m_entityComponentSignatures[entity.GetId()].reset();

        m_freeIds.push_back(entity.GetId());
    }
    m_entitiesToBeKilled.clear();
}