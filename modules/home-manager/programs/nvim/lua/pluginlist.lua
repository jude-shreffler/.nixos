-- nvim/lua/pluginlist.lua

return {
    -- nord theme
    {
        "shaunsingh/nord.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme nord")
        end
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                icons_enabled = true,
                theme = "nord"
            })
        end,
    }
}
