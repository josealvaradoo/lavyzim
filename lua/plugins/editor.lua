return {
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A file explorer which lets you edit your filesystem like a buffer
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    enabled = true,
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    -- Plugin: fzf-lua
    -- URL: https://github.com/ibhagwan/fzf-lua
    -- Description: Lua bindings for fzf
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      defaults = {
        no_header = true,
      },
      winopts = {
        height = 0.8,
        width = 0.8,
        border = "rounded",
        title = nil,
        treesitter = {
          enabled = true,
          fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
        },
        preview = {
          layout = "flex",
          scrollbar = "border",
          horizontal = "right:65%",
          winopts = {
            number = false,
          },
        },
      },
    },
  },
}
