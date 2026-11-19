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

void Entity::Tag(const std::string& tag)
{
    Registry::GetInstance().TagEntity(*this, tag);
}

bool Entity::HasTag(const std::string& tag) const
{
    return Registry::GetInstance().EntityHasTag(*this, tag);
}

void Entity::Group(const std::string& group)
{
    Registry::GetInstance().GroupEntity(*this, group);
}

bool Entity::BelongsToGroup(const std::string& group) const
{
    return Registry::GetInstance().EntityBelongsToGroup(*this, group);
}

void Entity::Kill()
{
    Registry::GetInstance().KillEntity(*this);
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

Registry& Registry::GetInstance()
{
    static Registry instance{};
    return instance;
}

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

    Entity entity{entityId};
    m_entitiesToBeAdded.insert(entity);

    Logger::Log("Entity created with id = " + std::to_string(entityId));

    return entity;
}

void Registry::KillEntity(const Entity& entity)
{
    m_entitiesToBeKilled.insert(entity);
}

void Registry::TagEntity(const Entity& entity, const std::string& tag)
{
    m_entityPerTag.emplace(tag, entity);
    m_tagPerEntity.emplace(entity.GetId(), tag);
}

bool Registry::EntityHasTag(const Entity& entity, const std::string& tag) const
{
    auto it{m_tagPerEntity.find(entity.GetId())};
    return it != m_tagPerEntity.end() && it->second == tag;
}

Entity Registry::GetEntityByTag(const std::string& tag) const
{
    return m_entityPerTag.at(tag);
}

void Registry::RemoveEntityTag(const Entity& entity)
{
    auto taggedEntity{m_tagPerEntity.find(entity.GetId())};
    if (taggedEntity != m_tagPerEntity.end())
    {
        auto tag{taggedEntity->second};
        m_entityPerTag.erase(tag);
        m_tagPerEntity.erase(taggedEntity);
    }
}

void Registry::GroupEntity(const Entity& entity, const std::string& group)
{
    m_entitiesPerGroup.emplace(group, std::set<Entity>());
    m_entitiesPerGroup[group].emplace(entity);
    m_groupPerEntity.emplace(entity.GetId(), group);
}

bool Registry::EntityBelongsToGroup(const Entity& entity, const std::string& group) const
{
    auto it{m_groupPerEntity.find(entity.GetId())};
    return it != m_groupPerEntity.end() && it->second == group;
}

std::vector<Entity> Registry::GetEntitiesByGroup(const std::string& group) const
{
    auto& groupSet{m_entitiesPerGroup.at(group)};
    return std::vector<Entity>{groupSet.begin(), groupSet.end()};
}

void Registry::RemoveEntityGroup(const Entity& entity)
{
    auto group{m_groupPerEntity.find(entity.GetId())};
    if (group != m_groupPerEntity.end())
    {
        auto& groupSet{m_entitiesPerGroup.at(group->second)};
        groupSet.erase(entity);
        m_groupPerEntity.erase(entity.GetId());
    }
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

        for (auto& pool : m_componentPools)
        {
            if (pool)
            {
                pool->Remove(entity.GetId());
            }
        }

        m_freeIds.push_back(entity.GetId());

        RemoveEntityTag(entity);
        RemoveEntityGroup(entity);
    }
    m_entitiesToBeKilled.clear();
}