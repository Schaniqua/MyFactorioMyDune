-- prototypes/planet/dune-map-gen.lua

local dune_map_gen = {}

dune_map_gen.dune = function ()
    return {
        property_expression_names = {
            elevation = 0,
            temperature = 100,
            moisture = 0,
            cliffiness = 0,
            cliff_elevation = 0,
        },
        autoplace_controls = {
            ["spice-ore"] = {},
        },
        autoplace_settings = {
            tile = {
                settings = {
                    ["dune-deep-sand"] = {},
                    ["dune-sand"] = {},
                    ["dune-rock"] = {},
                }
            },
            entity = {
                settings = {
                    ["spice-ore"] = {},
                }
            },
            decorative = {
                settings = {}
            }
        }
    }
end

return dune_map_gen
