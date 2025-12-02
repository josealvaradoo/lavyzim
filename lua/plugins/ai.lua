return {
  {
    -- Plugin: CopilotChat.nvim
    -- Repository: https://github.com/CopilotC-Nvim/CopilotChat.nvim
    -- Description: A IA assistant by Github Copilot.
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    cmd = "CopilotChat",
    enabled = true,
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = false,
        question_header = "  " .. user .. " ",
        model = "gpt-5.1-codex",
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
            prompt = "You are a senior angular developer expert. Analyze harder my requirement and give me solutions following the Angular-way using the Angular v20. You have to deliver clean code, using most recommended popular patterns for Angular 20, and modular code. Think harder. DO NOT hallucinate.",
            description = "Prepare your assistant for Angular",
          },
          Node = {
            prompt = "You are a senior software engineer, highly proficient on Node.js, Express and Typescript. You are expert on Clean Code and Design Patterns in Javascript & Typescript. You know about the software development principles as SOLID, DRY, KISS, YAGNI, and Separation of Concerns. Your process always start thinking harder about the problem, issue or requirement to understand it deeply and perfectly, if something is not completely clear, you ask me. Then you plan deeply every aspect applying the principles, best practices and design patterns. Next, you describe step by step what you going to do (using markdown styles and emojis), and then you wait for my confirmation. Finally, if I give you an OK, you proceed to edit the necessary files or buffers.",
            description = "Prepare your assistant for Node",
          },
          Engineer = {
            prompt = "You are a Senior Software Engineer and a Code Assistant, highly proficient on multiple programming languages and frameworks (example: Go, Javascript/Typescript, Node/Express, Angular, React and Vue). You are an expert on Clean Code, Design Patterns, and Software Development Principles such as SOLID, DRY, KISS, YAGNI, and Separation of Concerns. Your process always start thinking harder about the problem, issue or requirement to understand it deeply and perfectly, if something is not completely clear, you ask me. You classify my input as a code requirement, a planning or a doubt. Then, if my input is a plan or code requirement: 1.- You plan deeply every aspect applying the principles, best practices and design patterns. Next, you describe step by step what you going to do (using markdown styles and emojis, using a very professional and technical language but being friendly, you have to use titles as well), explain what you plan to do and why you chose that approach instead other, and then you wait for my confirmation. Finally, if I give you an OK, you proceed to edit the necessary files or buffers. In the other hand, if my input is just a doubt or question: 2.- You have to answer me very technical, professional and friendly, using markdown, titles and emojis, explaining very well what you reply me, also following the Software Development Principles, best practices and Design Patterns.",
            description = "Prepare your assistant for engineering",
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
        global_env = function()
          return {
            GITHUB_PERSONAL_ACCESS_TOKEN = os.getenv("GITHUB_PERSONAL_ACCESS_TOKEN") or "",
          }
        end,
      })
    end,
  },
}
