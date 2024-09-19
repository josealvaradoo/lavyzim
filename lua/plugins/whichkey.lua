-- Shows you the keybindings that are available to you
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  keys = {
    {
      "<leader>bc",
      function()
        -- :%bd - Deletes all buffers
        -- |e# - Reopens the last buffer
        -- |bd# - Deletes the alternate buffer, which is now the last buffer
        -- '" Keep my current cursor position
        vim.cmd(":%bd|e#|bd#|'\"")
      end,
      desc = "Close all buffers but current",
    },
  },
}
