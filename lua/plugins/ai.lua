return {
  {
    -- Plugin: mcphub.nvim
    -- Repository: https://github.com/ravitemer/mcphub.nvim
    -- Description: A Model Context Protocol for IA assistans like Github Copilot Chat.
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        extensions = {},
        global_env = function()
          return {
            GITHUB_PERSONAL_ACCESS_TOKEN = os.getenv("GITHUB_PERSONAL_ACCESS_TOKEN") or "",
          }
        end,
      })
    end,
  },
  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("opencode").setup({})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
      -- Optional, for file mentions and commands completion, pick only one
      "saghen/blink.cmp",
      -- 'hrsh7th/nvim-cmp',

      -- Optional, for file mentions picker, pick only one
      "folke/snacks.nvim",
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },
  -- {
  --   "NickvanDyke/opencode.nvim",
  --   enabled = false,
  --   dependencies = {
  --     ---@module 'snacks'
  --     { "folke/snacks.nvim" },
  --   },
  --   config = function()
  --     local map = LazyVim.safe_keymap_set
  --
  --     local select = function()
  --       require("opencode").select()
  --     end
  --
  --     local add = function()
  --       require("opencode").prompt("@this")
  --     end
  --
  --     local toggle = function()
  --       require("opencode").toggle()
  --     end
  --
  --     local ask = function()
  --       require("opencode").ask("@this: ", { submit = true })
  --     end
  --
  --     ---@type opencode.Opts
  --     vim.g.opencode_opts = {
  --       -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
  --     }
  --
  --     -- Required for `opts.events.reload`.
  --     vim.o.autoread = true
  --
  --     map("n", "<leader>ao", "", { desc = "opencode" })
  --     map("n", "<leader>aot", function()
  --       toggle()
  --     end, { desc = "Toggle" })
  --     map("n", "<leader>aoa", function()
  --       ask()
  --     end, { desc = "Ask this" })
  --     map({ "n", "v" }, "<leader>aos", function()
  --       select()
  --     end, { desc = "Execute opencode action…" })
  --     map({ "n", "x" }, "<leader>ao>", function()
  --       add()
  --     end, { desc = "Add to opencode" })
  --   end,
  -- },
}
