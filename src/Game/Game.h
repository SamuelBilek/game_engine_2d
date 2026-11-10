#pragma once

#include "../ECS/ECS.h"
#include <SDL.h>
#include <memory>

inline constexpr int FPS{60};
inline constexpr int MILISECS_PER_FRAME{1000 / FPS};

class Game
{
  private:
    bool m_isRunning{false};
    int m_milisecsPreviousFrame{0};
    SDL_Window* m_window{nullptr};
    SDL_Renderer* m_renderer{nullptr};

    std::unique_ptr<Registry> m_registry{};

  public:
    Game();
    ~Game();
    void Initialize();
    void Setup();
    void Run();
    void ProcessInput();
    void Update();
    void Render();
    void Destroy();

    int windowWidth{};
    int windowHeight{};
};