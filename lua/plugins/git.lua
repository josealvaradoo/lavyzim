return {
  -- A git tool in neovim using commands
  { "tpope/vim-fugitive", name = "fugitive", lazy = true, cmd = "G" },

  -- Visualise and resolve merge conflicts in neovim
  { "akinsho/git-conflict.nvim", name = "git-conflict", version = "*", config = true, lazy = true, event = "VeryLazy" },

  -- Shows the git difference in different buffers
  -- { "sindrets/diffview.nvim", name = "diffview", cmd = "DiffviewOpen" },
}
