local tilemap_texture_id = "tilemap-texture"
local tank_texture_id = "tank-texture"
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

Level = {
    ----------------------------------------------------
    -- Table to define the list of assets
    ----------------------------------------------------
    assets = {
        [0] =
        { type = "texture", id = tilemap_texture_id, file = "./assets/tilemaps/desert.png" },
        { type = "texture", id = tank_texture_id,                file = "./assets/images/tank-panther-spritesheet.png" },
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
        map_file = "./assets/tilemaps/desert.map",
        texture_asset_id = tilemap_texture_id,
        num_rows = 30,
        num_cols = 40,
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
                    position = { x = 750, y = 450 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 0.0, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = tank_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 6,
                    fixed = false,
                    src_rect_x = 0,
                    src_rect_y = 0
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
                    up_velocity = { x = 0, y = -30 },
                    right_velocity = { x = 30, y = 0 },
                    down_velocity = { x = 0, y = 30 },
                    left_velocity = { x = -30, y = 0 }
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
                    position = { x = 742, y = 448 },
                    scale = { x = 1.5, y = 1.5 },
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
                    position = { x = 2500, y = 1850 },
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
            -- Landing base
            components = {
                transform = {
                    position = { x = 965, y = 746 },
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
            -- Runway
            components = {
                transform = {
                    position = { x = 800, y = 1400 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    position = { x = 800, y = 1500 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    position = { x = 800, y = 1600 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    position = { x = 1300, y = 1400 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    position = { x = 1300, y = 1500 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    position = { x = 1300, y = 1600 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
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
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 400 },
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
                    projectile_velocity = { x = -100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 450 },
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
                    projectile_velocity = { x = -100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 500 },
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
                    projectile_velocity = { x = -100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 550 },
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
                    projectile_velocity = { x = -100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 700 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_right_texture_id,
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
                    projectile_velocity = { x = 100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
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
                    position = { x = 2000, y = 800 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = sam_tank_right_texture_id,
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
                    projectile_velocity = { x = 100, y = -100 },
                    projectile_duration = 3, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1000 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1050 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1100 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1150 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1200 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 600, y = 1250 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = truck_ford_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 50, y = 0 },
                    projectile_duration = 5, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1280, y = 1100 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1240, y = 1150 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1200, y = 1200 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 850, y = 1840 },
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
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 900, y = 1840 },
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
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 950, y = 1840 },
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
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1000, y = 1840 },
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
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -100 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 2,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 2400, y = 1100 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 2350, y = 1150 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Truck
            group = "enemies",
            components = {
                transform = {
                    position = { x = 2300, y = 1200 },
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
                    width = 30,
                    height = 20,
                    offset = { x = 0, y = 5 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -50, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 3,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 500, y = 450 },
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
                    position = { x = 600, y = 800 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
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
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 600, y = 900 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
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
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1200, y = 900 },
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
                    position = { x = 1600, y = 900 },
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
                    position = { x = 1650, y = 1200 },
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
                    position = { x = 1650, y = 1280 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 80, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1900, y = 1260 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -100, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 2300, y = 1500 },
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
                    position = { x = 1060, y = 710 },
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
                    position = { x = 1060, y = 745 },
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
                    position = { x = 1060, y = 780 },
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
                    position = { x = 1400, y = 700 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_left_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = -100, y = 0 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1470, y = 700 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_right_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
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
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1435, y = 660 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_up_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = -80 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Army
            components = {
                transform = {
                    position = { x = 1435, y = 740 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = army_gun_down_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 1
                },
                boxcollider = {
                    width = 32,
                    height = 32,
                    offset = { x = 0, y = 0 }
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 80 },
                    projectile_duration = 2, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Obstacle
            components = {
                transform = {
                    position = { x = 400, y = 500 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1350, y = 400 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1920, y = 1700 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 920, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 940, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 960, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 980, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1000, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1020, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 800 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 920, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 940, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 960, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 980, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1000, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1020, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 710 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 725 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 740 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 755 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 770 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 900, y = 785 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 725 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 740 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 755 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 770 },
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
            -- Obstacle
            components = {
                transform = {
                    position = { x = 1040, y = 785 },
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
            -- Vegetation
            components = {
                transform = {
                    position = { x = 640, y = 1820 },
                    scale = { x = 0.8, y = 0.8 },
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
                    position = { x = 660, y = 1820 },
                    scale = { x = 0.8, y = 0.8 },
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
                    position = { x = 1044, y = 554 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
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
                    position = { x = 1050, y = 560 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1700, y = 1100 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
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
                    position = { x = 1710, y = 1110 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
            }
        },
        {
            -- Vegetation
            components = {
                transform = {
                    position = { x = 1044, y = 554 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
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
                    position = { x = 1070, y = 540 },
                    scale = { x = 0.6, y = 0.6 },
                    rotation = 0.0, -- degrees
                },
                sprite = {
                    texture_asset_id = tree10_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 2
                },
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 1000, y = 160 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 270, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 300 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 1200, y = 160 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 270, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 300 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Boat
            components = {
                transform = {
                    position = { x = 1400, y = 160 },
                    scale = { x = 0.8, y = 0.8 },
                    rotation = 270, -- degrees
                },
                sprite = {
                    texture_asset_id = boat_texture_id,
                    width = 21,
                    height = 126,
                    z_index = 1
                },
                projectile_emitter = {
                    texture_asset_id = bullet_texture_id,
                    projectile_size = { x = 4, y = 4 },
                    projectile_velocity = { x = 0, y = 300 },
                    projectile_duration = 1, -- seconds
                    repeat_frequency = 1,    -- seconds
                    hit_percentage_damage = 5,
                    friendly = false
                }
            }
        },
        {
            -- Carrier
            components = {
                transform = {
                    position = { x = 270, y = 650 },
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
                    position = { x = 270, y = 950 },
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
                    position = { x = 270, y = 1250 },
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
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 725, y = 1480 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 20, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = su27_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 8
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
            -- FW-190 airplane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 740, y = 1580 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 90.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 20, y = 0.0 }
                },
                sprite = {
                    texture_asset_id = fw190_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 8
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
            -- FW-190 airplane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 370, y = 1800 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 45.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 45, y = -45.0 }
                },
                sprite = {
                    texture_asset_id = fw190_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 8
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
            -- FW-190 airplane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 390, y = 1850 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 45.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 45, y = -45.0 }
                },
                sprite = {
                    texture_asset_id = fw190_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 8
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
            -- FW-190 airplane
            group = "enemies",
            components = {
                transform = {
                    position = { x = 320, y = 1800 },
                    scale = { x = 1.0, y = 1.0 },
                    rotation = 45.0, -- degrees
                },
                rigidbody = {
                    velocity = { x = 45, y = -45.0 }
                },
                sprite = {
                    texture_asset_id = fw190_texture_id,
                    width = 32,
                    height = 32,
                    z_index = 8
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
            -- F-22 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 288, y = 666 },
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
                    height = 24,
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
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 288, y = 810 },
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
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 288, y = 1410 },
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
            -- SU-27 fighter jet
            group = "enemies",
            components = {
                transform = {
                    position = { x = 1100, y = 1000 },
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
                on_update_script = {
                    [0] =
                        function(entity, delta_time, ellapsed_time)
                            -- this function makes the fighter jet move up and down the map shooting projectiles
                            local current_position_x, current_position_y = get_position(entity)
                            local current_velocity_x, current_velocity_y = get_velocity(entity)

                            -- if it reaches the top or the bottom of the map
                            if current_position_y < 10 or current_position_y > map_height - 32 then
                                set_velocity(entity, 0, current_velocity_y * -1); -- flip the entity y-velocity
                            else
                                set_velocity(entity, 0, current_velocity_y);      -- do not flip y-velocity
                            end

                            -- set the transform rotation to match going up or down
                            if (current_velocity_y < 0) then
                                set_rotation(entity, 0)   -- point up
                            else
                                set_rotation(entity, 180) -- point down
                            end
                        end
                }
            }
        },
        {
            -- Bomber airplane
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
                    texture_asset_id = bomber_texture_id,
                    width = 32,
                    height = 24,
                    z_index = 8
                },
                animation = {
                    num_frames = 2,
                    speed_rate = 10 -- fps
                },
                boxcollider = {
                    width = 32,
                    height = 24
                },
                health = {
                    health_percentage = 100,
                    font_asset_id = charriot_font_11_id,
                },
                on_update_script = {
                    [0] =
                        function(entity, delta_time, ellapsed_time)
                            -- change the position of the the airplane to follow a circular path
                            local radius = 170
                            local distance_from_origin = 500

                            local angle = ellapsed_time * 0.0009

                            -- calculate the new x-y cartesian position using polar coordinates
                            local new_x = (math.cos(angle) * radius) + distance_from_origin
                            local new_y = (math.sin(angle) * radius) + distance_from_origin
                            set_position(entity, new_x, new_y)

                            -- change the rotation of the sprite to match the circular motion
                            local angle_in_degrees = 180 + angle * 180 / math.pi
                            set_rotation(entity, angle_in_degrees)
                        end
                }
            }
        }
    }
}

-- Define some useful global variables
map_width = Level.tilemap.num_cols * Level.tilemap.tile_size * Level.tilemap.scale
map_height = Level.tilemap.num_rows * Level.tilemap.tile_size * Level.tilemap.scale
