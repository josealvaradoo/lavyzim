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
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        palette = {
          main = {
            _nc = "#16141f",
            base = "#191724",
            surface = "#1f1d2e",
            overlay = "#26233a",
            muted = "#6e6a86",
            subtle = "#908caa",
            text = "#e0def4",
            love = "#eb6f92",
            gold = "#f6c177",
            rose = "#ebbcba",
            pine = "#31748f",
            foam = "#9ccfd8",
            iris = "#c4a7e7",
            leaf = "#95b1ac",
            highlight_low = "#21202e",
            highlight_med = "#403d52",
            highlight_high = "#524f67",
            none = "NONE",
          },
          moon = {
            _nc = "#1f1d30",
            base = "#232136",
            surface = "#2a273f",
            overlay = "#393552",
            muted = "#6e6a86",
            subtle = "#908caa",
            text = "#e0def4",
            love = "#eb6f92",
            gold = "#f6c177",
            rose = "#ea9a97",
            pine = "#3e8fb0",
            foam = "#9ccfd8",
            iris = "#c4a7e7",
            leaf = "#95b1ac",
            highlight_low = "#2a283e",
            highlight_med = "#44415a",
            highlight_high = "#56526e",
            none = "NONE",
          },
          dawn = {
            _nc = "#f8f0e7",
            base = "#faf4ed",
            surface = "#fffaf3",
            overlay = "#f2e9e1",
            muted = "#9893a5",
            subtle = "#797593",
            text = "#575279",
            love = "#b4637a",
            gold = "#ea9d34",
            rose = "#d7827e",
            pine = "#286983",
            foam = "#56949f",
            iris = "#907aa9",
            leaf = "#6d8f89",
            highlight_low = "#f4ede8",
            highlight_med = "#dfdad9",
            highlight_high = "#cecacd",
            none = "NONE",
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-dawn",
      transparent = true,
    },
  },
}
