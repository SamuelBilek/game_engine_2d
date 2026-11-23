#include "LevelLoader.h"
#include "../AssetStore/AssetStore.h"
#include "../ECS/Components/AnimationComponent.h"
#include "../ECS/Components/BoxColliderComponent.h"
#include "../ECS/Components/CameraFollowComponent.h"
#include "../ECS/Components/HealthComponent.h"
#include "../ECS/Components/KeyboardControlledComponent.h"
#include "../ECS/Components/ProjectileEmitterComponent.h"
#include "../ECS/Components/RigidBodyComponent.h"
#include "../ECS/Components/SpriteComponent.h"
#include "../ECS/Components/TextLabelComponent.h"
#include "../ECS/Components/TransformComponent.h"
#include "../ECS/ECS.h"
#include "../ECS/Groups.h"
#include "../ECS/Tags.h"
#include "../Events/KeyPressedEvent.h"
#include "../Logger/Logger.h"
#include "../Lua/Context.h"
#include "Game.h"
#include "LevelLoader.h"
#include <SDL.h>
#include <SDL_image.h>
#include <fstream>
#include <sol.hpp>
#include <sstream>
#include <string>

void LoadAssets(sol::table& level, SDL_Renderer* renderer)
{
    sol::table assets = level["assets"];

    auto& assetStoreInstance{AssetStore::GetInstance()};

    for (const auto& [index, value] : assets)
    {
        sol::table asset = value;
        std::string assetType{asset["type"]};
        if (assetType == "texture")
        {
            assetStoreInstance.AddTexture(renderer, asset["id"], std::string(asset["file"]).c_str());
        }
        if (assetType == "font")
        {
            assetStoreInstance.AddFont(asset["id"], std::string(asset["file"]).c_str(), asset["font_size"]);
        }
    }
}

void LoadEntities(sol::table& level)
{
    auto& registryInstance{Registry::GetInstance()};

    sol::table entities{level.get<sol::table>("entities")};
    for (const auto& [index, value] : entities)
    {
        sol::table luaEntity = value;
        Entity newEntity{registryInstance.CreateEntity()};

        sol::optional<std::string> tag{luaEntity.get<sol::optional<std::string>>("tag")};
        if (tag != sol::nullopt)
        {
            newEntity.Tag(tag.value());
        }

        sol::optional<std::string> group{luaEntity.get<sol::optional<std::string>>("group")};
        if (group != sol::nullopt)
        {
            newEntity.Group(group.value());
        }

        sol::optional<sol::table> components{luaEntity.get<sol::optional<sol::table>>("components")};
        if (components == sol::nullopt)
        {
            return;
        }

        sol::optional<sol::table> transform{components.value().get<sol::optional<sol::table>>("transform")};
        if (transform != sol::nullopt)
        {
            sol::table position{transform.value().get<sol::table>("position")};
            sol::table scale{transform.value().get<sol::table>("scale")};
            newEntity.AddComponent<TransformComponent>(glm::vec2(position.get<float>("x"), position.get<float>("y")),
                                                       glm::vec2(scale.get_or("x", 1.0f), scale.get_or("y", 1.0f)),
                                                       transform.value().get_or("rotation", 0.0));
        }

        sol::optional<sol::table> rigidbody{components.value().get<sol::optional<sol::table>>("rigidbody")};
        if (rigidbody != sol::nullopt)
        {
            sol::table velocity{rigidbody.value().get<sol::table>("velocity")};
            newEntity.AddComponent<RigidBodyComponent>(
                glm::vec2(velocity.get_or("x", 0.0f), velocity.get_or("y", 0.0f)));
        }

        sol::optional<sol::table> sprite{components.value().get<sol::optional<sol::table>>("sprite")};
        if (sprite != sol::nullopt)
        {
            newEntity.AddComponent<SpriteComponent>(sprite.value().get<std::string>("texture_asset_id"),
                                                    sprite.value().get<int>("width"),
                                                    sprite.value().get<int>("height"),
                                                    sprite.value().get_or("z_index", 1),
                                                    sprite.value().get_or("fixed", false),
                                                    sprite.value().get_or("src_rect_x", 0),
                                                    sprite.value().get_or("src_rect_y", 0));
        }

        sol::optional<sol::table> animation{components.value().get<sol::optional<sol::table>>("animation")};
        if (animation != sol::nullopt)
        {
            newEntity.AddComponent<AnimationComponent>(animation.value().get_or("num_frames", 1),
                                                       animation.value().get_or("speed_rate", 1),
                                                       animation.value().get_or("loop", false));
        }

        sol::optional<sol::table> collider{components.value().get<sol::optional<sol::table>>("boxcollider")};
        if (collider != sol::nullopt)
        {
            sol::table offset{collider.value().get<sol::table>("offset")};
            newEntity.AddComponent<BoxColliderComponent>(collider.value().get<int>("width"),
                                                         collider.value().get<int>("height"),
                                                         glm::vec2(offset.get_or("x", 0.0f), offset.get_or("y", 0.0f)));
        }

        sol::optional<sol::table> health{components.value().get<sol::optional<sol::table>>("health")};
        if (health != sol::nullopt)
        {
            newEntity.AddComponent<HealthComponent>(
                health.value().get_or("health", 100),
                HealthComponent::PercentageDisplay{health.value().get<std::string>("font_asset_id")},
                HealthComponent::BarDisplay{});
        }

        sol::optional<sol::table> projEmitter{components.value().get<sol::optional<sol::table>>("projectile_emitter")};
        if (projEmitter != sol::nullopt)
        {
            sol::table projVelocity{projEmitter.value().get<sol::table>("projectile_velocity")};
            sol::table projSize{projEmitter.value().get<sol::table>("projectile_size")};
            newEntity.AddComponent<ProjectileEmitterComponent>(
                projEmitter.value().get<std::string>("texture_asset_id"),
                glm::vec2(projSize.get<float>("x"), projSize.get<float>("y")),
                glm::vec2(projVelocity.get<float>("x"), projVelocity.get<float>("y")),
                projEmitter.value().get_or("repeat_frequency", 1) * 1000,
                projEmitter.value().get_or("projectile_duration", 10) * 1000,
                projEmitter.value().get_or("hit_percentage_damage", 10),
                projEmitter.value().get_or("friendly", false));
        }

        sol::optional<sol::table> cameraFollow{components.value().get<sol::optional<sol::table>>("camera_follow")};
        if (cameraFollow != sol::nullopt)
        {
            bool follow{cameraFollow.value().get_or("follow", false)};
            if (follow)
            {
                newEntity.AddComponent<CameraFollowComponent>();
            }
        }

        sol::optional<sol::table> keyboardCtrl{
            components.value().get<sol::optional<sol::table>>("keyboard_controller")};
        if (keyboardCtrl != sol::nullopt)
        {
            sol::table up_velocity{keyboardCtrl.value().get<sol::table>("up_velocity")};
            sol::table right_velocity{keyboardCtrl.value().get<sol::table>("right_velocity")};
            sol::table down_velocity{keyboardCtrl.value().get<sol::table>("down_velocity")};
            sol::table left_velocity{keyboardCtrl.value().get<sol::table>("left_velocity")};
            newEntity.AddComponent<KeyboardControlledComponent>(
                glm::vec2(up_velocity.get<float>("x"), up_velocity.get<float>("y")),
                glm::vec2(right_velocity.get<float>("x"), right_velocity.get<float>("y")),
                glm::vec2(down_velocity.get<float>("x"), down_velocity.get<float>("y")),
                glm::vec2(left_velocity.get<float>("x"), left_velocity.get<float>("y")));
        }
    }
}

void LoadTileMap(sol::table& level)
{
    sol::table map = level["tilemap"];
    const std::string mapId{map["texture_asset_id"]};
    const int tileSize{map["tile_size"]};
    const double tileScale{map["scale"]};

    auto& registryInstance{Registry::GetInstance()};

    std::ifstream mapFile{std::string(map["map_file"]).c_str()};
    std::string line{};
    int coY{0};
    int coX{0};
    while (std::getline(mapFile, line))
    {
        coX = 0;
        std::stringstream ss{line};
        std::string tileCoord{};

        while (std::getline(ss, tileCoord, ','))
        {
            Entity tile{registryInstance.CreateEntity()};
            tile.Group(Groups::TILES);
            tile.AddComponent<TransformComponent>(glm::vec2{coX * tileSize * tileScale, coY * tileSize * tileScale},
                                                  glm::vec2{tileScale, tileScale},
                                                  0.0);

            // convert chars to numbers
            int xCoord{tileCoord[1] - '0'};
            int yCoord{tileCoord[0] - '0'};
            tile.AddComponent<SpriteComponent>(
                mapId, tileSize, tileSize, 0, false, xCoord * tileSize, yCoord * tileSize);
            ++coX;
        }
        ++coY;
    }
    mapFile.close();

    Game::s_mapWidth = coX * tileSize * tileScale;
    Game::s_mapHeigth = coY * tileSize * tileScale;
}

void LevelLoader::LoadLevel(const char* levelFile, SDL_Renderer* renderer)
{
    auto& lua{Lua::Context};
    sol::load_result script{lua.load_file(levelFile)};
    if (!script.valid())
    {
        sol::error err = script;
        Logger::Err("Error while loading lua script: " + std::string(err.what()));
    }

    lua.open_libraries(sol::lib::base);
    lua.script_file(levelFile);

    sol::table level = lua["Level"];

    LoadAssets(level, renderer);
    LoadTileMap(level);
    LoadEntities(level);
}