#pragma once

#include "../AssetStore/AssetStore.h"
#include "../ECS/ECS.h"
#include "../EventBus/EventBus.h"
#include <SDL.h>
#include <memory>

inline constexpr int FPS{60};
inline constexpr int MILISECS_PER_FRAME{1000 / FPS};

class Game
{
  private:
    bool m_isRunning{false};
    bool m_isDebug{false};
    int m_milisecsPreviousFrame{0};
    SDL_Window* m_window{nullptr};
    SDL_Renderer* m_renderer{nullptr};
    SDL_Rect m_camera{};

    std::unique_ptr<AssetStore> m_assetStore{};
    std::unique_ptr<EventBus> m_eventBus{};

  public:
    Game();
    ~Game();
    void Initialize();
    void LoadLevel(int level);
    void Setup();
    void Run();
    void ProcessInput();
    void Update();
    void Render();
    void Destroy();

    inline static int s_windowWidth{};
    inline static int s_windowHeight{};
    inline static int s_mapWidth{};
    inline static int s_mapHeigth{};
};