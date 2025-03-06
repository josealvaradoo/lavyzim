return {
  {
    -- Plugin: Code Companion
    -- Repository: https://github.com/olimorris/codecompanion.nvim
    -- Description: Code Companion is a plugin that provides a coding powered by IA feature.
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local map = LazyVim.safe_keymap_set
      require("codecompanion").setup({
        opts = {
          show_defaults = false,
        },
        strategies = {
          chat = {
            adapter = "qwen",
          },
          inline = {
            adapter = "qwen",
          },
        },
        adapters = {
          qwen = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "qwen",
              env = {
                url = "https://dashscope-intl.aliyuncs.com/compatible-mode",
                api_key = "DASHSCOPE_API_KEY",
              },
              schema = {
                model = {
                  default = "qwen-max",
                },
                temperature = {
                  default = 0,
                },
              },
            })
          end,
          grok = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "grok",
              env = {
                url = "https://api.x.ai",
                api_key = "GROK_API_KEY",
              },
              schema = {
                model = {
                  default = "grok-2-latest",
                },
                temperature = {
                  default = 0,
                },
              },
            })
          end,
        },
        display = {
          chat = {
            window = {
              layout = "float",
            },
            start_in_insert_mode = true,
          },
        },
      })

      map("n", "<leader>a", "", { desc = "Code Companion IA" })
      map({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
      -- Chat
      map("n", "<leader>aa", "<cmd>CodeCompanionChat<cr>", { desc = "Open chat" })
      map("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle chat" })
      map("v", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add selected code to chat" })
      -- Inline
      map("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Open a new IA prompter" })
    end,
  },
  {
    -- Plugin: avante.nvim
    -- Repository: https://github.com/yetone/avante.nvim
    -- Description: A Neovim plugin for coding powered by AI.
    ---@class AvanteConflictHighlights
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    enabled = false,
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "gemini", -- Recommend using Claude
      auto_suggestions_provider = "copilot", -- Recommend using Copilot
      copilot = {
        temperature = 0,
        model = "gpt-4o-2024-08-06",
      },
      claude = {
        temperature = 0,
        model = "claude-3-5-sonnet-20241022",
      },
      gemini = {
        temperature = 0,
        model = "gemini-2.0-flash-thinking-exp-01-21",
      },
      behaviour = {
        auto_suggestions = true, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      dual_boost = {
        enabled = false,
        first_provider = "claude",
        second_provider = "copilot",
        prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000, -- Timeout in milliseconds
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 35, -- default % based on available width
        sidebar_header = {
          enabled = true, -- true, false to enable/disable the header
          rounded = true,
          align = "left", -- left, center, right for title
        },
        input = {
          prefix = "> ",
          height = 8, -- Height of the input window in vertical layout
        },
        edit = {
          border = "rounded",
          start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = true, -- Start insert mode when opening the ask window
          border = "rounded",
          ---@type "ours" | "theirs"
          focus_on_apply = "ours", -- which diff to focus after applying
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      "supermaven-inc/supermaven-nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
