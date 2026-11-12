#include "AssetStore.h"
#include "../Logger/Logger.h"
#include <SDL.h>
#include <SDL_image.h>
#include <map>
#include <string>

AssetStore::AssetStore()
{
    Logger::Log("Asset Store constructor called!");
}

AssetStore::~AssetStore()
{
    ClearAssets();
    Logger::Log("Asset Store destructor called!");
}

void AssetStore::ClearAssets()
{
    for (auto& texture : m_textures)
    {
        SDL_DestroyTexture(texture.second);
    }
    m_textures.clear();
}

void AssetStore::AddTexture(SDL_Renderer* renderer, const std::string& assetId, const char* const filePath)
{
    SDL_Surface* surface{IMG_Load(filePath)};
    SDL_Texture* texture{SDL_CreateTextureFromSurface(renderer, surface)};
    SDL_FreeSurface(surface);

    m_textures.emplace(assetId, texture);

    Logger::Log("New texture added to the Asset Store with id = " + assetId);
}

SDL_Texture* AssetStore::GetTexture(const std::string& assetId)
{
    return m_textures[assetId];
}