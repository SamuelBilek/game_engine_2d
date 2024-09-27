#ifndef ASSETSTORE_H
#define ASSETSTORE_H

#include "SDL.h"
#include <string>
#include <map>

class AssetStore
{
private:
	std::map<std::string, SDL_Texture*> textures;
	// TODO: Add fonts and sounds
public:
	AssetStore();
	~AssetStore();

	void ClearAssets();
	void AddTexture(SDL_Renderer* renderer, const std::string& assetId, const std::string& filePath);
	SDL_Texture* GetTexture(const std::string& assetId) const;
};

#endif // ASSETSTORE_H