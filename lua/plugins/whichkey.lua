-- This file contains the configuration for the which-key.nvim plugin in Neovim.

return {
  {
    -- Plugin: which-key.nvim
    -- URL: https://github.com/folke/which-key.nvim
    -- Description: A Neovim plugin that displays a popup with possible keybindings of the command you started typing.
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end,
    keys = {
      {
        -- Keybinding to show which-key popup
        "<leader>?",
        function()
          require("which-key").show({ global = false }) -- Show the which-key popup for local keybindings
        end,
      },
    },
  },
}
