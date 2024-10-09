#include "Game.h"
#include "../Logger/Logger.h"
#include "../ECS/ECS.h"
#include "../Components/TransformComponent.h"
#include "../Components/RigidBodyComponent.h"
#include "../Components/SpriteComponent.h"
#include "../Systems/MovementSystem.h"
#include "../Systems/RenderSystem.h"
#include "SDL.h"
#include "SDL_image.h"
#include <glm/glm.hpp>
#include <iostream>
#include <fstream>

Game::Game() {
	isRunning = false;
	Logger::Log("Game constructor called!");
	registry = std::make_unique<Registry>();
	assetStore = std::make_unique<AssetStore>();
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

void Game::LoadLevel(int level) {
	// Adding systems to the game
	registry->AddSystem<MovementSystem>();
	registry->AddSystem<RenderSystem>();

	// Adding assets to the asset store
	assetStore->AddTexture(renderer, "tank-image", "./assets/images/tank-panther-right.png");
	assetStore->AddTexture(renderer, "truck-image", "./assets/images/truck-ford-right.png");
	assetStore->AddTexture(renderer, "tilemap-image", "./assets/tilemaps/jungle.png");

	// Load tilemap
	int tileSize = 32;
	double tileScale = 2.5;
	int mapNumCols = 25;
	int mapNumRows = 20;

	std::fstream mapFile;
	mapFile.open("./assets/tilemaps/jungle.map");
	if (!mapFile) {
		Logger::Err("Error loading tilemap file.");
		return;
	}
	else {
		for (int row = 0; row < mapNumRows; row++) {
			for (int col = 0; col < mapNumCols; col++) {
				char ch;
				mapFile.get(ch);
				int sourceRectY = atoi(&ch) * tileSize;
				mapFile.get(ch);
				int sourceRectX = atoi(&ch) * tileSize;
				mapFile.ignore();

				Entity tile = registry->CreateEntity();
				tile.AddComponent<TransformComponent>(
					glm::vec2(col * tileSize * tileScale, row * tileSize * tileScale),
					glm::vec2(tileScale, tileScale),
					0.0
				);
				tile.AddComponent<SpriteComponent>("tilemap-image", tileSize, tileSize, 0, sourceRectX, sourceRectY);
			}
		}
		mapFile.close();
	}
	
	// Create an entity
	Entity tank = registry->CreateEntity();
	// Add components to the entity
	tank.AddComponent<TransformComponent>(glm::vec2(10.0, 10.0), glm::vec2(1.0, 1.0), 0.0);
	tank.AddComponent<RigidBodyComponent>(glm::vec2(40.0, 0.0));
	tank.AddComponent<SpriteComponent>("tank-image", 32, 32, 2);

	Entity truck = registry->CreateEntity();
	truck.AddComponent<TransformComponent>(glm::vec2(50.0, 100.0), glm::vec2(1.0, 1.0), 0.0);
	truck.AddComponent<RigidBodyComponent>(glm::vec2(0.0, 50.0));
	truck.AddComponent<SpriteComponent>("truck-image", 32, 32, 1);
}

void Game::Setup() {
	LoadLevel(1);
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

	// Update all systems that need an update
	registry->GetSystem<MovementSystem>().Update(deltaTime);

	// Update the registry to create and destroy entities that are pending
	registry->Update();

	// TODO:
	// movementSystem.Update();
	// collisionSystem.Update();
	// damageSystem.Update();
}

void Game::Render() {
	SDL_SetRenderDrawColor(renderer, 21, 21, 21, 255);
	SDL_RenderClear(renderer);

	// Update all systems that need an update
	registry->GetSystem<RenderSystem>().Update(renderer, assetStore);
	
	SDL_RenderPresent(renderer);
}

void Game::Destroy() {
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();

}