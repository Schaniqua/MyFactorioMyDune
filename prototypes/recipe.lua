-- prototypes/recipe.lua
data:extend({
    {
        type = "recipe",
    name = "smallWormGrenade-recipe",
    enabled = true,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 1}
    },
    results = {
        {type = "item", name = "smallWormGrenade-Item", amount = 1}
    },
    icon = "__MyFactorioMyDune__/graphics/icons/smallWorm_grenade.png",
    icon_size = 128
    },
	{
        type = "recipe",
    name = "mediumWormGrenade-recipe",
    enabled = true,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 1}
    },
    results = {
        {type = "item", name = "mediumWormGrenade-Item", amount = 1}
    },
    icon = "__MyFactorioMyDune__/graphics/icons/mediumWorm_grenade.png",
    icon_size = 128
    },
	{
        type = "recipe",
    name = "largeWormGrenade-recipe",
    enabled = true,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 1}
    },
    results = {
        {type = "item", name = "largeWormGrenade-Item", amount = 1}
    },
    icon = "__MyFactorioMyDune__/graphics/icons/largeWorm_grenade.png",
    icon_size = 128
    },
	
	-- Water Collector Recipe
    {
    type = "recipe",
    name = "water-collector",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "pipe", amount = 5},
        {type = "item", name = "iron-plate", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 5}
    },
    results = {
        {type = "item", name = "water-collector", amount = 1}
    },
    main_product = "water-collector"
},
{
    type = "recipe",
    name = "spice-rafinery",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "stone-brick", amount = 5}
    },
    results = {
        {type = "item", name = "spice-rafinery", amount = 1}
    },
    main_product = "spice-rafinery"
}


})
