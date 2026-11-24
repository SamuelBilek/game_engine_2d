-- Assets to be loaded
local tilemap_texture_day_id = "tilemap-texture-day"
local tilemap_texture_night_id = "tilemap-texture-night"
local chopper_texture_id = "chopper-texture"
local su27_texture_id = "su27-texture"
local f22_texture_id = "f22-texture"
local fw190_texture_id = "fw190-texture"
local upf7_texture_id = "upf7-texture"
local bf109_texture_id = "bf109-texture"
local bomber_texture_id = "bomber-texture"
local carrier_texture_id = "carrier-texture"
local boat_texture_id = "boat-texture"
local tank_tiger_up_texture_id = "tank-tiger-up-texture"
local tank_tiger_right_texture_id = "tank-tiger-right-texture"
local tank_tiger_down_texture_id = "tank-tiger-down-texture"
local tank_tiger_left_texture_id = "tank-tiger-left-texture"
local tank_tiger_killed_texture_id = "tank-tiger-killed-texture"
local tank_panther_up_texture_id = "tank-panther-up-texture"
local tank_panther_right_texture_id = "tank-panther-right-texture"
local tank_panther_down_texture_id = "tank-panther-down-texture"
local tank_panther_left_texture_id = "tank-panther-left-texture"
local tank_panther_killed_texture_id = "tank-panther-killed-texture"
local truck_ford_up_texture_id = "truck-ford-up-texture"
local truck_ford_right_texture_id = "truck-ford-right-texture"
local truck_ford_down_texture_id = "truck-ford-down-texture"
local truck_ford_left_texture_id = "truck-ford-left-texture"
local truck_ford_killed_texture_id = "truck-ford-killed-texture"
local army_walk_up_texture_id = "army-walk-up-texture"
local army_walk_right_texture_id = "army-walk-right-texture"
local army_walk_down_texture_id = "army-walk-down-texture"
local army_walk_left_texture_id = "army-walk-left-texture"
local army_walk_killed_texture_id = "army-walk-killed-texture"
local army_gun_up_texture_id = "army-gun-up-texture"
local army_gun_right_texture_id = "army-gun-right-texture"
local army_gun_down_texture_id = "army-gun-down-texture"
local army_gun_left_texture_id = "army-gun-left-texture"
local army_gun_killed_texture_id = "army-gun-killed-texture"
local sam_truck_right_texture_id = "sam-truck-right-texture"
local sam_tank_left_texture_id = "sam-tank-left-texture"
local sam_tank_right_texture_id = "sam-tank-right-texture"
local takeoff_base_texture_id = "takeoff-base-texture"
local landing_base_texture_id = "landing-base-texture"
local runway_texture_id = "runway-texture"
local obstacles1_texture_id = "obstacles1-texture"
local obstacles2_texture_id = "obstacles2-texture"
local obstacles3_texture_id = "obstacles3-texture"
local obstacles4_texture_id = "obstacles4-texture"
local obstacles5_texture_id = "obstacles5-texture"
local obstacles6_texture_id = "obstacles6-texture"
local obstacles7_texture_id = "obstacles7-texture"
local tree1_texture_id = "tree1-texture"
local tree2_texture_id = "tree2-texture"
local tree3_texture_id = "tree3-texture"
local tree4_texture_id = "tree4-texture"
local tree5_texture_id = "tree5-texture"
local tree6_texture_id = "tree6-texture"
local tree7_texture_id = "tree7-texture"
local tree8_texture_id = "tree8-texture"
local tree9_texture_id = "tree9-texture"
local tree10_texture_id = "tree10-texture"
local tree11_texture_id = "tree11-texture"
local tree12_texture_id = "tree12-texture"
local tree13_texture_id = "tree13-texture"
local tree14_texture_id = "tree14-texture"
local tree15_texture_id = "tree15-texture"
local tree16_texture_id = "tree16-texture"
local tree17_texture_id = "tree17-texture"
local tree18_texture_id = "tree18-texture"
local tree19_texture_id = "tree19-texture"
local tree20_texture_id = "tree20-texture"
local bullet_texture_id = "bullet-texture"
local radar_texture_id = "radar-texture"
local pico8_font_5_id = "pico8-font-5"
local pico8_font_10_id = "pico8-font-10"
local charriot_font_11_id = "charriot-font-11"
local charriot_font_20_id = "charriot-font-20"


local current_system_hour = os.date("*t").hour
local map_texture_asset_id

if current_system_hour >= 9 and current_system_hour < 18 then
    map_texture_asset_id = tilemap_texture_day_id
else
    map_texture_asset_id = tilemap_texture_night_id
end


-- Define a table with the start values of the first level
Level = {
    ----------------------------------------------------
    -- Table to define the list of assets
    ----------------------------------------------------
    assets = {
        [0] =
        { type = "texture", id = tilemap_texture_day_id, file = "./assets/tilemaps/jungle.png" },
        { type = "texture", id = tilemap_texture_night_id,       file = "./assets/tilemaps/jungle-night.png" },
        { type = "texture", id = chopper_texture_id,             file = "./assets/images/chopper-green-spritesheet.png" },
        { type = "texture", id = su27_texture_id,                file = "./assets/images/su27-spritesheet.png" },
        { type = "texture", id = f22_texture_id,                 file = "./assets/images/f22-spritesheet.png" },
        { type = "texture", id = fw190_texture_id,               file = "./assets/images/fw190-spritesheet.png" },
        { type = "texture", id = upf7_texture_id,                file = "./assets/images/upf7-spritesheet.png" },
        { type = "texture", id = bf109_texture_id,               file = "./assets/images/bf109-spritesheet.png" },
        { type = "texture", id = bomber_texture_id,              file = "./assets/images/bomber-spritesheet.png" },
        { type = "texture", id = carrier_texture_id,             file = "./assets/images/carrier.png" },
        { type = "texture", id = boat_texture_id,                file = "./assets/images/boat.png" },
        { type = "texture", id = tank_tiger_up_texture_id,       file = "./assets/images/tank-tiger-up.png" },
        { type = "texture", id = tank_tiger_right_texture_id,    file = "./assets/images/tank-tiger-right.png" },
        { type = "texture", id = tank_tiger_down_texture_id,     file = "./assets/images/tank-tiger-down.png" },
        { type = "texture", id = tank_tiger_left_texture_id,     file = "./assets/images/tank-tiger-left.png" },
        { type = "texture", id = tank_tiger_killed_texture_id,   file = "./assets/images/tank-tiger-killed.png" },
        { type = "texture", id = tank_panther_up_texture_id,     file = "./assets/images/tank-panther-up.png" },
        { type = "texture", id = tank_panther_right_texture_id,  file = "./assets/images/tank-panther-right.png" },
        { type = "texture", id = tank_panther_down_texture_id,   file = "./assets/images/tank-panther-down.png" },
        { type = "texture", id = tank_panther_left_texture_id,   file = "./assets/images/tank-panther-left.png" },
        { type = "texture", id = tank_panther_killed_texture_id, file = "./assets/images/tank-panther-killed.png" },
        { type = "texture", id = truck_ford_up_texture_id,       file = "./assets/images/truck-ford-up.png" },
        { type = "texture", id = truck_ford_right_texture_id,    file = "./assets/images/truck-ford-right.png" },
        { type = "texture", id = truck_ford_down_texture_id,     file = "./assets/images/truck-ford-down.png" },
        { type = "texture", id = truck_ford_left_texture_id,     file = "./assets/images/truck-ford-left.png" },
        { type = "texture", id = truck_ford_killed_texture_id,   file = "./assets/images/truck-ford-killed.png" },
        { type = "texture", id = army_walk_up_texture_id,        file = "./assets/images/army-walk-up.png" },
        { type = "texture", id = army_walk_right_texture_id,     file = "./assets/images/army-walk-right.png" },
        { type = "texture", id = army_walk_down_texture_id,      file = "./assets/images/army-walk-down.png" },
        { type = "texture", id = army_walk_left_texture_id,      file = "./assets/images/army-walk-left.png" },
        { type = "texture", id = army_walk_killed_texture_id,    file = "./assets/images/army-walk-killed.png" },
        { type = "texture", id = army_gun_up_texture_id,         file = "./assets/images/army-gun-up.png" },
        { type = "texture", id = army_gun_right_texture_id,      file = "./assets/images/army-gun-right.png" },
        { type = "texture", id = army_gun_down_texture_id,       file = "./assets/images/army-gun-down.png" },
        { type = "texture", id = army_gun_left_texture_id,       file = "./assets/images/army-gun-left.png" },
        { type = "texture", id = army_gun_killed_texture_id,     file = "./assets/images/army-gun-killed.png" },
        { type = "texture", id = sam_truck_right_texture_id,     file = "./assets/images/sam-truck-right.png" },
        { type = "texture", id = sam_tank_left_texture_id,       file = "./assets/images/sam-tank-left-spritesheet.png" },
        { type = "texture", id = sam_tank_right_texture_id,      file = "./assets/images/sam-tank-right-spritesheet.png" },
        { type = "texture", id = takeoff_base_texture_id,        file = "./assets/images/takeoff-base.png" },
        { type = "texture", id = landing_base_texture_id,        file = "./assets/images/landing-base.png" },
        { type = "texture", id = runway_texture_id,              file = "./assets/images/runway.png" },
        { type = "texture", id = obstacles1_texture_id,          file = "./assets/images/obstacles-1.png" },
        { type = "texture", id = obstacles2_texture_id,          file = "./assets/images/obstacles-2.png" },
        { type = "texture", id = obstacles3_texture_id,          file = "./assets/images/obstacles-3.png" },
        { type = "texture", id = obstacles4_texture_id,          file = "./assets/images/obstacles-4.png" },
        { type = "texture", id = obstacles5_texture_id,          file = "./assets/images/obstacles-5.png" },
        { type = "texture", id = obstacles6_texture_id,          file = "./assets/images/obstacles-6.png" },
        { type = "texture", id = obstacles7_texture_id,          file = "./assets/images/obstacles-7.png" },
        { type = "texture", id = tree1_texture_id,               file = "./assets/images/tree-1.png" },
        { type = "texture", id = tree2_texture_id,               file = "./assets/images/tree-2.png" },
        { type = "texture", id = tree3_texture_id,               file = "./assets/images/tree-3.png" },
        { type = "texture", id = tree4_texture_id,               file = "./assets/images/tree-4.png" },
        { type = "texture", id = tree5_texture_id,               file = "./assets/images/tree-5.png" },
        { type = "texture", id = tree6_texture_id,               file = "./assets/images/tree-6.png" },
        { type = "texture", id = tree7_texture_id,               file = "./assets/images/tree-7.png" },
        { type = "texture", id = tree8_texture_id,               file = "./assets/images/tree-8.png" },
        { type = "texture", id = tree9_texture_id,               file = "./assets/images/tree-9.png" },
        { type = "texture", id = tree10_texture_id,              file = "./assets/images/tree-10.png" },
        { type = "texture", id = tree11_texture_id,              file = "./assets/images/tree-11.png" },
        { type = "texture", id = tree12_texture_id,              file = "./assets/images/tree-12.png" },
        { type = "texture", id = tree13_texture_id,              file = "./assets/images/tree-13.png" },
        { type = "texture", id = tree14_texture_id,              file = "./assets/images/tree-14.png" },
        { type = "texture", id = tree15_texture_id,              file = "./assets/images/tree-15.png" },
        { type = "texture", id = tree16_texture_id,              file = "./assets/images/tree-16.png" },
        { type = "texture", id = tree17_texture_id,              file = "./assets/images/tree-17.png" },
        { type = "texture", id = tree18_texture_id,              file = "./assets/images/tree-18.png" },
        { type = "texture", id = tree19_texture_id,              file = "./assets/images/tree-19.png" },
        { type = "texture", id = tree20_texture_id,              file = "./assets/images/tree-20.png" },
        { type = "texture", id = bullet_texture_id,              file = "./assets/images/bullet.png" },
        { type = "texture", id = radar_texture_id,               file = "./assets/images/radar-spritesheet.png" },
        { type = "font",    id = pico8_font_5_id,                file = "./assets/fonts/pico8.ttf",                      font_size = 5 },
        { type = "font",    id = pico8_font_10_id,               file = "./assets/fonts/pico8.ttf",                      font_size = 10 },
        { type = "font",    id = charriot_font_11_id,            file = "./assets/fonts/charriot.ttf",                   font_size = 11 },
        { type = "font",    id = charriot_font_20_id,            file = "./assets/fonts/charriot.ttf",                   font_size = 20 },
    },

    ----------------------------------------------------
    -- table to define the map config variables
    ----------------------------------------------------
    tilemap = {
        map_file = "./assets/tilemaps/jungle.map",
        texture_asset_id = map_texture_asset_id,
        num_rows = 20,
        num_cols = 25,
        tile_size = 32,
        scale = 2.0
    },

    ----------------------------------------------------
    -- table to define entities and their components
    ----------------------------------------------------
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
                    font_asset_id = charriot_font_11_id,
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
            -- Takeoff base
            components = {
                transform = {
                    position = { x = 240, y = 113 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = takeoff_base_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                }
            }
        },
        {
            -- Landing base
            components = {
                transform = {
                    position = { x = 1396, y = 493 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = landing_base_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                }
            }
        },
        {
            -- Radar UI animation
            group = "ui",
            components = {
                transform = {
                    position = { x = 10, y = 10 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = radar_texture_id,
                    width = 64,
                    height = 64,
                    z_index = 10,
                    fixed = true
                },
                animation = {
                    num_frames = 8,
                    speed_rate = 7 -- fps
                }
            }
        },
        {
            -- Runway
            components = {
                transform = {
                    position = { x = 940, y = 65 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 270.0, -- degrees
                },
                sprite = {
                    texture_asset_id = runway_texture_id,
                    width = 21,
                    height = 191,
                    z_index = 1
                }
            }
        },
        {
            -- Runway
            components = {
                transform = {
                    position = { x = 470, y = 385 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = runway_texture_id,
                    width = 21,
                    height = 191,
                    z_index = 1
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
                    texture_asset_id = tank_tiger_right_texture_id,
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
                    font_asset_id = charriot_font_11_id,
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
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 785, y = 170 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 18,
                    offset = { x = 7, y = 10 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -50 },
                    projectile_duration = 4, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 785, y = 250 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 20,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 20 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 785, y = 350 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 570, y = 520 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 60, y = 0 },
                    projectile_duration = 4, -- seconds
                    repeat_frequency = 4,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 570, y = 600 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -60, y = 0 },
                    projectile_duration = 4, -- seconds
                    repeat_frequency = 4,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1050, y = 170 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 60, y = 0 },
                    projectile_duration = 4, -- seconds
                    repeat_frequency = 4,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1170, y = 116 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 18,
                    offset = { x = 8, y = 6 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 40 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1380, y = 116 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 18,
                    offset = { x = 8, y = 6 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 40 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1265, y = 240 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_killed_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1265, y = 290 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 20,
                    height = 17,
                    offset = { x = 7, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -40, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 640, y = 800 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 18,
                    height = 20,
                    offset = { x = 7, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 100 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 5,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 790, y = 745 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 7, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -60, y = 0 },
                    projectile_duration = 10, -- seconds
                    repeat_frequency = 1,     -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 980, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 0, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 60, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1070, y = 870 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 8, y = 4 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 100 },
                    projectile_duration = 4, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1190, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 7, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -200 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1210, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 7, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -200 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1230, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 7, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -200 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1250, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 7, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -200 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1000, y = 445 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 7, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -200 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1426, y = 760 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 22,
                    height = 18,
                    offset = { x = 5, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 200, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1423, y = 835 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 18,
                    offset = { x = 7, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -200, y = 0 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1450, y = 300 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 19,
                    height = 20,
                    offset = { x = 6, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 300 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 195, y = 980 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_tiger_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 18,
                    height = 25,
                    offset = { x = 7, y = 7 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 110, y = 1125 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 17,
                    height = 20,
                    offset = { x = 8, y = 4 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 300 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                }
            }
        },
        {
            -- Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1395, y = 540 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tank_panther_killed_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 113, y = 580 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 180, y = 1045 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 195, y = 1055 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 210, y = 1065 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 545, y = 660 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 560, y = 670 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 25,
                    offset = { x = 10, y = 2 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1360, y = 880 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 20,
                    offset = { x = 10, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1380, y = 880 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 20,
                    offset = { x = 10, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1400, y = 880 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 12,
                    height = 20,
                    offset = { x = 10, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1505, y = 780 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 25,
                    height = 16,
                    offset = { x = 3, y = 10 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1515, y = 790 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 25,
                    height = 16,
                    offset = { x = 3, y = 10 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- SAM Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 495, y = 380 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 2 -- fps
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = -50 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 495, y = 410 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 2 -- fps
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = -50 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1290, y = 115 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 2 -- fps
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -100, y = -75 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Tank
            group = "enemies",
            components = {
                transform = {
                    position = { x = 935, y = 557 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 2 -- fps
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -100, y = -60 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 114, y = 700 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -50 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 114, y = 720 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -50 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 116, y = 499 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -70 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1454, y = 215 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -70 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1454, y = 231 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -70 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- SAM Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1454, y = 247 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_truck_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
                boxcollider = {
                    width = 17,
                    height = 15,
                    offset = { x = 8, y = 8 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = -70 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 115, y = 633 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree5_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 117, y = 650 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree5_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 318, y = 490 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree6_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 668, y = 526 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree14_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1018, y = 738 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree17_texture_id,
                    width = 17,
                    height = 20,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1034, y = 738 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree17_texture_id,
                    width = 17,
                    height = 20,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1028, y = 745 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree18_texture_id,
                    width = 17,
                    height = 20,
                    z_index = 2
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1390, y = 440 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
                    width = 31,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1400, y = 445 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
                    width = 31,
                    height = 32,
                    z_index = 2
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1365, y = 290 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree14_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 669, y = 549 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 685, y = 549 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 315, y = 505 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 3
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 330, y = 507 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 438, y = 390 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 449, y = 408 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 431, y = 416 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 940, y = 695 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 955, y = 705 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1085, y = 507 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1075, y = 527 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1075, y = 547 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1085, y = 567 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1355, y = 449 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles2_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1430, y = 446 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles2_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1435, y = 195 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1425, y = 215 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1425, y = 235 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1425, y = 255 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1435, y = 275 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 2
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1360, y = 310 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1380, y = 312 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles7_texture_id,
                    width = 16,
                    height = 16,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1330, y = 212 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles1_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Obstacles
            components = {
                transform = {
                    position = { x = 1360, y = 232 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = obstacles1_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 630, y = 405 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 497, y = 450 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 572, y = 560 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 114, y = 980 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 114, y = 1030 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 883, y = 490 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 113, y = 851 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 750, y = 630 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 800, y = 630 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 856, y = 115 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 900, y = 115 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1117, y = 530 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 755, y = 440 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 810, y = 440 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1390, y = 690 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_killed_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1425, y = 690 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_killed_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1465, y = 690 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_walk_killed_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 80, y = 520 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 80, y = 790 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 345, y = 423 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 270.0, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 1510, y = 460 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
            }
        },
        {
            -- Carrier
            components = {
                transform = {
                    position = { x = 670, y = 150 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = carrier_texture_id,
                    width = 59,
                    height = 191,
                    z_index = 1
                },
            }
        },
        {
            -- Carrier
            components = {
                transform = {
                    position = { x = 300, y = 975 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = carrier_texture_id,
                    width = 59,
                    height = 191,
                    z_index = 1
                },
            }
        },
        {
            -- F-22 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 688, y = 165 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = f22_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 4
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 20,
                    height = 25,
                    offset = { x = 5, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 685, y = 300 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = -10.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = -5.5, y = -35.0 }
                },
                sprite = {
                    texture_asset_id = su27_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 25,
                    height = 30,
                    offset = { x = 5, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- Bomber plane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 464, y = 520 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = bomber_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- FW190 plane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1000, y = 143 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = -90.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = -50.0, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = fw190_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 6
                },
                animation = {
                    num_frames = 3,
                    speed_rate = 15 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 30,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                }
            }
        },
        {
            -- UPF7 plane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 920, y = 179 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = upf7_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                }
            }
        },
        {
            -- UPF7 plane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 950, y = 179 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = upf7_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                }
            }
        },
        {
            -- UPF7 plane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 980, y = 179 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = upf7_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                }
            }
        },
        {
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 317, y = 985 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 0.0, y = -50.0 }
                },
                sprite = {
                    texture_asset_id = su27_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 32
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                },
                on_update_script = {
                    [0] =
                        function(entity, delta_time, ellapsed_time)
                            -- this function makes the fighter jet move up and down the map shooting projectiles
                            local current_position_x, current_position_y = get_position(entity)
                            local current_velocity_x, current_velocity_y = get_velocity(entity)

                            -- if it reaches the top or the bottom of the map
                            if current_position_y < 300 or current_position_y > map_height - 300 then
                                set_velocity(entity, 0, current_velocity_y * -1); -- flip the entity y-velocity
                            else
                                set_velocity(entity, 0, current_velocity_y);      -- do not flip y-velocity
                            end

                            -- set the transform rotation to match going up or down
                            if (current_velocity_y < 0) then
                                set_rotation(entity, 0)                  -- point up
                                set_projectile_velocity(entity, 0, -200) -- shoot projectiles up
                            else
                                set_rotation(entity, 180)                -- point down
                                set_projectile_velocity(entity, 0, 200)  -- shoot projectiles down
                            end
                        end
                }
            }
        },
        {
            -- F-22 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 10, y = 10 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 0.0, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = f22_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 5
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 200, y = 0 },
                    projectile_duration = 1, -- secondsm
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 10,
                    friendly = false
                },
                on_update_script = {
                    [0] =
                        function(entity, delta_time, ellapsed_time)
                            -- change the position of the the airplane to follow a sine wave movement
                            local new_x = ellapsed_time * 0.09
                            local new_y = 200 + (math.sin(ellapsed_time * 0.001) * 50)
                            set_position(entity, new_x, new_y) -- set the new position
                        end
                }
            }
        }
    }
}

-- Define some useful global variables
map_width = Level.tilemap.num_cols * Level.tilemap.tile_size * Level.tilemap.scale
map_height = Level.tilemap.num_rows * Level.tilemap.tile_size * Level.tilemap.scale
