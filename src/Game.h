#pragma once

#include <SDL.h>

class Game
{
private:
    bool m_isRunning{false};
    SDL_Window *m_window{nullptr};
    SDL_Renderer *m_renderer{nullptr};

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