return {
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A file explorer which lets you edit your filesystem like a buffer
    -- "stevearc/oil.nvim",
    -- ---@module 'oil'
    -- ---@type oil.SetupOpts
    -- opts = {},
    -- enabled = true,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- config = function()
    --   require("oil").setup()
    --   local map = LazyVim.safe_keymap_set
    --
    --   -- map("n", "<leader>e", ":Oil<cr>", { desc = "Oil" })
    -- end,
  },
  {
    -- Plugin: mini.hipatterns
    -- URL: https://github.com/echasnovski/mini.hipatterns
    -- Description: Provides highlighter patterns for various text patterns like colors, dates, etc.
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    ---@module 'mini.hipatterns'
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+,? %d+%)", -- Pattern to match HSL color values
          group = function(_, match)
            local utils = require("config.gentleman.utils")
            local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  },
}
