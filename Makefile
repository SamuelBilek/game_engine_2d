CXX = g++

DIST_DIR = dist

ASSET_DIR = assets

LIBS_DIR = libs
SDL_DIR = $(LIBS_DIR)/SDL2
GLM_DIR = $(LIBS_DIR)/glm
IMGUI_DIR = $(LIBS_DIR)/imgui
LUA_DIR = $(LIBS_DIR)/lua
SOL_DIR = $(LIBS_DIR)/sol

DBGFLAGS = -g -O0

# We provide both the top level libs dir and individual subdirs
# We want to include like <sol.hpp> but some library code uses <sol/sol.hpp> etc.
CXXFLAGS = -std=c++20 -Wall \
            $(DBGFLAGS)\
		   -I$(LIBS_DIR) \
           -I$(GLM_DIR) \
		   -I$(IMGUI_DIR) \
		   -I$(LUA_DIR) \
		   -I$(SOL_DIR) \
           -I$(SDL_DIR)/include/SDL2

LDFLAGS = -L$(SDL_DIR)/lib -L$(LUA_DIR)

LD_SDL = -lmingw32 -lSDL2main -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2
LDLIBS = $(LD_SDL) -llua54

build:
	mkdir -p $(DIST_DIR)

	$(CXX) $(CXXFLAGS) src/*.cpp $(LDFLAGS) $(LDLIBS) -o $(DIST_DIR)/gameengine.exe

	cp -r $(SDL_DIR)/bin/* $(DIST_DIR)/
	cp -r $(LUA_DIR)/*.dll $(DIST_DIR)/

	mkdir -p $(DIST_DIR)/$(ASSET_DIR)
	cp -r $(ASSET_DIR)/* $(DIST_DIR)/$(ASSET_DIR)/

run:
	./$(DIST_DIR)/gameengine.exe

clean:
	rm -rf $(DIST_DIR)