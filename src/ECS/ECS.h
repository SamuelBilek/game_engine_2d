#pragma once

#include "../Logger/Logger.h"
#include <bitset>
#include <deque>
#include <memory>
#include <set>
#include <typeindex>
#include <unordered_map>
#include <vector>

static const unsigned int MAX_COMPONENTS{32};

/* Each bit position representes an id
 * of a templated Component type,
 * signifying whether that component is present(or turned on/off)
 */
using Signature = std::bitset<MAX_COMPONENTS>;

////////////////////////////////////////
// Component
////////////////////////////////////////

struct IComponent
{
  protected:
    inline static int nextId{};
};

template <typename T>
struct Component : public IComponent
{
    static int GetId()
    {
        // static variable stays the same for each function call
        // of the same templated type
        static const int id{nextId++};
        return id;
    }
    Component() = default;
};

////////////////////////////////////////
// Entity
////////////////////////////////////////

class Entity
{
  private:
    int m_id{};

  public:
    Entity(int id) : m_id{id}
    {
    }
    int GetId() const;

    void Kill();

    // Shorthands for Tags and Groups management
    void Tag(const std::string& tag);
    bool HasTag(const std::string& tag) const;
    void Group(const std::string& group);
    bool BelongsToGroup(const std::string& group) const;

    // Shorthands for registry entity-component management functions
    template <typename TComponent, typename... TArgs>
    void AddComponent(TArgs&&... args);

    template <typename TComponent>
    void RemoveComponent();

    template <typename TComponent>
    bool HasComponent() const;

    template <typename TComponent>
    TComponent& GetComponent() const;

    // Operator overloads

    bool operator==(const Entity& other) const
    {
        return m_id == other.m_id;
    }
    bool operator!=(const Entity& other) const
    {
        return m_id != other.m_id;
    }
    bool operator<(const Entity& other) const
    {
        return m_id < other.m_id;
    }
    bool operator>(const Entity& other) const
    {
        return m_id > other.m_id;
    }
};

////////////////////////////////////////
// System
////////////////////////////////////////
// Processes entities that contain
// specific signatures
////////////////////////////////////////

class System
{
  private:
    Signature m_componentSignature{};
    std::vector<Entity> m_entitites{};

  public:
    System() = default;
    ~System() = default;

    void AddEntityToSystem(const Entity& entity);
    void RemoveEntityFromSystem(const Entity& Entity);
    std::vector<Entity>& GetSystemEntities();
    const Signature& GetComponentSignature() const;

    template <typename TComponent>
    void RequireComponent();
};

////////////////////////////////////////
// Component
////////////////////////////////////////
// Data structure of contiguous data
// of type T
////////////////////////////////////////

class IPool
{
  public:
    virtual ~IPool()
    {
    }
};

template <typename T>
class Pool : public IPool
{
  private:
    std::vector<T> m_data{};

  public:
    Pool(int size = 100)
    {
        m_data.resize(size);
    }
    ~Pool() = default;

    bool IsEmpty() const
    {
        return m_data.empty();
    }
    int GetSize() const
    {
        return m_data.size();
    }

    void Resize(int n)
    {
        m_data.resize(n);
    }

    void Add(T object)
    {
        m_data.push_back(object);
    }

    void Set(int index, T& object)
    {
        m_data[index] = object;
    }

    T& Get(int index)
    {
        return static_cast<T&>(m_data[index]);
    }

    T& operator[](unsigned int index)
    {
        return m_data[index];
    }
};

////////////////////////////////////////
// Registry
////////////////////////////////////////
// Manages the creation and destruction
// of entities, systems and components
////////////////////////////////////////

class Registry
{
  private:
    int m_numEntities{0};

    /* Vector of component pools, each pool contains data
     * for certain type of component.
     * Vector index -> component type id
     * Pool index -> entity id
     */
    std::vector<std::shared_ptr<IPool>> m_componentPools{};

    /* Vector of component signatures per entity
     * saying which component is turned on for
     * a given entity
     * Vector index = entity id
     */
    std::vector<Signature> m_entityComponentSignatures{};

    std::unordered_map<std::type_index, std::shared_ptr<System>> m_systems{};

    /* Sets of entities flagged to be added or removed
     * in the next registry update
     */

    std::set<Entity> m_entitiesToBeAdded{};
    std::set<Entity> m_entitiesToBeKilled{};

    // Entity tags
    std::unordered_map<std::string, Entity> m_entityPerTag{};
    std::unordered_map<int, std::string> m_tagPerEntity{};

    // Entity groups
    std::unordered_map<std::string, std::set<Entity>> m_entitiesPerGroup{};
    std::unordered_map<int, std::string> m_groupPerEntity{};

    // Ids of previously removed entities available for reuse
    std::deque<int> m_freeIds{};

    // Private constructor for singleton creation
    Registry() = default;

  public:
    // Getter for singleton instance
    static Registry& GetInstance();

    void Update();

    // Entity management
    Entity CreateEntity();
    void KillEntity(const Entity& entity);

    // Tag management
    void TagEntity(const Entity& entity, const std::string& tag);
    bool EntityHasTag(const Entity& entity, const std::string& tag) const;
    Entity GetEntityByTag(const std::string& tag) const;
    void RemoveEntityTag(const Entity& entity);

    // Group management
    void GroupEntity(const Entity& entity, const std::string& group);
    bool EntityBelongsToGroup(const Entity& entity, const std::string& group) const;
    std::vector<Entity> GetEntitiesByGroup(const std::string& group) const;
    void RemoveEntityGroup(const Entity& entity);

    // Component functions
    template <typename TComponent, typename... TArgs>
    void AddComponent(const Entity& entity, TArgs&&... args);
    template <typename TComponent>
    void RemoveComponent(const Entity& entity);
    template <typename TComponent>
    bool HasComponent(const Entity& entity) const;
    template <typename TComponent>
    TComponent& GetComponent(const Entity& entity) const;

    // System functions
    template <typename TSystem, typename... TArgs>
    void AddSystem(TArgs&&... args);
    template <typename TSystem>
    void RemoveSystem();
    template <typename TSystem>
    bool HasSystem() const;
    template <typename TSystem>
    TSystem& GetSystem() const;

    void AddEntityToSystems(const Entity& entity);
    void RemoveEntityFromSystems(const Entity& entity);
};

////////////////////////////////////////
// Entity template functions definitions
////////////////////////////////////////

// Shorthands for registry entity-component management functions
template <typename TComponent, typename... TArgs>
void Entity::AddComponent(TArgs&&... args)
{
    Registry::GetInstance().AddComponent<TComponent>(*this, std::forward<TArgs>(args)...);
}

template <typename TComponent>
void Entity::RemoveComponent()
{
    Registry::GetInstance().RemoveComponent<TComponent>(*this);
}

template <typename TComponent>
bool Entity::HasComponent() const
{
    return Registry::GetInstance().HasComponent<TComponent>(*this);
}

template <typename TComponent>
TComponent& Entity::GetComponent() const
{
    return Registry::GetInstance().GetComponent<TComponent>(*this);
}

////////////////////////////////////////
// System template functions definitions
////////////////////////////////////////

template <typename TComponent>
void System::RequireComponent()
{
    const auto componentId{TComponent::GetId()};
    m_componentSignature.set(componentId);
}

////////////////////////////////////////
// Registry template functions definitions
////////////////////////////////////////

// Component-management
template <typename TComponent, typename... TArgs>
void Registry::AddComponent(const Entity& entity, TArgs&&... args)
{
    const int componentId{TComponent::GetId()};
    const int entityId{entity.GetId()};

    if (static_cast<std::size_t>(componentId) >= m_componentPools.size())
    {
        m_componentPools.resize(componentId + 1, nullptr);
    }

    if (!m_componentPools[componentId])
    {
        std::shared_ptr<Pool<TComponent>> newComponentPool{std::make_shared<Pool<TComponent>>()};
        m_componentPools[componentId] = newComponentPool;
    }

    std::shared_ptr<Pool<TComponent>> componentPool{
        std::static_pointer_cast<Pool<TComponent>>(m_componentPools[componentId])};

    if (entityId >= componentPool->GetSize())
    {
        componentPool->Resize(m_numEntities);
    }

    TComponent newComponent{std::forward<TArgs>(args)...};

    componentPool->Set(entityId, newComponent);

    m_entityComponentSignatures[entityId].set(componentId);

    Logger::Log("Component id = " + std::to_string(componentId) + " was added to entity id " +
                std::to_string(entityId));
}

template <typename TComponent>
void Registry::RemoveComponent(const Entity& entity)
{
    const int componentId{TComponent::GetId()};
    const int entityId{entity.GetId()};

    m_entityComponentSignatures[entityId].set(componentId, false);

    Logger::Log("Component id = " + std::to_string(componentId) + " was removed from entity id " +
                std::to_string(entityId));
}

template <typename TComponent>
bool Registry::HasComponent(const Entity& entity) const
{
    const int componentId{TComponent::GetId()};
    const int entityId{entity.GetId()};

    return m_entityComponentSignatures[entityId].test(componentId);
}

template <typename TComponent>
TComponent& Registry::GetComponent(const Entity& entity) const
{
    const int componentId{TComponent::GetId()};
    const int entityId{entity.GetId()};

    const auto componentPool{std::static_pointer_cast<Pool<TComponent>>(m_componentPools[componentId])};
    return componentPool->Get(entityId);
}

// System management
template <typename TSystem, typename... TArgs>
void Registry::AddSystem(TArgs&&... args)
{
    std::shared_ptr<TSystem> newSystem{std::make_shared<TSystem>(std::forward<TArgs>(args)...)};
    m_systems.insert(std::make_pair(std::type_index(typeid(TSystem)), newSystem));
}

template <typename TSystem>
void Registry::RemoveSystem()
{
    auto system{m_systems.find(std::type_index(typeid(TSystem)))};
    m_systems.erase(system);
}

template <typename TSystem>
bool Registry::HasSystem() const
{
    auto system{m_systems.find(std::type_index(typeid(TSystem)))};
    return system != m_systems.end();
}

template <typename TSystem>
TSystem& Registry::GetSystem() const
{
    auto system{m_systems.find(std::type_index(typeid(TSystem)))};
    return *(std::static_pointer_cast<TSystem>(system->second));
}