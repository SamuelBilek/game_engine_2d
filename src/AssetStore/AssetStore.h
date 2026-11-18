#pragma once

#include <SDL.h>
#include <map>
#include <string>

class AssetStore
{
  private:
    std::map<std::string, SDL_Texture*> m_textures{};

    // Private constructor for singleton
    AssetStore();

  public:
    ~AssetStore();

    static AssetStore& GetInstance();

    void ClearAssets();
    void AddTexture(SDL_Renderer* renderer, const std::string& assetId, const char* const filePath);
    SDL_Texture* GetTexture(const std::string& assetId);
};