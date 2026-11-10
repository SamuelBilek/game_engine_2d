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
        std::remove_if(m_entitites.begin(), m_entitites.end(), [&entity](Entity& other) { return entity == other; }));
}

std::vector<Entity> System::GetSystemEntities() const
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
    int entityId{m_numEntities++};
    Entity entity{entityId, this};
    m_entitiesToBeAdded.insert(entity);

    if (static_cast<std::size_t>(entityId) >= m_entityComponentSignatures.size())
    {
        m_entityComponentSignatures.resize(entityId + 1);
    }

    Logger::Log("Entity created with id = " + std::to_string(entityId));

    return entity;
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

void Registry::Update()
{
    for (auto& entity : m_entitiesToBeAdded)
    {
        AddEntityToSystems(entity);
    }
    m_entitiesToBeAdded.clear();
}