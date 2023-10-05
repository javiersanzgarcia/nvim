return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "storm",
            light_style = "day",
            transparent = true,
            terminal_colors = true,
            styles = {sidebars = "transparent", floats = "transparent"},
            sidebars = {"qf", "help"},
            day_brightness = 0.9,

            on_colors = function(colors)
                colors.fg_gutter = "#A7B0DD"
                colors.comment = "#F0FEE2"
                colors.fg_sidebar = "#9BA4CB"
                colors.fg = "#AEF5EC"
            end
        }
    }
}
