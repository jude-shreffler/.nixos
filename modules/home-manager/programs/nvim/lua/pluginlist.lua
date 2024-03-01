-- nvim/lua/pluginlist.lua

return {
  -- lsp dependencies
  -- "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  "folke/neodev.nvim",

  -- comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

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
  },

  -- code completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      
      "hrsh7th/cmp-nvim-lsp",
      
    },
  },

  -- carbon file
  {
    "SidOfc/carbon.nvim",
    config = function()
      require("carbon").setup()
    end
  },

  { 
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' } 
  },
}
