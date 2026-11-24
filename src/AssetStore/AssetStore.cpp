#include "AssetStore.h"
#include "../Logger/Logger.h"
#include <SDL.h>
#include <SDL_image.h>
#include <map>
#include <string>

AssetStore::AssetStore()
{
}

AssetStore::~AssetStore()
{
    ClearAssets();
}

AssetStore& AssetStore::GetInstance()
{
    static AssetStore assetStore{};
    return assetStore;
}

void AssetStore::ClearAssets()
{
    for (auto& texture : m_textures)
    {
        SDL_DestroyTexture(texture.second);
    }
    m_textures.clear();

    for (auto& font : m_fonts)
    {
        TTF_CloseFont(font.second);
    }
    m_fonts.clear();
}

void AssetStore::AddTexture(SDL_Renderer* renderer, const std::string& assetId, const char* const filePath)
{
    SDL_Surface* surface{IMG_Load(filePath)};
    SDL_Texture* texture{SDL_CreateTextureFromSurface(renderer, surface)};
    SDL_FreeSurface(surface);

    m_textures.emplace(assetId, texture);

    Logger::Debug("New texture added to the Asset Store with id = " + assetId);
}

SDL_Texture* AssetStore::GetTexture(const std::string& assetId)
{
    return m_textures[assetId];
}

void AssetStore::AddFont(const std::string& assetId, const char* const filePath, int fontSize)
{
    m_fonts.emplace(assetId, TTF_OpenFont(filePath, fontSize));
}

TTF_Font* AssetStore::GetFont(const std::string& assetId)
{
    return m_fonts[assetId];
}