return {
  {
    -- Plugin: CopilotChat.nvim
    -- Repository: https://github.com/CopilotC-Nvim/CopilotChat.nvim
    -- Description: A IA assistant by Github Copilot.
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    cmd = "CopilotChat",
    enabled = true,
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = false,
        question_header = "  " .. user .. " ",
        model = "claude-sonnet-4",
        temperature = 0.1,
        window = {
          width = 0.4,
          title = "  IA Assistant",
        },
        headers = {
          user = "  " .. user .. " ",
          assistant = "  Copilot ",
          tool = "🔧 Tool: ",
        },
        separator = "━━",
        show_folds = false,
        prompts = {
          Angular = {
            prompt = "You are a senior angular developer expert. Analyze harder my requirement and give me solutions following the Angular-way. Ask me the version of Angular to proceed. You have to deliver clean code, using popular patterns for Angular, and modular code. Think harder. DO NOT hallucinate.",
            description = "Prepare your assistant for Angular",
          },
          Node = {
            prompt = "You are a senior node backend developer expert. Analyze harder my requirement and give me solutions following the best practice for javacript on the backend (express). You have to deliver clean code, using design patterns. DO NOT hallucinate. Think harder.",
            description = "Prepare your assistant for Node",
          },
        },
      }
    end,
    config = function(_, opts)
      local chat = require("CopilotChat")

      -- Auto-command to customize chat buffer behavior
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
        end,
      })
      chat.setup(opts)
    end,
  },
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
        extensions = {
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
            convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
            add_mcp_prefix = false, -- Add "mcp_" prefix to function names
          },
        },
      })
    end,
  },
}
