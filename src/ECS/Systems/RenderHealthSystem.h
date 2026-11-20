#pragma once

#include "../../AssetStore/AssetStore.h"
#include "../Components/HealthComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"
#include "SDL.h"
#include <algorithm>

class RenderHealthSystem : public System
{
  public:
    RenderHealthSystem()
    {
        RequireComponent<TransformComponent>();
        RequireComponent<HealthComponent>();
    }

    void Update(SDL_Renderer* renderer, SDL_Rect& camera)
    {
        for (const auto& entity : GetSystemEntities())
        {
            const auto& transform{entity.GetComponent<TransformComponent>()};
            const auto& health{entity.GetComponent<HealthComponent>()};

            int healthBarOffset{0};

            if (health.percentageDisplay)
            {
                const auto& percentageDisplay{health.percentageDisplay.value()};
                SDL_Surface* surface{TTF_RenderText_Blended(AssetStore::GetInstance().GetFont(percentageDisplay.fontId),
                                                            std::to_string(health.healthPercentage).c_str(),
                                                            GetPercentageColor(health.healthPercentage))};
                SDL_Texture* texture{SDL_CreateTextureFromSurface(renderer, surface)};
                SDL_FreeSurface(surface);

                int labelWidth{};
                int labelHeigth{};

                SDL_QueryTexture(texture, nullptr, nullptr, &labelWidth, &labelHeigth);

                SDL_Rect dstRect{static_cast<int>(transform.position.x - camera.x),
                                 static_cast<int>(transform.position.y - camera.y),
                                 labelWidth,
                                 labelHeigth};

                SDL_RenderCopy(renderer, texture, nullptr, &dstRect);
                SDL_DestroyTexture(texture);

                healthBarOffset += labelHeigth / 2;
            }

            if (health.barDisplay)
            {
                const auto& barDisplay{health.barDisplay.value()};
                SDL_Rect healthBar{
                    static_cast<int>(transform.position.x - camera.x),
                    static_cast<int>(transform.position.y - healthBarOffset - camera.y),
                    static_cast<int>(GetBarLength(health.healthPercentage, barDisplay.maxWidth) * transform.scale.x),
                    static_cast<int>(barDisplay.maxHeight * transform.scale.y),
                };
                auto color{GetPercentageColor(health.healthPercentage)};
                SDL_SetRenderDrawColor(renderer, color.r, color.g, color.b, 255);
                SDL_RenderFillRect(renderer, &healthBar);
            }
        }
    }

  private:
    SDL_Color GetPercentageColor(int percentage)
    {
        if (percentage > 75)
        {
            return {0, 255, 0};
        }
        if (percentage > 40)
        {
            return {255, 255, 0};
        }
        return {255, 0, 0};
    }

    int GetBarLength(int percentage, int maxLenght)
    {
        int length{(maxLenght * percentage) / 100};
        return std::min(maxLenght, length);
    }
};