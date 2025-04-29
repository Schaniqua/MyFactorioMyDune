-- prototypes/item.lua
data:extend({
    {
        type = "capsule",
        name = "smallWormGrenade-Item",
        icon = "__MyFactorioMyDune__/graphics/icons/smallWorm_grenade.png",
        icon_size = 128,
        subgroup = "capsule",
        order = "a[grenade]-b[smallWormGrenade]-c[mediumWormGrenade]-d[largeWormGrenade]",
        stack_size = 100,
        capsule_action = {
            type = "throw",
            attack_parameters = {
                type = "projectile",
                ammo_category = "capsule",
                cooldown = 30,
                range = 20,
                ammo_type = {
                    category = "capsule",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "smallWorm-grenade-projectile",
                            starting_speed = 0.3
                        }
                    }
                }
            }
        }
    },
	{
        type = "capsule",
        name = "mediumWormGrenade-Item",
        icon = "__MyFactorioMyDune__/graphics/icons/mediumWorm_grenade.png",
        icon_size = 128,
        subgroup = "capsule",
        order = "a[grenade]-b[smallWormGrenade]-c[mediumWormGrenade]-d[largeWormGrenade]",
        stack_size = 100,
        capsule_action = {
            type = "throw",
            attack_parameters = {
                type = "projectile",
                ammo_category = "capsule",
                cooldown = 30,
                range = 30,
                ammo_type = {
                    category = "capsule",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "mediumWorm-grenade-projectile",
                            starting_speed = 0.3
                        }
                    }
                }
            }
        }
    },
	{
        type = "capsule",
        name = "largeWormGrenade-Item",
        icon = "__MyFactorioMyDune__/graphics/icons/largeWorm_grenade.png",
        icon_size = 128,
        subgroup = "capsule",
        order = "a[grenade]-b[smallWormGrenade]-c[mediumWormGrenade]-d[largeWormGrenade]",
        stack_size = 100,
        capsule_action = {
            type = "throw",
            attack_parameters = {
                type = "projectile",
                ammo_category = "capsule",
                cooldown = 30,
                range = 40,
                ammo_type = {
                    category = "capsule",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "projectile",
                            projectile = "largeWorm-grenade-projectile",
                            starting_speed = 0.3
                        }
                    }
                }
            }
        }
    },
	{
        type = "item",
        name = "poorSpice",
        stack_size = 100,
        icon = "__MyFactorioMyDune__/graphics/icons/poorSpice.png",
		icon_size = 64
    },
    {
        type = "item",
        name = "spice-ore",
        stack_size = 100,
        icon = "__MyFactorioMyDune__/graphics/icons/poorSpice.png",
		icon_size = 64,
        subgroup = "raw-resource",
        stack_size = 50,
        weight = 2 * kg
    },
	{
        type = "item",
        name = "water-collector",
        icon = "__MyFactorioMyDune__/graphics/icons/water-collector.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[water-collector]",
        place_result = "water-collector", -- Entité à poser
        stack_size = 10
    },
	{
        type = "item",
        name = "spice-rafinery",
        icon = "__MyFactorioMyDune__/graphics/icons/spice-rafinery.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d[spice-rafinery]",
        place_result = "spice-rafinery",
        stack_size = 10
    }
})
