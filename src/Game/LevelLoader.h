#pragma once
#include <SDL.h>

class LevelLoader
{
  private:
    // Private constructor for singleton
    LevelLoader()
    {
    }

  public:
    static LevelLoader& GetInstance()
    {
        static LevelLoader levelLoader{};
        return levelLoader;
    }

    void LoadLevel(const char* levelFile, SDL_Renderer* renderer);
};