#include <iostream>
#include <SDL.h>
#include <SDL_image.h>
#include <SDL_ttf.h>
#include <SDL_mixer.h>
#include <glm/glm.hpp>
#include <sol/sol.hpp>

int main(int argc, char* argv[]) {
	sol::state lua;
	lua.open_libraries(sol::lib::base);

	glm::vec2 vector(1.0f, 2.0f);
	SDL_Init(SDL_INIT_EVERYTHING);
    std::cout << "Hello, world!" << std::endl;
    return 0;
}