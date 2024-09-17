return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({}) -- default config
    end,
  },
}
