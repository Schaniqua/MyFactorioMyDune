-- prototypes/pollution.lua

data:extend({
    {
        type = "airborne-pollutant",
        name = "dust",
        chart_color = {r = 255, g = 200, b = 100, a = 180},
        icon = {
            filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
            priority = "high",
            size = 64,
            mipmap_count = 2,
            y = 3 * 64,
            flags = {"gui-icon"}
        },
        affects_evolution = false,
        affects_water_tint = false,
    }
})
