
-- Fonction principale pour gérer les animations avec délais, scale et vitesse
--[[
local function playAnim(position, scale, speed)
    -- Initialisation des animations avec leurs délais, scale et vitesse respectifs
    local animations = {
        {delay = 60, name = "worm_attack_animation", scale = scale, speed = speed}
    }

    local start_tick = game.tick  -- Enregistre le tick de départ

    -- Écouteur sur chaque tick pour gérer les animations
    script.on_event(defines.events.on_tick, function(event)
        local elapsed_ticks = game.tick - start_tick  -- Calcul du temps écoulé

        for i, anim in ipairs(animations) do
            -- Si le délai pour l'animation est atteint et qu'elle n'a pas encore été jouée
            if anim.delay and elapsed_ticks >= anim.delay then
                -- Crée l'entité de l'animation avec scale et vitesse personnalisés
                game.surfaces[1].create_entity{
                    name = anim.name,
                    position = position,
                    animation_speed = anim.speed,  -- Contrôle de la vitesse de l'animation
                    scale = anim.scale             -- Contrôle de la taille de l'animation
                }
                anim.delay = nil  -- Marque l'animation comme jouée en annulant son délai
            end
        end

        -- Vérifie si toutes les animations ont été jouées, puis désactive l'événement
        if not animations[1].delay and not animations[2].delay then
            script.on_event(defines.events.on_tick, nil)
        end
    end)
end]]--

script.on_event(defines.events.on_research_finished, function(event)
    if event.research.name == "spice-processing" then
        game.print("🎉 You have discovered how to refine Spice!")
    end
end)

local function playAnim(delay, position, name, shadowName, size, delay2, wormType)
    -- Initialisation des animations avec leurs délais, scale et vitesse respectifs
	script.on_nth_tick(game.tick + delay, function()
		applyWormSticker(position, size * 0.8, wormType, size*size*size)
		applySand(position, size, delay2)
		game.surfaces[1].create_entity{
            name = shadowName,
            position = {position.x + size/1.5, position.y }, -- + size * 0.1},
        }
        game.surfaces[1].create_entity{
            name = name,
            position = {position.x, position.y + 1 } -- - size/5}
        }
        script.on_nth_tick(nil)
    end)
end

function applySand(position, size, delay)
    local original_tiles = {}
    local surface = game.surfaces[1]
    local distance_groups = {}

    -- Enregistrer les tuiles actuelles et les remplacer par du sable
    for x = -size, size do
        for y = -size, size do
            if x*x + y*y <= size*size then
                local tile_position = {x = position.x + x, y = position.y + y}
                local tile = surface.get_tile(tile_position.x, tile_position.y)
                local distance_from_center = math.floor(math.sqrt((tile_position.x - position.x)^2 + (tile_position.y - position.y)^2))

                -- Enregistrer les tuiles par distance
                if not distance_groups[distance_from_center] then
                    distance_groups[distance_from_center] = {}
                end
                table.insert(distance_groups[distance_from_center], {position = tile_position, name = tile.name})

                -- Remplacer la tuile par du sable
                surface.set_tiles({{name = "sand-1", position = tile_position}})
            end
        end
    end
    -- Planifier la restauration progressive après le délai
    local target_tick = game.tick + delay
    script.on_event(defines.events.on_tick, function(event)
        if event.tick >= target_tick then

            -- Restaurer les tuiles par groupes de distance
            local current_distance = size
            script.on_nth_tick(1, function()
                if distance_groups[current_distance] and #distance_groups[current_distance] > 0 then
                    -- Restaurer toutes les tuiles à la même distance
                    surface.set_tiles(distance_groups[current_distance])
                end

                -- Passer à la couche suivante plus proche du centre
                current_distance = current_distance - 1

                -- Arrêter la restauration quand toutes les couches sont terminées
                if current_distance < 0 then
                    script.on_nth_tick(nil)  -- Annuler l'événement répétitif
                end
            end)

            -- Désactiver l'événement de tick principal une fois la restauration déclenchée
            script.on_event(defines.events.on_tick, nil)
        end
    end)
end



--[[function applyDamage(position, size, duration, total_damage)
    local surface = game.surfaces[1]
    local ticks_per_damage_application = 1  -- Appliquer les dégâts à chaque tick

    -- Diviser les dégâts totaux par la durée pour obtenir les dégâts par tick
    local damage_per_tick = total_damage / duration

    -- Planifier l'application progressive des dégâts pendant la durée spécifiée
    local start_tick = game.tick
    local end_tick = start_tick + duration

    -- Vérifier si le jeu est bien en train de passer des ticks
    game.print("Début de l'application des dégâts sur une durée de " .. duration .. " ticks")

    -- Événement pour appliquer des dégâts chaque tick
    script.on_event(defines.events.on_tick, function(event)
        if event.tick <= end_tick then
            -- Rechercher les entités dans la zone spécifiée
            local entities_in_range = surface.find_entities_filtered({
                area = {{position.x - size, position.y - size}, {position.x + size, position.y + size}},
            })

            -- Appliquer les dégâts à chaque entité trouvée
            for _, entity in pairs(entities_in_range) do
                -- Vérifier que l'entité est valide et possède de la vie
                if entity.valid and entity.health then
                    entity.damage(damage_per_tick, game.forces.enemy)  -- Infliger des dégâts proportionnels au tick
                    -- Afficher un message pour vérifier que les dégâts sont appliqués
                    game.print("Dégâts appliqués : " .. damage_per_tick .. " à l'entité " .. entity.name)
                end
            end
        else
            -- Arrêter l'événement une fois que la durée est écoulée
            script.on_event(defines.events.on_tick, nil)
            game.print("Fin de l'application des dégâts.")
        end
    end)
end ]]--



--[[function applyDamage(position, size, damage)
    -- Chercher les entités dans la zone de l'explosion
    local entities = game.surfaces[1].find_entities_filtered{
        area = {
            {position.x - size, position.y - size},
            {position.x + size, position.y + size}
        }
    }

    -- Appliquer les dégâts uniquement aux entités qui peuvent recevoir des dégâts
    for _, entity in pairs(entities) do
        -- Vérifier si l'entité possède des points de vie (entity-with-health)
        if entity and entity.valid and entity.health then
            entity.damage(damage, game.forces.player, "explosion")
        end
    end
end]]--


function applyWormSticker(position, radius, wormType, direct_damage)
    -- Chercher toutes les entités dans la zone définie
    local entities = game.surfaces[1].find_entities_filtered{
        area = {
            {position.x - radius, position.y - radius},
            {position.x + radius, position.y + radius}
        },
    }

    -- Parcourir les entités dans la zone
    for _, entity in pairs(entities) do
        if entity and entity.valid and entity.health then
            -- Vérifier si l'entité est une structure ou une entité mobile (joueurs, ennemis, etc.)
            if entity.type == "unit" or entity.type == "player" then
                -- Appliquer un sticker aux entités mobiles (comme les joueurs ou les ennemis)
                game.surfaces[1].create_entity{
                    name = wormType,
                    target = entity,
                    position = entity.position,
                    force = entity.force
                }
            else
                -- Appliquer des dégâts directs aux structures (comme les bâtiments)
                entity.damage(direct_damage, game.forces.player, "explosion")
            end
        end
    end
end

script.on_event(defines.events.on_script_trigger_effect, function(event)
      
    if event.effect_id == "smallWorm-grenade-trigger" then
		playAnim(60, event.target_position, "smallWorm_attack_animation", "largeWorm_attack_animation_shadow", 8, 5*60, "smallWorm-sticker")
    end
	if event.effect_id == "mediumWorm-grenade-trigger" then
		playAnim(60, event.target_position, "mediumWorm_attack_animation", "largeWorm_attack_animation_shadow", 16, 12*60, "mediumWorm-sticker")
    end
	if event.effect_id == "largeWorm-grenade-trigger" then
		playAnim(60, event.target_position, "largeWorm_attack_animation", "largeWorm_attack_animation_shadow", 28, 22*60, "largeWorm-sticker")
    end
end)