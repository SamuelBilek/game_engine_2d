CXX = g++
SRC = $(shell find src -name '*.cpp')
EXEC_NAME = gameengine.exe

BUILD ?= debug

DIST_DIR = dist
ASSET_DIR = assets
LIBS_DIR = libs
SDL_DIR = $(LIBS_DIR)/SDL2
GLM_DIR = $(LIBS_DIR)/glm
IMGUI_DIR = $(LIBS_DIR)/imgui
LUA_DIR = $(LIBS_DIR)/lua
SOL_DIR = $(LIBS_DIR)/sol

IMGUI_SRC = $(shell find $(IMGUI_DIR) -name '*.cpp')

ifeq ($(BUILD), debug)
	DBGFLAGS = -g -O0 -DDEBUG
else ifeq ($(BUILD), release)
	DBGFLAGS = -O2 -DNDEBUG
else
	$(error Uknown build configuration: $(BUILD))
endif

# We provide both the top level libs dir and individual subdirs
# We want to include like <sol.hpp> but some library code uses <sol/sol.hpp> etc.
CXXFLAGS = -std=c++20 -Wall -Wfatal-errors \
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

	$(CXX) $(CXXFLAGS) $(SRC) $(IMGUI_SRC) $(LDFLAGS) $(LDLIBS) -o $(DIST_DIR)/$(EXEC_NAME)

	cp -r $(SDL_DIR)/bin/* $(DIST_DIR)/
	cp -r $(LUA_DIR)/*.dll $(DIST_DIR)/

	mkdir -p $(DIST_DIR)/$(ASSET_DIR)
	cp -r $(ASSET_DIR)/* $(DIST_DIR)/$(ASSET_DIR)/

run:
	./$(DIST_DIR)/$(EXEC_NAME)

clean:
	rm -rf $(DIST_DIR)