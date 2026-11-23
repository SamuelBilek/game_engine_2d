local tilemap_texture_id = "tilemap-texture"
local chopper_texture_id = "chopper-texture"
local takeoff_texture_id = "takeoff-texture"
local tank_texture_id = "tank-texture"
local truck_texture_id = "truck-texture"
local radar_texture_id = "radar-texture"
local bullet_texture_id = "bullet-texture"
local tree_texture_id = "tree-texture"

local charriot11_font_id = "charriot11-font"
local charriot20_font_id = "charriot20-font"


Level = {
    assets = {
        [0] =
        { type = "texture", id = tilemap_texture_id, file = "./assets/tilemaps/jungle.png" },
        { type = "texture", id = chopper_texture_id, file = "./assets/images/chopper-spritesheet.png" },
        { type = "texture", id = takeoff_texture_id, file = "./assets/images/base-takeoff.png" },
        { type = "texture", id = tank_texture_id,    file = "./assets/images/tank-tiger-right.png" },
        { type = "texture", id = truck_texture_id,   file = "./assets/images/truck-ford-left.png" },
        { type = "texture", id = radar_texture_id,   file = "./assets/images/radar.png" },
        { type = "texture", id = bullet_texture_id,  file = "./assets/images/bullet.png" },
        { type = "texture", id = tree_texture_id,    file = "./assets/images/tree.png" },
        { type = "font",    id = charriot11_font_id, file = "./assets/fonts/charriot.ttf",            font_size = 11 },
        { type = "font",    id = charriot20_font_id, file = "./assets/fonts/charriot.ttf",            font_size = 20 },
    },

    tilemap = {
        map_file = "./assets/tilemaps/jungle.map",
        texture_asset_id = tilemap_texture_id,
        tile_size = 32,
        scale = 2.0,
    },

    entities = {
        [0] =
        {
            -- Player
            tag = "player",
            components = {
                transform = {
                    position = { x = 242, y = 110 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 0.0, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = chopper_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 4,
                    fixed = false,
                    src_rect_x = 0,
                    src_rect_y = 0
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 25,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot11_font_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 200, y = 200 },
                    projectile_duration = 10, -- seconds
                    repeat_frequency = 0,     -- seconds
                    hit_percentage_damage = 10,
                    friendly = true
                },
                keyboard_controller = {
                    up_velocity = { x = 0, y = -50 },
                    right_velocity = { x = 50, y = 0 },
                    down_velocity = { x = 0, y = 50 },
                    left_velocity = { x = -50, y = 0 }
                },
                camera_follow = {
                    follow = true
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 200, y = 497 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 0, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot11_font_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 100, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 20,
                    friendly = false
                }
            }
        }
    }
}
