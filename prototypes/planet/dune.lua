-- prototypes/planet/dune.lua

local dune_map_gen = require("prototypes.planet.dune-map-gen")

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({
    {
        type = "planet",
        name = "dune",
        icon = "__MyFactorioMyDune__/graphics/icons/dune.png",
        starmap_icon = "__MyFactorioMyDune__/graphics/icons/dune-starmap.png",
        starmap_icon_size = 512,
        gravity_pull = 10,
        distance = 13,
        orientation = 0.7,
        magnitude = 1.0,
        order = "b[dune]",
        subgroup = "planets",
        map_gen_settings = dune_map_gen.dune(),
        pollutant_type = "dust",
        solar_power_in_space = 200,
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
		discoverable = true,
        surface_properties = 
		{
            ["day-night-cycle"] = 10 * minute,
            ["magnetic-field"] = 25,
            ["solar-power"] = 200,
            pressure = 1000,
            gravity = 10,
        }
    },
    {
        type = "space-connection",
        name = "nauvis-dune",
        subgroup = "planet-connections",
        from = "nauvis",
        to = "dune",
        order = "a",
        length = 19000,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
    }
})
