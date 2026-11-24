#pragma once

#include "../../ECS/Components/BoxColliderComponent.h"
#include "../../ECS/Components/HealthComponent.h"
#include "../../ECS/Components/ProjectileEmitterComponent.h"
#include "../../ECS/Components/RigidBodyComponent.h"
#include "../../ECS/Components/SpriteComponent.h"
#include "../../ECS/Components/TransformComponent.h"
#include "../ECS.h"
#include <cmath>
#include <imgui.h>
#include <imgui_impl_sdl2.h>
#include <imgui_impl_sdlrenderer2.h>
#include <iostream>

class RenderGUISystem : public System
{
  public:
    RenderGUISystem() = default;

    void Update(SDL_Renderer* renderer, const SDL_Rect& camera)
    {
        ImGui_ImplSDLRenderer2_NewFrame();
        ImGui_ImplSDL2_NewFrame();
        ImGui::NewFrame();

        if (ImGui::Begin("Spawn enemies"))
        {
            // Copied from Game.cpp, should be refactored :(
            static const std::string healthPercantageFontId{"charriot11-font"};
            static constexpr int texSizeBase{32};
            static const std::string tankImageId{"tank-image"};
            const std::string truckImageId{"truck-image"};
            static const std::string projectileImageId{"bullet-image"};

            // sprite
            const char* sprites[]{tankImageId.c_str(), truckImageId.c_str()};
            static int selectedSpriteIndex{0};
            if (ImGui::CollapsingHeader("Sprite", ImGuiTreeNodeFlags_DefaultOpen))
            {
                ImGui::Combo("texture id", &selectedSpriteIndex, sprites, IM_ARRAYSIZE(sprites));
            }
            ImGui::Spacing();

            // transform
            static int posX{};
            static int posY{};
            static float rotationRads{};
            static int scaleX{1};
            static int scaleY{1};
            if (ImGui::CollapsingHeader("Transform", ImGuiTreeNodeFlags_DefaultOpen))
            {
                ImGui::InputInt("position x", &posX);
                ImGui::InputInt("position y", &posY);
                ImGui::SliderInt("scale x", &scaleX, 1, 10);
                ImGui::SliderInt("scale y", &scaleY, 1, 10);
                ImGui::SliderAngle("rotation (deg)", &rotationRads, 0, 360);
            }
            ImGui::Spacing();

            // rigidbody
            static int velX{};
            static int velY{};
            if (ImGui::CollapsingHeader("Rigidbody", ImGuiTreeNodeFlags_DefaultOpen))
            {
                ImGui::InputInt("velocity x", &velX);
                ImGui::InputInt("velocity y", &velY);
            }
            ImGui::Spacing();

            // projectiles
            static float projAngleRads{};
            static float projSpeed{100};
            static int projRepeat{10};
            static int projDuration{10};
            if (ImGui::CollapsingHeader("Projectile emitter", ImGuiTreeNodeFlags_DefaultOpen))
            {
                ImGui::SliderAngle("angle (deg)", &projAngleRads, 0, 360);
                ImGui::SliderFloat("speed (px/sec)", &projSpeed, 10, 500);
                ImGui::InputInt("repeat (sec)", &projRepeat);
                ImGui::InputInt("duration (sec)", &projDuration);
            }
            ImGui::Spacing();

            // health
            static int health{100};
            if (ImGui::CollapsingHeader("Health", ImGuiTreeNodeFlags_DefaultOpen))
            {
                ImGui::InputInt("health %", &health);
            }
            ImGui::Spacing();

            if (ImGui::Button("Create new enemy"))
            {
                auto& registryInstance{Registry::GetInstance()};
                Entity enemy{registryInstance.CreateEntity()};
                enemy.Group(Groups::ENEMIES);
                enemy.AddComponent<TransformComponent>(
                    glm::vec2{posX, posY}, glm::vec2{scaleX, scaleY}, glm::degrees(rotationRads));
                enemy.AddComponent<RigidBodyComponent>(glm::vec2{velX, velY});
                enemy.AddComponent<SpriteComponent>(sprites[selectedSpriteIndex], texSizeBase, texSizeBase, 1);
                enemy.AddComponent<BoxColliderComponent>(texSizeBase, texSizeBase);
                float projVelX{std::cos(projAngleRads) * projSpeed};
                float projVelY{std::sin(projAngleRads) * projSpeed};
                enemy.AddComponent<ProjectileEmitterComponent>(projectileImageId,
                                                               glm::vec2(4, 4),
                                                               glm::vec2(projVelX, projVelY),
                                                               projRepeat * 1000,
                                                               projDuration * 1000,
                                                               10,
                                                               false);
                enemy.AddComponent<HealthComponent>(
                    health, HealthComponent::PercentageDisplay{healthPercantageFontId}, HealthComponent::BarDisplay{});

                // Reset defaults
                posX = posY = rotationRads = projAngleRads = 0;
                scaleX = scaleY = 1;
                projRepeat = projDuration = 10;
                projSpeed = 100;
                health = 100;
            }
        }
        ImGui::End();

        // Mouse coordinates display
        ImGuiWindowFlags windowFlags{ImGuiWindowFlags_NoDecoration | ImGuiWindowFlags_AlwaysAutoResize |
                                     ImGuiWindowFlags_NoNav};
        ImGui::SetNextWindowPos(ImVec2(10, 10), ImGuiCond_Always, ImVec2(0, 0));
        ImGui::SetNextWindowBgAlpha(0.9f);
        if (ImGui::Begin("Map coordinates", nullptr, windowFlags))
        {
            ImGui::Text("Map coordinates (x=%.1f, y=%.1f)",
                        ImGui::GetIO().MousePos.x + camera.x,
                        ImGui::GetIO().MousePos.y + camera.y);
        }
        ImGui::End();

        // Log messages window
        ImGuiIO& io = ImGui::GetIO();

        ImGui::SetNextWindowPos(ImVec2(10, io.DisplaySize.y - 250));
        ImGui::SetNextWindowSize(ImVec2(io.DisplaySize.x - 20, 240));
        if (ImGui::Begin("Log messages"))
        {
            const bool wasAtBottom = ImGui::GetScrollY() >= ImGui::GetScrollMaxY() - 1.0f;
            for (const auto& message : Logger::GetMessages())
            {
                auto color{message.GetColor()};
                ImGui::TextColored(ImVec4{color.r, color.g, color.b, color.a}, "%s", message.message.c_str());
            }

            if (wasAtBottom)
            {
                ImGui::SetScrollHereY(1.0f);
            }
        }
        ImGui::End();

        ImGui::Render();
        ImGui_ImplSDLRenderer2_RenderDrawData(ImGui::GetDrawData(), renderer);
    }
};