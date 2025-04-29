
data:extend({
	-- Water Collector
    {
  type = "mining-drill",
  name = "water-collector",
  icon = "__MyFactorioMyDune__/graphics/icons/water-collector.png",
  icon_size = 64,
  flags = { "placeable-neutral", "placeable-player", "player-creation" },
  minable = { mining_time = 0.5, result = "water-collector" },
  max_health = 300,
  resource_categories = { "basic-fluid" },
  energy_usage = "15kW",
  mining_speed = 1,
  energy_source = {
    type = "electric",
    emissions_per_minute = {pollution = 0},
    usage_priority = "secondary-input"
  },
  output_fluid_box = {
    volume = 10,
    base_level = 1,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
      { position = {0, -1},
		type = "output",
		flow_direction = "output"
	  }
    },
    production_type = "output"
  },
  mining_power = 1,
  resource_searching_radius = 0.49,
  vector_to_place_result = {0, -1.85},
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  animations = { ... }
},

    -- Spice Refinery
    {
        type = "assembling-machine",
        name = "spice-rafinery",
        icon = "__MyFactorioMyDune__/graphics/icons/spice-rafinery.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.5, result = "spice-rafinery"},
        max_health = 400,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},

        crafting_categories = {"space-fluid-assembling"},
        crafting_speed = 1.0,

        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {pollution = 0},
            drain = "10kW"
        },
        energy_usage = "150kW",
        ingredient_count = 2,

        animation = {
            filename = "__MyFactorioMyDune__/graphics/entity/spice-rafinery.png",
            width = 128,
            height = 128,
            frame_count = 32,
            line_length = 8,
            shift = {0, 0},
            animation_speed = 0.4
        },

        working_sound = {
            sound = { filename = "__base__/sound/assembling-machine-t2-1.ogg", volume = 0.7 },
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.4 },
            apparent_volume = 1.2
        },

        module_specification = {
            module_slots = 2
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"}
    },
  {
    type = "projectile",
    name = "smallWorm-grenade-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "script",
            effect_id = "smallWorm-grenade-trigger"  -- Effet personnalisé pour invoquer le ver
          }
        }
      }
    },
    animation = 
	{
      filename = "__MyFactorioMyDune__/graphics/animation/smallWorm_grenade.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
    },
	shadow =
	{
	  filename = "__MyFactorioMyDune__/graphics/animation/worm_grenade-shadow.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
	}
  },
  
  {
    type = "projectile",
    name = "mediumWorm-grenade-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "script",
            effect_id = "mediumWorm-grenade-trigger"  -- Effet personnalisé pour invoquer le ver
          }
        }
      }
    },
    animation = 
	{
      filename = "__MyFactorioMyDune__/graphics/animation/mediumWorm_grenade.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
    },
	shadow =
	{
	  filename = "__MyFactorioMyDune__/graphics/animation/worm_grenade-shadow.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
	}
  },
  
  {
    type = "projectile",
    name = "largeWorm-grenade-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "script",
            effect_id = "largeWorm-grenade-trigger"  -- Effet personnalisé pour invoquer le ver
          }
        }
      }
    },
    animation = 
	{
      filename = "__MyFactorioMyDune__/graphics/animation/largeWorm_grenade.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
    },
	shadow =
	{
	  filename = "__MyFactorioMyDune__/graphics/animation/worm_grenade-shadow.png",
      frame_count = 19,
      line_length = 7,
      width = 128,
      height = 128,
	  scale = 0.4,
	  animation_speed = 0.8,
      priority = "high"
	}
  },
  
	--[[{
        type = "explosion",
        name = "worm_attack_animation_1",
        flags = {"not-on-map"},
        animations = {
            {
                filename = "__MyFactorioMyDune__/graphics/animation/sandWorm-preparing1.png",
                priority = "high",
                width = 94,
                height = 152,
                frame_count = 18,
                line_length = 6,
                animation_speed = 0.1,
                scale = 7.0
            }
        },
        sound = {
            {
                filename = "__base__/sound/fight/worm-roar-1.ogg",
                volume = 0.75
            }
        }
    },
	{
        type = "explosion",
        name = "worm_attack_animation_2",  -- Nom de l'animation (doit correspondre à ce que tu as utilisé dans control.lua)
        flags = {"not-on-map"},
        animations = {
            {
                filename = "__MyFactorioMyDune__/graphics/animation/worm-preparing2.png",  -- Fichier PNG de l'animation
                priority = "high",
                width = 94,  -- Largeur en pixels
                height = 152,  -- Hauteur en pixels
                frame_count = 18,  -- Nombre de frames dans l'animation
                line_length = 6,  -- Nombre de frames par ligne dans le sprite sheet
                animation_speed = 0.1,  -- Vitesse de l'animation (1.0 = vitesse normale, 0.5 = plus lent)
                scale = 7.0,  -- Échelle de l'animation, tu peux ajuster pour agrandir ou réduire
            }
        }
		,
        sound = {
            {
                filename = "__base__/sound/fight/worm-roar-1.ogg",  -- Optionnel : un son d'attaque
                volume = 0.75
            }
        }
		
    }
	--]]
	
    {
        type = "explosion",
        name = "smallWorm_attack_animation",
        flags = {"not-on-map"},
        animations = {
			width = 500,
			height = 600,
			frame_count = 134,
			animation_speed = 0.5,
			scale = 1,
			shift = {0, 0},
			stripes = {
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet1.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet2.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet3.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet4.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet5.png",
					width_in_frames = 6,
					height_in_frames = 3,
				}
			}	
        },
    },
	
	{
        type = "explosion",
        name = "mediumWorm_attack_animation",
        flags = {"not-on-map"},
        animations = {
			width = 500,
			height = 600,
			frame_count = 134,
			animation_speed = 0.2,
			scale = 2,
			shift = {0, 0},
			stripes = {
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet1.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet2.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet3.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet4.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet5.png",
					width_in_frames = 6,
					height_in_frames = 3,
				}
			}	
        },
    },
	
	{
        type = "explosion",
        name = "largeWorm_attack_animation",
        flags = {"not-on-map"},
        animations = {
			width = 500,
			height = 600,
			frame_count = 134,
			animation_speed = 0.1,
			scale = 4,
			shift = {0, 0},
			stripes = {
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet1.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet2.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet3.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet4.png",
					width_in_frames = 6,
					height_in_frames = 5,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/Spritesheet5.png",
					width_in_frames = 6,
					height_in_frames = 3,
				}
			}	
        },
    },
	{
        type = "explosion",
        name = "largeWorm_attack_animation_shadow",
        flags = {"not-on-map"},
        animations = {
			width = 800,
			height = 600,
			frame_count = 134,
			animation_speed = 0.1,
			scale = 4,
			shift = {0, 0},
			stripes = {
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/ShadowSpritesheet1.png",
					width_in_frames = 5,
					height_in_frames = 6,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/ShadowSpritesheet2.png",
					width_in_frames = 5,
					height_in_frames = 6,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/ShadowSpritesheet3.png",
					width_in_frames = 5,
					height_in_frames = 6,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/ShadowSpritesheet4.png",
					width_in_frames = 5,
					height_in_frames = 6,
				},
				{
					filename = "__MyFactorioMyDune__/graphics/animation/worm2/ShadowSpritesheet5.png",
					width_in_frames = 5,
					height_in_frames = 3,
				}
			}
		},
    },
	{
        type = "sticker",
        name = "smallWorm-sticker",
        duration_in_ticks = 5*60,  -- 10 seconds at 60 ticks per second
        target_movement_modifier = 0.9,  -- Optional: slow down target
        damage_per_tick = { amount = 0.5, type = "poison" },  -- 0.5 damage per tick
    },
	{
        type = "sticker",
        name = "mediumWorm-sticker",
        duration_in_ticks = 5*60,  -- 10 seconds at 60 ticks per second
        target_movement_modifier = 0.5,  -- Optional: slow down target
        damage_per_tick = { amount = 2, type = "poison" },  -- 0.5 damage per tick
    },
	{
        type = "sticker",
        name = "largeWorm-sticker",
        duration_in_ticks = 5*60,  -- 10 seconds at 60 ticks per second
        target_movement_modifier = 0.2,  -- Optional: slow down target
        damage_per_tick = { amount = 10, type = "poison" },  -- 0.5 damage per tick
    }
})
		