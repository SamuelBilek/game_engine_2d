#include "Game.h"
#include "../AssetStore/AssetStore.h"
#include "../ECS/Components/AnimationComponent.h"
#include "../ECS/Components/ProjectileEmitterComponent.h"
#include "../ECS/Components/SpriteComponent.h"
#include "../ECS/Components/TextLabelComponent.h"
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
#include "../ECS/Systems/RenderGUISystem.h"
#include "../ECS/Systems/RenderHealthSystem.h"
#include "../ECS/Systems/RenderSystem.h"
#include "../ECS/Systems/RenderTextSystem.h"
#include "../Events/KeyPressedEvent.h"
#include "../Logger/Logger.h"
#include "LevelLoader.h"
#include <SDL.h>
#include <SDL_image.h>
#include <algorithm>
#include <imgui.h>
#include <imgui_impl_sdl2.h>
#include <imgui_impl_sdlrenderer2.h>

Game::Game()
{
}
Game::~Game()
{
}
void Game::Initialize()
{
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0)
    {
        Logger::Err("Error initializing SDL.");
        return;
    }

    if (TTF_Init() != 0)
    {
        Logger::Err("Error initializing SDL TTF.");
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

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    [[maybe_unused]] ImGuiIO& io{ImGui::GetIO()};
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;

    ImGui::StyleColorsDark();

    ImGui_ImplSDL2_InitForSDLRenderer(m_window, m_renderer);
    ImGui_ImplSDLRenderer2_Init(m_renderer);

    // Initialize the camera
    m_camera.x = 0;
    m_camera.y = 0;
    m_camera.w = s_windowWidth;
    m_camera.h = s_windowHeight;

    // SDL_SetWindowFullscreen(m_window, SDL_WINDOW_FULLSCREEN);

    m_isRunning = true;
}

void Game::ProcessInput()
{
    SDL_Event sdlEvent{};
    while (SDL_PollEvent(&sdlEvent))
    {
        ImGui_ImplSDL2_ProcessEvent(&sdlEvent);
        ImGuiIO& io{ImGui::GetIO()};

        int mouseX{};
        int mouseY{};
        const int buttons{static_cast<int>(SDL_GetMouseState(&mouseX, &mouseY))};
        io.MousePos = ImVec2{static_cast<float>(mouseX), static_cast<float>(mouseY)};
        io.MouseDown[0] = buttons & SDL_BUTTON(SDL_BUTTON_LEFT);
        io.MouseDown[1] = buttons & SDL_BUTTON(SDL_BUTTON_RIGHT);

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
            if (sdlEvent.key.keysym.sym == SDLK_F1)
            {
                m_isDebug = !m_isDebug;
            }
            EventBus::GetInstance().EmitEvent<KeyPressedEvent>(sdlEvent.key.keysym.sym);
            break;
        }
    }
}

void Game::Setup()
{
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
    registryInstance.AddSystem<RenderTextSystem>();
    registryInstance.AddSystem<RenderHealthSystem>();
    registryInstance.AddSystem<RenderGUISystem>();

    LevelLoader::GetInstance().LoadLevel("./assets/scripts/Level1.lua", m_renderer);
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

    auto& eventBusInstance{EventBus::GetInstance()};
    eventBusInstance.Reset();

    auto& registryInstance{Registry::GetInstance()};

    registryInstance.GetSystem<MovementSystem>().SubscribeToEvents();
    registryInstance.GetSystem<DamageSystem>().SubscribeToEvents();
    registryInstance.GetSystem<KeyboardControlSystem>().SubscribeToEvents();
    registryInstance.GetSystem<ProjectileEmitSystem>().SubscribeToEvents();

    registryInstance.Update();

    registryInstance.GetSystem<MovementSystem>().Update(deltaTime);
    registryInstance.GetSystem<AnimationSystem>().Update();
    registryInstance.GetSystem<CollisionSystem>().Update();
    registryInstance.GetSystem<ProjectileEmitSystem>().Update();
    registryInstance.GetSystem<ProjectileLifecycleSystem>().Update();
    registryInstance.GetSystem<CameraMovementSystem>().Update(m_camera);
}

void Game::Render()
{
    SDL_SetRenderDrawColor(m_renderer, 21, 21, 21, 255);
    SDL_RenderClear(m_renderer);

    auto& registryInstance{Registry::GetInstance()};

    registryInstance.GetSystem<RenderSystem>().Update(m_renderer, m_camera);
    registryInstance.GetSystem<RenderHealthSystem>().Update(m_renderer, m_camera);
    registryInstance.GetSystem<RenderTextSystem>().Update(m_renderer, m_camera);
    if (m_isDebug)
    {
        registryInstance.GetSystem<RenderCollisionSystem>().Update(m_renderer, m_camera);

        registryInstance.GetSystem<RenderGUISystem>().Update(m_renderer, m_camera);
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
    ImGui_ImplSDLRenderer2_Shutdown();
    ImGui_ImplSDL2_Shutdown();
    ImGui::DestroyContext();

    SDL_DestroyRenderer(m_renderer);
    m_renderer = nullptr;
    SDL_DestroyWindow(m_window);
    m_window = nullptr;
    SDL_Quit();
}