#include "Game.h"
#include "../AssetStore/AssetStore.h"
#include "../ECS/Components/AnimationComponent.h"
#include "../ECS/Components/BoxColliderComponent.h"
#include "../ECS/Components/CameraFollowComponent.h"
#include "../ECS/Components/HealthComponent.h"
#include "../ECS/Components/KeyboardControlledComponent.h"
#include "../ECS/Components/ProjectileEmitterComponent.h"
#include "../ECS/Components/RigidBodyComponent.h"
#include "../ECS/Components/SpriteComponent.h"
#include "../ECS/Components/TransformComponent.h"
#include "../ECS/ECS.h"
#include "../ECS/Systems/AnimationSystem.h"
#include "../ECS/Systems/CameraMovementSystem.h"
#include "../ECS/Systems/CollisionSystem.h"
#include "../ECS/Systems/DamageSystem.h"
#include "../ECS/Systems/KeyboardControlSystem.h"
#include "../ECS/Systems/MovementSystem.h"
#include "../ECS/Systems/ProjectileEmitSystem.h"
#include "../ECS/Systems/ProjectileLifecycleSystem.h"
#include "../ECS/Systems/RenderCollisionSystem.h"
#include "../ECS/Systems/RenderSystem.h"
#include "../Events/KeyPressedEvent.h"
#include "../Logger/Logger.h"
#include <SDL.h>
#include <SDL_image.h>
#include <algorithm>
#include <fstream>
#include <memory>
#include <sstream>
#include <string>

static const std::string s_projectileId{"bullet-image"};

Game::Game() : m_isRunning{false}, m_eventBus{std::make_unique<EventBus>()}
{
    Logger::Log("Game constructor called!");
}
Game::~Game()
{
    Logger::Log("Game destructor called!");
}
void Game::Initialize()
{
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0)
    {
        Logger::Err("Error initializing SDL.");
        return;
    }

    SDL_DisplayMode displayMode{};
    SDL_GetCurrentDisplayMode(0, &displayMode);
    s_windowWidth = std::min(displayMode.w, 1280);
    s_windowHeight = std::min(displayMode.h, 720);
    m_window = SDL_CreateWindow(
        nullptr, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, s_windowWidth, s_windowHeight, SDL_WINDOW_BORDERLESS);

    if (!m_window)
    {
        Logger::Err("Error creating SDL window.");
        return;
    }

    m_renderer = {
        SDL_CreateRenderer(m_window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)}; // GPU acc + Vsync
    if (!m_renderer)
    {
        Logger::Err("Error creating SDL Renderer.");
    }

    // SDL_SetWindowFullscreen(m_window, SDL_WINDOW_FULLSCREEN);

    m_isRunning = true;

    // Initialize the camera
    m_camera.x = 0;
    m_camera.y = 0;
    m_camera.w = s_windowWidth;
    m_camera.h = s_windowHeight;
}

void Game::ProcessInput()
{
    SDL_Event sdlEvent{};
    while (SDL_PollEvent(&sdlEvent))
    {
        switch (sdlEvent.type)
        {
        case SDL_QUIT:
            m_isRunning = false;
            break;
        case SDL_KEYDOWN:
            if (sdlEvent.key.keysym.sym == SDLK_ESCAPE) // ESC down
            {
                m_isRunning = false;
            }
            if (sdlEvent.key.keysym.sym == SDLK_d)
            {
                m_isDebug = !m_isDebug;
            }
            m_eventBus->EmitEvent<KeyPressedEvent>(sdlEvent.key.keysym.sym);
            break;
        }
    }
}

void Game::LoadLevel(int level)
{
    auto& assetStoreInstance{AssetStore::GetInstance()};

    constexpr int texSizeBase{32};
    auto& registryInstance{Registry::GetInstance()};
    registryInstance.AddSystem<MovementSystem>();
    registryInstance.AddSystem<RenderSystem>();
    registryInstance.AddSystem<AnimationSystem>();
    registryInstance.AddSystem<CollisionSystem>();
    registryInstance.AddSystem<RenderCollisionSystem>();
    registryInstance.AddSystem<DamageSystem>();
    registryInstance.AddSystem<KeyboardControlSystem>();
    registryInstance.AddSystem<CameraMovementSystem>();
    registryInstance.AddSystem<ProjectileEmitSystem>();
    registryInstance.AddSystem<ProjectileLifecycleSystem>();

    const std::string mapId{"map-tiles"};
    constexpr double tileScale{2.0};
    assetStoreInstance.AddTexture(m_renderer, mapId, "./assets/tilemaps/jungle.png");

    std::ifstream mapFile{"./assets/tilemaps/jungle.map"};
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
            tile.AddComponent<TransformComponent>(
                glm::vec2{coX * texSizeBase * tileScale, coY * texSizeBase * tileScale},
                glm::vec2{tileScale, tileScale},
                0.0);

            // convert chars to numbers
            int xCoord{tileCoord[1] - '0'};
            int yCoord{tileCoord[0] - '0'};
            tile.AddComponent<SpriteComponent>(
                mapId, texSizeBase, texSizeBase, 0, false, xCoord * texSizeBase, yCoord * texSizeBase);
            ++coX;
        }
        ++coY;
    }
    mapFile.close();

    s_mapWidth = coX * texSizeBase * tileScale;
    s_mapHeigth = coY * texSizeBase * tileScale;

    const std::string chopperId{"chopper-image"};
    constexpr int chopperSpeed{80};
    assetStoreInstance.AddTexture(m_renderer, chopperId, "./assets/images/chopper-spritesheet.png");
    Entity chopper{registryInstance.CreateEntity()};
    chopper.AddComponent<TransformComponent>(glm::vec2{10.0, 100.0}, glm::vec2{1.0, 1.0}, 0.0);
    chopper.AddComponent<RigidBodyComponent>(glm::vec2{00.0, 0.0});
    chopper.AddComponent<SpriteComponent>(chopperId, texSizeBase, texSizeBase, 1);
    chopper.AddComponent<AnimationComponent>(2, 15, true);
    chopper.AddComponent<KeyboardControlledComponent>(glm::vec2(0, -chopperSpeed),
                                                      glm::vec2(chopperSpeed, 0),
                                                      glm::vec2(0, chopperSpeed),
                                                      glm::vec2(-chopperSpeed, 0));
    chopper.AddComponent<CameraFollowComponent>();
    chopper.AddComponent<HealthComponent>(100);

    constexpr int radarTexSize{64};
    constexpr int radarPxOffset{10};
    const std::string radarId{"radar-image"};
    assetStoreInstance.AddTexture(m_renderer, radarId, "./assets/images/radar.png");
    Entity radar{registryInstance.CreateEntity()};
    radar.AddComponent<TransformComponent>(
        glm::vec2{s_windowWidth - (radarTexSize + radarPxOffset), radarPxOffset}, glm::vec2{1.0, 1.0}, 0.0);
    radar.AddComponent<RigidBodyComponent>(glm::vec2{00.0, 0.0});
    radar.AddComponent<SpriteComponent>(radarId, radarTexSize, radarTexSize, 2, true);
    radar.AddComponent<AnimationComponent>(8, 5, true);

    const std::string tankId{"tank-image"};
    assetStoreInstance.AddTexture(m_renderer, tankId, "./assets/images/tank-panther-right.png");
    Entity tank{registryInstance.CreateEntity()};
    tank.AddComponent<TransformComponent>(glm::vec2{1000.0, 10.0}, glm::vec2{1.0, 1.0}, 0.0);
    tank.AddComponent<RigidBodyComponent>(glm::vec2{-30.0, 0.0});
    tank.AddComponent<SpriteComponent>(tankId, texSizeBase, texSizeBase, 1);
    tank.AddComponent<BoxColliderComponent>(texSizeBase, texSizeBase);
    tank.AddComponent<ProjectileEmitterComponent>(glm::vec2(100.0, 0.0), 5000, 3000, 0, false);
    tank.AddComponent<HealthComponent>(100);

    const std::string truckId{"truck-image"};
    assetStoreInstance.AddTexture(m_renderer, truckId, "./assets/images/truck-ford-right.png");
    Entity truck{registryInstance.CreateEntity()};
    truck.AddComponent<TransformComponent>(glm::vec2{10.0, 10.0}, glm::vec2{1.0, 1.0}, 0.0);
    truck.AddComponent<RigidBodyComponent>(glm::vec2{20.0, 0.0});
    truck.AddComponent<SpriteComponent>(truckId, texSizeBase, texSizeBase, 1);
    truck.AddComponent<BoxColliderComponent>(texSizeBase, texSizeBase);
    truck.AddComponent<ProjectileEmitterComponent>(glm::vec2(0.0, 100.0), 2000, 5000, 0, false);
    truck.AddComponent<HealthComponent>(100);

    assetStoreInstance.AddTexture(m_renderer, s_projectileId, "./assets/images/bullet.png");
}

void Game::Setup()
{
    LoadLevel(1);
}

void Game::Update()
{
    int timeToWait{MILISECS_PER_FRAME - static_cast<int>(SDL_GetTicks() - m_milisecsPreviousFrame)};
    if (timeToWait > 0 && timeToWait <= MILISECS_PER_FRAME)
    {
        SDL_Delay(timeToWait);
    }

    double deltaTime{(SDL_GetTicks() - m_milisecsPreviousFrame) / 1000.0};

    m_milisecsPreviousFrame = SDL_GetTicks();

    m_eventBus->Reset();

    auto& registryInstance{Registry::GetInstance()};

    registryInstance.GetSystem<DamageSystem>().SubscribeToEvents(m_eventBus);
    registryInstance.GetSystem<KeyboardControlSystem>().SubscribeToEvents(m_eventBus);

    registryInstance.Update();

    registryInstance.GetSystem<MovementSystem>().Update(deltaTime);
    registryInstance.GetSystem<AnimationSystem>().Update();
    registryInstance.GetSystem<CollisionSystem>().Update(m_eventBus);
    registryInstance.GetSystem<ProjectileEmitSystem>().Update(s_projectileId, glm::vec2(4, 4));
    registryInstance.GetSystem<ProjectileLifecycleSystem>().Update();
    registryInstance.GetSystem<CameraMovementSystem>().Update(m_camera);
}

void Game::Render()
{
    SDL_SetRenderDrawColor(m_renderer, 21, 21, 21, 255);
    SDL_RenderClear(m_renderer);

    auto& registryInstance{Registry::GetInstance()};

    registryInstance.GetSystem<RenderSystem>().Update(m_renderer, m_camera);
    if (m_isDebug)
    {
        registryInstance.GetSystem<RenderCollisionSystem>().Update(m_renderer, m_camera);
    }

    SDL_RenderPresent(m_renderer);
}

void Game::Run()
{
    Setup();
    while (m_isRunning)
    {
        ProcessInput();
        Update();
        Render();
    }
}

void Game::Destroy()
{
    SDL_DestroyRenderer(m_renderer);
    m_renderer = nullptr;
    SDL_DestroyWindow(m_window);
    m_window = nullptr;
    SDL_Quit();
}