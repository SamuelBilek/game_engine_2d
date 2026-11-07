#include <iostream>
#include <SDL.h>
#include <SDL_image.h>
#include <SDL_mixer.h>
#include <SDL_ttf.h>
#include <glm.hpp>
#include <imgui.h>
#include <lua.hpp>
#include <sol.hpp>

int main(int argc, char* argv[]) {
    sol::state lua;
    lua.open_libraries(sol::lib::base);

    SDL_Init(SDL_INIT_EVERYTHING);
    glm::vec2 velocity{5.0, -2.0};

    std::cout << "Hello, world!" << std::endl;
    return 0;
}
