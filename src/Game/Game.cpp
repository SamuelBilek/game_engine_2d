#include "Game.h"
#include "../AssetStore/AssetStore.h"
#include "../ECS/Components/AnimationComponent.h"
#include "../ECS/Components/BoxColliderComponent.h"
#include "../ECS/Components/RigidBodyComponent.h"
#include "../ECS/Components/SpriteComponent.h"
#include "../ECS/Components/TransformComponent.h"
#include "../ECS/ECS.h"
#include "../ECS/Systems/AnimationSystem.h"
#include "../ECS/Systems/CollisionSystem.h"
#include "../ECS/Systems/DamageSystem.h"
#include "../ECS/Systems/MovementSystem.h"
#include "../ECS/Systems/RenderCollisionSystem.h"
#include "../ECS/Systems/RenderSystem.h"
#include "../Logger/Logger.h"
#include <SDL.h>
#include <SDL_image.h>
#include <algorithm>
#include <fstream>
#include <memory>
#include <sstream>
#include <string>

Game::Game()
    : m_isRunning{false}, m_registry{std::make_unique<Registry>()}, m_assetStore{std::make_unique<AssetStore>()},
      m_eventBus{std::make_unique<EventBus>()}
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
    windowWidth = std::min(displayMode.w, 1280);
    windowHeight = std::min(displayMode.h, 720);
    m_window = SDL_CreateWindow(
        nullptr, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, windowWidth, windowHeight, SDL_WINDOW_BORDERLESS);

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
            break;
        }
    }
}

void Game::LoadLevel(int level)
{
    constexpr int texSizeBase{32};
    m_registry->AddSystem<MovementSystem>();
    m_registry->AddSystem<RenderSystem>();
    m_registry->AddSystem<AnimationSystem>();
    m_registry->AddSystem<CollisionSystem>();
    m_registry->AddSystem<RenderCollisionSystem>();
    m_registry->AddSystem<DamageSystem>();

    const std::string mapId{"map-tiles"};
    constexpr double tileScale{2.0};
    m_assetStore->AddTexture(m_renderer, mapId, "./assets/tilemaps/jungle.png");

    std::ifstream mapFile{"./assets/tilemaps/jungle.map"};
    std::string line{};
    int coY{0};
    while (std::getline(mapFile, line))
    {
        int coX{0};
        std::stringstream ss{line};
        std::string tileCoord{};

        while (std::getline(ss, tileCoord, ','))
        {
            Entity tile{m_registry->CreateEntity()};
            tile.AddComponent<TransformComponent>(
                glm::vec2{coX * texSizeBase * tileScale, coY * texSizeBase * tileScale},
                glm::vec2{tileScale, tileScale},
                0.0);

            // convert chars to numbers
            int xCoord{tileCoord[1] - '0'};
            int yCoord{tileCoord[0] - '0'};
            tile.AddComponent<SpriteComponent>(
                mapId, texSizeBase, texSizeBase, 0, xCoord * texSizeBase, yCoord * texSizeBase);
            ++coX;
        }
        ++coY;
    }
    mapFile.close();

    const std::string chopperId{"chopper-image"};
    m_assetStore->AddTexture(m_renderer, chopperId, "./assets/images/chopper.png");
    Entity chopper{m_registry->CreateEntity()};
    chopper.AddComponent<TransformComponent>(glm::vec2{10.0, 100.0}, glm::vec2{1.0, 1.0}, 0.0);
    chopper.AddComponent<RigidBodyComponent>(glm::vec2{00.0, 0.0});
    chopper.AddComponent<SpriteComponent>(chopperId, texSizeBase, texSizeBase, 1);
    chopper.AddComponent<AnimationComponent>(2, 15, true);

    constexpr int radarTexSize{64};
    constexpr int radarPxOffset{10};
    const std::string radarId{"radar-image"};
    m_assetStore->AddTexture(m_renderer, radarId, "./assets/images/radar.png");
    Entity radar{m_registry->CreateEntity()};
    radar.AddComponent<TransformComponent>(
        glm::vec2{windowWidth - (radarTexSize + radarPxOffset), radarPxOffset}, glm::vec2{1.0, 1.0}, 0.0);
    radar.AddComponent<RigidBodyComponent>(glm::vec2{00.0, 0.0});
    radar.AddComponent<SpriteComponent>(radarId, radarTexSize, radarTexSize, 2);
    radar.AddComponent<AnimationComponent>(8, 5, true);

    const std::string tankId{"tank-image"};
    m_assetStore->AddTexture(m_renderer, tankId, "./assets/images/tank-panther-right.png");
    Entity tank{m_registry->CreateEntity()};
    tank.AddComponent<TransformComponent>(glm::vec2{100.0, 10.0}, glm::vec2{1.0, 1.0}, 0.0);
    tank.AddComponent<RigidBodyComponent>(glm::vec2{-30.0, 0.0});
    tank.AddComponent<SpriteComponent>(tankId, texSizeBase, texSizeBase, 1);
    tank.AddComponent<BoxColliderComponent>(texSizeBase, texSizeBase);

    const std::string truckId{"truck-image"};
    m_assetStore->AddTexture(m_renderer, truckId, "./assets/images/truck-ford-right.png");
    Entity truck{m_registry->CreateEntity()};
    truck.AddComponent<TransformComponent>(glm::vec2{10.0, 10.0}, glm::vec2{1.0, 1.0}, 0.0);
    truck.AddComponent<RigidBodyComponent>(glm::vec2{20.0, 0.0});
    truck.AddComponent<SpriteComponent>(truckId, texSizeBase, texSizeBase, 1);
    truck.AddComponent<BoxColliderComponent>(texSizeBase, texSizeBase);
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

    m_registry->GetSystem<DamageSystem>().SubscribeToEvents(m_eventBus);

    m_registry->Update();

    m_registry->GetSystem<MovementSystem>().Update(deltaTime);
    m_registry->GetSystem<AnimationSystem>().Update();
    m_registry->GetSystem<CollisionSystem>().Update(m_eventBus);
}

void Game::Render()
{
    SDL_SetRenderDrawColor(m_renderer, 21, 21, 21, 255);
    SDL_RenderClear(m_renderer);

    m_registry->GetSystem<RenderSystem>().Update(m_renderer, m_assetStore);
    if (m_isDebug)
    {
        m_registry->GetSystem<RenderCollisionSystem>().Update(m_renderer);
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