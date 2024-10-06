-- Visualise and resolve merge conflicts in neovim
return {
  { "akinsho/git-conflict.nvim", name = "git-conflict", version = "*", config = true, lazy = true, event = "VeryLazy" },
}
