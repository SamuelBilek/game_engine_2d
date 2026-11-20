#pragma once

#include <SDL.h>
#include <SDL_ttf.h>
#include <map>
#include <string>

class AssetStore
{
  private:
    std::map<std::string, SDL_Texture*> m_textures{};
    std::map<std::string, TTF_Font*> m_fonts{};

    // Private constructor for singleton
    AssetStore();

  public:
    ~AssetStore();

    static AssetStore& GetInstance();

    void ClearAssets();
    void AddTexture(SDL_Renderer* renderer, const std::string& assetId, const char* const filePath);
    SDL_Texture* GetTexture(const std::string& assetId);

    void AddFont(const std::string& assetId, const char* const filePath, int fontSize);
    TTF_Font* GetFont(const std::string& assetId);
};