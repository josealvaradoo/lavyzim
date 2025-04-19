return {
  {
    -- Plugin: akinsho/git-conflict.nvim
    -- URL: https://github.com/akinsho/git-conflict.nvim
    -- Description: Visualize and solve conflicts in nvim.
    "akinsho/git-conflict.nvim",
    name = "git-conflict",
    version = "*",
    config = true,
    lazy = true,
    event = "VeryLazy",
  },
  {
    -- Plugin: lewis6991/gitsigns.nvim
    -- URL: https://github.com/lewis6991/gitsigns.nvim
    -- Description: Provides Git integration for Neovim.
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function()
          local map = LazyVim.safe_keymap_set

          map("n", "<leader>gb", ":Gitsigns blame<cr>", { desc = "Git blame line" })
        end,
      })
    end,
  },
}
