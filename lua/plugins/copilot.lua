return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = true },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    event = "VeryLazy",
    dependencies = { "copilot.lua" },
    opts = {},
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      local map = vim.keymap.set
      map({ "n", "v" }, "<leader>aa", "<cmd>CopilotChatToggle<cr>", { desc = "Abrir Copilot Chat" })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
