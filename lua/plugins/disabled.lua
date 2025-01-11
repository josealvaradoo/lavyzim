-- This file contains the configuration for disabling specific Neovim plugins.

return {
  {
    -- Plugin: bufferline.nvim
    -- URL: https://github.com/akinsho/bufferline.nvim
    -- Description: A snazzy buffer line (with tabpage integration) for Neovim.
    "akinsho/bufferline.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    -- Plugin: markdown-preview.nvim
    -- URL: https://github.com/iamcco/markdown-preview.nvim
    -- Description: A markdown preview plugin for Neovim.
    "iamcco/markdown-preview.nvim",
    enabled = false, -- Disable this plugin
  },
  {
    -- Plugin: vim-visual-multi
    -- URL: https://github.com/mg979/vim-visual-multi
    -- Description: A plugin to select multiple lines simultaneously.
    "mg979/vim-visual-multi",
    enabled = false, -- Disable this plugin
  },
  {
    -- Plugin: neo-tree.nvim
    -- URL: https://github.com/nvim-neo-tree/neo-tree.nvim
    -- Description: Neovim plugin to manage the file system and other tree like structures.
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
