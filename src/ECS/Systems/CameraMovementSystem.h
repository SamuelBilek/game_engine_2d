#pragma once

#include "../Components/CameraFollowComponent.h"
#include "../Components/TransformComponent.h"
#include "../ECS.h"

class CameraMovementSystem : public System
{
  public:
    CameraMovementSystem()
    {
        RequireComponent<CameraFollowComponent>();
        RequireComponent<TransformComponent>();
    }

    void Update(SDL_Rect& camera)
    {
        for (auto& entity : GetSystemEntities())
        {
            const auto& transform{entity.GetComponent<TransformComponent>()};

            if (transform.position.x + (camera.w / 2) < Game::s_mapWidth)
            {
                camera.x = transform.position.x - (Game::s_windowWidth / 2);
            }

            camera.x = camera.x < 0 ? 0 : camera.x;
            camera.x = camera.x > camera.w ? camera.w : camera.x;

            if (transform.position.y + (camera.h / 2) < Game::s_mapHeigth)
            {
                camera.y = transform.position.y - (Game::s_windowHeight / 2);
            }

            camera.y = camera.y < 0 ? 0 : camera.y;
            camera.y = camera.y > camera.h ? camera.h : camera.y;
        }
    }
};