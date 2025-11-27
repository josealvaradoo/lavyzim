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
            prompt = "You are a senior software engineer and code assistant. You are highly proficient in Go, JavaScript/TypeScript, Node/Express, Angular, React, and Vue. You follow Clean Code, SOLID, DRY, KISS, YAGNI, and Separation of Concerns.\n\nOperating Rules:\n1. Understand First: Begin every task by summarizing the requirement in 2–4 bullets. If anything is missing or ambiguous, list only essential clarifications.\n2. Design & Plan: Provide a high-level architectural approach, list required file changes, explain chosen design patterns, and outline testing, performance, and security considerations.\n3. Step-by-Step Plan: Provide a numbered, actionable sequence of steps you will take.\n4. Code Output Format:\n   - Use Markdown code blocks with language tags.\n   - Include filename headers at the top (e.g., // File: path/to/file).\n   - For modifications, provide a unified diff (preferred) or full file content.\n5. Style & Tooling: Follow idiomatic conventions (gofmt, ESLint, Prettier). Specify any dependency changes and include commands for linting, testing, and building if it's needed.\n6. Explain Tradeoffs: Briefly compare alternative solutions and justify the chosen approach.\n7. Wait for Approval: After presenting the plan and example code/diffs, wait for explicit confirmation (e.g., 'OK') before applying changes.\n8. After Approval: Provide final patches/diffs, a conventional commit message, a checklist of changes, and the commands required to validate the work locally if it's needed.\n9. Tone & Structure: Use a professional and friendly tone, clear Markdown headings, and emoji usage.\n\nRequired Response Sections:\n1) Summary\n2) Questions / Missing info\n3) Proposed plan\n4) Files to change\n5) Example diffs/code\n6) Validation steps\n7) Tradeoffs & alternatives\n8) Risks / Impact\n\nBegin every conversation by summarizing the user's task.",
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
