-- prototypes/tile/tile-dune.lua

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

tile_collision_masks.dune_sand = function()
  return
  {layers={ 
    ground_tile=true,
    water_tile=true,
  }}
end

tile_collision_masks.deep_dune_sand = function()
  return
  {layers={
    ground_tile=true,
    water_tile=true,
  }}
end

local function transition_masks()
    return {
        mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
        mask_layout = {
            scale = 0.5,
            inner_corner = { count = 8 },
            outer_corner = { count = 8, x = 64 * 9 },
            side = { count = 8, x = 64 * 9 * 2 },
            u_transition = { count = 1, x = 64 * 9 * 3 },
            o_transition = { count = 1, x = 64 * 9 * 4 }
        }
    }
end

data:extend(
    {
        {
            type = "noise-expression",
            name = "deep_dune_to_sand_threshold",
            expression = "0.1"
        },
        {
            type = "noise-expression",
            name = "sand_to_rock_threshold",
            expression = "0.4"
        },
        {
            type = "noise-expression",
            name = "dune_desert_noise",
            expression = "multioctave_noise{x = x,\z
                                            y = y,\z
                                            persistence = 0.7,\z
                                            seed0 = map_seed,\z
                                            seed1 = 0,\z
                                            octaves = 8,\z
                                            input_scale = 0.03}"
        },

    -- Tile : dune-deep-sand
    {
        type = "tile",
        name = "dune-deep-sand",
        collision_mask = tile_collision_masks.dune_sand(),
        layer = 50,
        layer_group = "ground-natural",
        autoplace = {
            probability_expression = "dune_desert_noise <= deep_dune_to_sand_threshold"
        },
        variants = {
            transition = transition_masks(),
            material_background = {
                picture = "__MyFactorioMyDune__/graphics/terrain/dune-deep-sand.png",
                line_length = 4,
                count = 16,
                scale = 0.5
            },
            material_texture_width_in_tiles = 10,
            material_texture_height_in_tiles = 7
        },
        map_color = { r = 200, g = 180, b = 130 },
        walking_speed_modifier = 0.8,
        vehicle_friction_modifier = 4
    },

    -- Tile : dune-sand
    {
        type = "tile",
        name = "dune-sand",
        collision_mask = tile_collision_masks.dune_sand(),
        layer = 51,
        layer_group = "ground-natural",
        autoplace = {
            probability_expression = "(dune_desert_noise > deep_dune_to_sand_threshold) & (dune_desert_noise <= sand_to_rock_threshold)"
        },
        variants = {
            transition = transition_masks(),
            material_background = {
                picture = "__MyFactorioMyDune__/graphics/terrain/dune-sand.png",
                line_length = 4,
                count = 16,
                scale = 0.5
            },
            material_texture_width_in_tiles = 10,
            material_texture_height_in_tiles = 7
        },
        map_color = { r = 230, g = 210, b = 150 },
        walking_speed_modifier = 1.0,
        vehicle_friction_modifier = 2
    },

    -- Tile : dune-rock
    {
        type = "tile",
        name = "dune-rock",
        collision_mask = tile_collision_masks.ground(),
        layer = 52,
        layer_group = "ground-natural",
        autoplace = {
            probability_expression = "dune_desert_noise > sand_to_rock_threshold"
        },
        variants = {
            transition = transition_masks(),
            material_background = {
                picture = "__MyFactorioMyDune__/graphics/terrain/dune-rock-plateau.png",
                line_length = 8,
                count = 16,
                scale = 0.5
            },
            material_texture_width_in_tiles = 8,
            material_texture_height_in_tiles = 8
        },
        map_color = { r = 100, g = 100, b = 90 },
        walking_speed_modifier = 1.1,
        vehicle_friction_modifier = 1
    }
})
