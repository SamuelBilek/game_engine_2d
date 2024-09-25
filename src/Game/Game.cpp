#include "Game.h"
#include "../Logger/Logger.h"
#include "../ECS/ECS.h"
#include "../Components/TransformComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "SDL.h"
#include "SDL_image.h"
#include <glm/glm.hpp>
#include <iostream>

Game::Game() {
	isRunning = false;
	registry = std::make_unique<Registry>();
	Logger::Log("Game constructor called!");
}

Game::~Game() {
	Logger::Log("Game destructor called!");
}

void Game::Initialize() {
	if (SDL_Init(SDL_INIT_EVERYTHING) != 0) {
		Logger::Err("Error initializing SDL.");
		return;
	}

	SDL_DisplayMode displayMode;
	SDL_GetCurrentDisplayMode(0, &displayMode);
	windowWidth = displayMode.w;
	windowHeigth = displayMode.h;

	window = SDL_CreateWindow(
		NULL, 
		SDL_WINDOWPOS_CENTERED, 
		SDL_WINDOWPOS_CENTERED, 
		windowWidth,
		windowHeigth,
		SDL_WINDOW_BORDERLESS
	);
	if (!window) {
		Logger::Err("Error creating SDL window.");
		return;
	}

	renderer = SDL_CreateRenderer(
		window, 
		-1, 
		SDL_RENDERER_PRESENTVSYNC
	);
	if (!renderer) {
		Logger::Err("Error creating SDL renderer.");
		return;
	}

	SDL_SetWindowFullscreen(window, SDL_WINDOW_FULLSCREEN);

	isRunning = true;
}

void Game::Setup() {
	// Create an entity
	Entity tank = registry->CreateEntity();

	// Add components to the entity
	registry->AddComponent<TransformComponent>(tank, glm::vec2(10.0, 30.0), glm::vec2(1.0, 1.0), glm::vec2(0.0, 0.0));
	registry->AddComponent<RigidBodyComponent>(tank, glm::vec2(50.0, 0.0));
	
}

void Game::Run() {
	Setup();
	while (isRunning) {
		ProcessInput();
		Update();
		Render();
	}
}

void Game::ProcessInput() {
	SDL_Event sdlEvent;
	while (SDL_PollEvent(&sdlEvent)) {
		switch (sdlEvent.type) {
		case SDL_QUIT:
			isRunning = false;
			break;
		case SDL_KEYDOWN:
			if (sdlEvent.key.keysym.sym == SDLK_ESCAPE) {
				isRunning = false;
			}
			break;
		}
	}
}

void Game::Update() {
	Uint32 miliscesCurrentFrame = SDL_GetTicks();
	// Difference of time in seconds from the last frame to the current frame
	double deltaTime = (miliscesCurrentFrame - miliscesPreviousFrame) / 1000.0;

	// Store the current frame time
	miliscesPreviousFrame = miliscesCurrentFrame;

	// If we are too fast, we need to waste some time before the next frame
	int timeToWait = MILISECS_PER_FRAME - (deltaTime * 1000); // deltaTime is in seconds
	if (timeToWait > 0 && timeToWait <= MILISECS_PER_FRAME) {
		SDL_Delay(timeToWait);
	}

	// TODO:
	// movementSystem.Update();
	// collisionSystem.Update();
	// damageSystem.Update();
}

void Game::Render() {
	SDL_SetRenderDrawColor(renderer, 21, 21, 21, 255);
	SDL_RenderClear(renderer);

	// TODO: Render game objects
	
	SDL_RenderPresent(renderer);
}

void Game::Destroy() {
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();

}