data:extend({
    {
        type = "technology",
        name = "worm_grenade_technology",
        icon_size = 256,
        icon = "__MyFactorioMyDune__/graphics/technology/worm_grenade.png",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "smallWormGrenade-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "mediumWormGrenade-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "largeWormGrenade-recipe"
            }
        },
        prerequisites = { "military-2" },
        unit = {
            count = 100,
            ingredients = {
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
        order = "e-a-b" 
    },
    {
        type = "technology",
        name = "discover-dune",
        icons = util.technology_icon_constant_planet("__MyFactorioMyDune__/graphics/technology/dune.png"),
        icon_size = 256,
        essential = true,
        effects = 
		{
            {
                type = "unlock-space-location",
                space_location = "dune",
                use_icon_overlay_constant = true
            }
        },
        prerequisites = { "space-platform-thruster" },
        unit = 
		{
            count = 1000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "space-science-pack", 1 }
            },
            time = 10
        },
        order = "z-a-dune"
    },
	{
    type = "technology",
    name = "spice-processing",
    icons = util.technology_icon_constant_planet("__MyFactorioMyDune__/graphics/technology/spice-processing.png"),
    icon_size = 256,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "water-collector"
        },
        {
            type = "unlock-recipe",
            recipe = "spice-rafinery"
        }
    },
    prerequisites = {"discover-dune"},
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 },
            { "space-science-pack", 1 }
        },
        time = 30
    },
    research_trigger = {
        type = "mine-entity",
        entity = "spice-ore"
    },
    order = "z-a-spice"
}
})
