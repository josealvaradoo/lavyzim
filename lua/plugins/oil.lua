return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["gp"] = "actions.preview",
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function(_, opts)
    require("oil").setup(opts)
    local map = vim.keymap.set
    map("n", "<leader>e", ":Oil<CR>", { desc = "Oil" })
  end,
}
