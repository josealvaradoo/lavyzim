-- Install and set colorschemes
return {
  { "qaptoR-nvim/chocolatier.nvim", config = true, lazy = false },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    -- Plugin for the Catppuccin color scheme
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- Load this plugin immediately
    opts = {
      transparent_background = true, -- Enable transparent background
      flavour = "mocha", -- Set the flavor of the color scheme
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
      -- Additional plugin integrations can be found in the documentation
    },
  },
  {
    -- Plugin for the Kanagawa color scheme
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    priority = 1000, -- Load this plugin after all other plugins
    opts = {
      transparent = true, -- Enable transparent background
      theme = "dragon", -- Set the theme variant to 'dragon'
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
    -- Plugin for the Everforest color scheme
    "neanias/everforest-nvim",
    version = false, -- Use the latest version
    lazy = false, -- Load this plugin immediately
    config = function()
      require("everforest").setup({
        background = "hard", -- Set the background to 'hard'
        italis = true, -- Enable italics
        transparent_background_level = 1, -- Uncomment to enable transparency
        diagnostic_text_highlight = true, -- Enable diagnostic text highlight
        diagnostic_virtual_text = "coloured", -- Set diagnostic virtual text to colored
        colours_override = function(palette)
          palette.bg0 = "#1A1A22" -- Override background color
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
      transparent = true,
    },
  },
}
