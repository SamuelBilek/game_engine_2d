#include "Game.h"
#include <SDL.h>
#include <SDL_image.h>
#include <glm.hpp>
#include <iostream>

Game::Game() : m_isRunning{false}
{
    std::cout << "Game constructor called!" << std::endl;
}
Game::~Game()
{
}
void Game::Initialize()
{
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0)
    {
        std::cerr << "Error initializing SDL." << std::endl;
        return;
    }

    SDL_DisplayMode displayMode{};
    SDL_GetCurrentDisplayMode(0, &displayMode);
    windowWidth = displayMode.w;
    windowHeight = displayMode.h;
    m_window = SDL_CreateWindow(nullptr, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, windowWidth, windowHeight,
                                SDL_WINDOW_BORDERLESS);

    if (!m_window)
    {
        std::cerr << "Error creating SDL window." << std::endl;
        return;
    }

    m_renderer = {
        SDL_CreateRenderer(m_window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)}; // GPU acc + Vsync
    if (!m_renderer)
    {
        std::cerr << "Error creating SDL Renderer." << std::endl;
    }

    SDL_SetWindowFullscreen(m_window, SDL_WINDOW_FULLSCREEN);

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
                return;
            }
        }
    }
}

glm::vec2 playerPosition{};
glm::vec2 playerVelocity{};

void Game::Setup()
{
    playerPosition = glm::vec2(10.0, 20.0);
    playerVelocity = glm::vec2(100.0, 0.0);
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

    playerPosition.x += playerVelocity.x * deltaTime;
    playerPosition.y += playerVelocity.y * deltaTime;
}

void Game::Render()
{
    SDL_SetRenderDrawColor(m_renderer, 21, 21, 21, 255);
    SDL_RenderClear(m_renderer);

    // Draw a PNG texture
    SDL_Surface* surface{IMG_Load("./assets/images/tank-tiger-right.png")};
    SDL_Texture* texture{SDL_CreateTextureFromSurface(m_renderer, surface)};
    SDL_FreeSurface(surface);

    SDL_Rect dstRect{static_cast<int>(playerPosition.x), static_cast<int>(playerPosition.y), 32, 32};
    // Copy entire source texture into dstRect
    SDL_RenderCopy(m_renderer, texture, nullptr, &dstRect);
    SDL_DestroyTexture(texture);

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