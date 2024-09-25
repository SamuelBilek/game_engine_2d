#ifndef GAME_H
#define GAME_H

#include "../ECS/ECS.h"
#include <SDL.h>
#include <memory>

const int FPS = 60;
const int MILISECS_PER_FRAME = 1000 / FPS;

class Game
{
private:
	bool isRunning;
	int miliscesPreviousFrame;
	SDL_Window* window;
	SDL_Renderer* renderer;

	std::unique_ptr<Registry> registry;

public:
	Game();
	~Game();

	void Initialize();
	void Setup();
	void Run();
	void ProcessInput();
	void Update();
	void Render();
	void Destroy();

	int windowWidth;
	int windowHeigth;
};

#endif