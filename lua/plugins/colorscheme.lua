-- Install and set colorschemes
return {
  {
    -- Plugin: qaptoR-nvim/chocolatier.nvim
    -- URL: https://github.com/qaptoR-nvim/chocolatier.nvim
    -- Description: Provides a chocolatey-like theme for Neovim.
    "qaptoR-nvim/chocolatier.nvim",
    config = true,
    lazy = true,
    enabled = false,
  },
  {
    -- Plugin: rose-pine/neovim
    -- URL: https://github.com/rose-pine/neovim
    -- Description: Provides a rose-pine theme for Neovim.
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    enabled = false,
  },
  {
    -- Plugin: catppuccin/nvim
    -- URL: https://github.com/catppuccin/nvim
    -- Description: Provides a catppuccin theme for Neovim.
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    lazy = true,
    opts = {
      transparent_background = true,
      flavour = "mocha",
    },
    integrations = {
      cmp = true, -- Enable integration with nvim-cmp
      gitsigns = true, -- Enable integration with gitsigns
      nvimtree = true, -- Enable integration with nvim-tree
      treesitter = true, -- Enable integration with treesitter
      notify = false, -- Disable integration with nvim-notify
      mini = {
        enabled = true, -- Enable mini plugin integration
        indentscope_color = "", -- Set indentscope color (empty means default)
      },
    },
  },
  {
    -- Plugin: rebelot/kanagawa.nvim
    -- URL: https://github.com/rebelot/kanagawa.nvim
    -- Description: Provides a kanagawa theme for Neovim.
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    enabled = false,
    lazy = true,
    opts = {
      transparent = true,
      theme = "dragon",
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" }, -- Transparent background for floating windows
          FloatBorder = { bg = "none" }, -- Transparent background for floating window borders
          FloatTitle = { bg = "none" }, -- Transparent background for floating window titles

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 }, -- Custom colors for dark mode

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Lazy plugin
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Mason plugin

          FzfLuaTitle = { fg = theme.ui.special, bold = true }, -- Custom colors for Telescope titles
          FzfLuaNormal = { bg = theme.ui.bg_p1 }, -- Custom colors for Telescope prompt
          FzfLuaBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 }, -- Custom colors for Telescope prompt border
          FzfLuaPreviewNormal = { bg = theme.ui.bg_dim }, -- Custom colors for Telescope preview
          FzfLuaPreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim }, -- Custom colors for Telescope preview border
          FzfLuaBackdrop = { bg = theme.ui.bg_dim }, -- Custom colors for Telescope preview backdrop

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- Custom colors for popup menu
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 }, -- Custom colors for selected item in popup menu
          PmenuSbar = { bg = theme.ui.bg_m1 }, -- Custom colors for popup menu scrollbar
          PmenuThumb = { bg = theme.ui.bg_p2 }, -- Custom colors for popup menu thumb
        }
      end,
    },
  },
  {
    -- Plugin: neanias/everforest-nvim
    -- URL: https://github.com/neanias/everforest-nvim
    -- Description: Provides a everforest theme for Neovim.
    "neanias/everforest-nvim",
    priority = 1000,
    version = false,
    lazy = false,
    ---@class Config
    config = function()
      require("everforest").setup({
        background = "hard",
        italis = true,
        transparent_background_level = 0.9,
        diagnostic_text_highlight = true,
        diagnostic_virtual_text = "coloured",
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
