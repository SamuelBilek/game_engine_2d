#pragma once

#include "../../AssetStore/AssetStore.h"
#include "../Components/TextLabelComponent.h"
#include "../ECS.h"
#include <SDL.h>
#include <SDL_ttf.h>

class RenderTextSystem : public System
{
  public:
    RenderTextSystem()
    {
        RequireComponent<TextLabelComponent>();
    }

    void Update(SDL_Renderer* renderer, const SDL_Rect& camera)
    {
        for (const auto& entity : GetSystemEntities())
        {
            const auto& textLabel{entity.GetComponent<TextLabelComponent>()};

            SDL_Surface* surface{TTF_RenderText_Blended(
                AssetStore::GetInstance().GetFont(textLabel.assetId), textLabel.text.c_str(), textLabel.color)};
            SDL_Texture* texture{SDL_CreateTextureFromSurface(renderer, surface)};
            SDL_FreeSurface(surface);

            int labelWidth{};
            int labelHeigth{};

            SDL_QueryTexture(texture, nullptr, nullptr, &labelWidth, &labelHeigth);

            SDL_Rect dstRect{static_cast<int>(textLabel.position.x - (textLabel.isFixed ? 0 : camera.x)),
                             static_cast<int>(textLabel.position.y - (textLabel.isFixed ? 0 : camera.y)),
                             labelWidth,
                             labelHeigth};

            SDL_RenderCopy(renderer, texture, nullptr, &dstRect);
            SDL_DestroyTexture(texture);
        }
    }
};