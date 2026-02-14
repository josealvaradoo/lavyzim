return {
  {
    -- Plugin: CopilotChat.nvim
    -- Repository: https://github.com/CopilotC-Nvim/CopilotChat.nvim
    -- Description: A IA assistant by Github Copilot.
    "josealvaradoo/CopilotChat.nvim",
    -- dir = "~/Dev/lua/CopilotChat.nvim",
    branch = "dev",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    cmd = "CopilotChat",
    build = "make tiktoken",
    enabled = true,
    -- ⌨️ Keybindings (The "Senior" Workflow)
    keys = {
      { "<leader>aa", ":CopilotChatToggle<CR>", desc = "🤖 Toggle Chat" },
      -- { "<leader>aq", ":CopilotChatAsk<CR>", desc = "🙋 Ask Mentor" },
      -- { "<leader>ap", ":CopilotChatPlan<CR>", desc = "🧠 Plan Architecture" },
      -- { "<leader>ar", ":CopilotChatReview<CR>", desc = "🧐 Code Review (Diff)" },
      -- { "<leader>ac", ":CopilotChatCoder<CR>", desc = "🔨 Coder (Exec)" },
    },
    opts = function()
      local user = vim.env.USER or "User"
      local model = require("CopilotChat.config").model

      user = user:sub(1, 1):upper() .. user:sub(2)

      return {
        auto_insert_mode = false,
        question_header = "  " .. user .. " ",
        model = "gpt-4o",
        temperature = 0.2,
        window = {
          width = 0.4,
          title = "  IA Assistant",
        },
        headers = {
          user = "  " .. string.lower(user) .. " ",
          assistant = "  Copilot →  " .. model,
          tool = "🔧 Tool: ",
          model = " Model: $model",
        },
        separator = "──────────────",
        show_folds = true,
        auto_fold = true,
        prompts = {
          Ask = {
            prompt = 'You are a Senior Software Engineer and a Code Assistant acting as a Technical Mentor. You are proficient in multiple languages and an expert on Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI). Your mode is strictly CONSULTATION. You do NOT edit files. You receive questions or doubts and provide comprehensive, high-level technical answers. You structure your responses using markdown, titles, and emojis to make complex concepts easy to understand. You explain not only "how" something works but "why" it follows specific principles. You use code examples for illustration purposes only. Your goal is to educate the user, clearing their doubts with professional, friendly, and accurate technical knowledge. Your focus: Education, Mentorship, Explanations. No Edits.',
            system_prompt = "You are a Senior Software Engineer and a Code Assistant acting as a highly skilled Technical Mentor.",
            description = "Ask anything to your technical mentor.",
            model = "gpt-4.1", -- alternative: gpt-5-mini | claude-haiku-4.5
            temperature = 0.2,
            mapping = "<leader>aq",
          },
          Plan = {
            prompt = "You are a Senior Software Engineer and Planning Agent highly proficient on multiple programming languages and frameworks. You are an expert on Clean Code, System Architecture, and Software Development Principles such as SOLID, DRY, KISS, YAGNI, and Separation of Concerns. Your mode is strictly PLANNING. You must product two outputs: 1) PLAN.md — which contains a high-level human-readable architecture plan where you describe the achitecture using markdown styles and emojis, with a friendly language. It contains an Explanation about what you going to do and why behind your design choices, comparing them to alternatives if any. Also ensuring the plan strictly adheres to Design Patterns and Best Practices. Moreover, PLAN.md must contains a step-by-step TODO list well-explained. 2) EXECUTION.md — a machine-readable, ultra-atomic task list for a lightweight executor model (like GPT-5-mini, grok-code-fast-1, qwen-2.5-coder:7b). EXECUTION.md contains zero explanation and must consist ONLY of atomic, deterministic tasks mapped to explicit tool calls. Each step in EXECUTION.md must specify: - tool or mcp name; - exact file path; - exact operation; - required inputs; - required output format; - exact verification condition; - no reasoning or alternatives. PLAN.md explains steps; EXECUTION.md contains the exact steps to execute. Your focus is: Deep Analysis, Architecture, Reasoning and Planing. No Edits.",
            system_prompt = "You are a Senior Software Engineer and a Code Assistant acting as a highly skilled Technical Lead.",
            description = "Plan solutions as a senior engineer",
            model = "gemini-3-pro-preview", -- alternative: claude-sonnet-4.5 | claude-haiku-4.5 | gpt-5-mini | gpt-4.1
            temperature = 0.1,
            mapping = "<leader>ap",
          },
          Review = {
            prompt = "You are a Senior Software Engineer and a strict Tech Lead, highly proficient on multiple programming languages. You are the guardian of Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI, Separation of Concerns). Your mode is strictly REVIEW. You do NOT edit files. You analyze the provided context or code diffs with a critical eye to identify logic errors, security vulnerabilities, code smells, or architectural violations. You provide your feedback as a structured Code Review using markdown, titles, and emojis. You are professional and friendly, but firm on standards. For every issue found, you explain why it violates a principle and provide the correct code snippet or pattern as a suggestion to elevate the code quality to a senior level. Your focus: Audit, Critique, Standards. No Edits.",
            system_prompt = "You are a Senior Software Engineer and a Code Assistant acting as a highly skilled and very strict Technical Lead.",
            description = "Review code as a strict tech lead",
            model = "claude-sonnet-4.5", -- alternative: gpt-5.1-codex-mini | gpt-5-mini
            temperature = 0.1,
            mapping = "<leader>ar",
          },
          Code = {
            prompt = "You are an expert Senior Software Engineer and a Code Assistant, highly proficient on multiple programming languages and frameworks. You are an expert on Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI). Your mode is strictly EXECUTION. You do NOT chat, you do NOT explain, and you do NOT re-thinking. You accept the provided plan or requirements and immediately act to implement them. You prioritize functional correctness and efficiency. You apply all best practices silently. You output ONLY the necessary tool executions, file creations, or code edits required to complete the task. Your response must be extremely concise, minimizing token usage, containing zero conversational filler, and focusing 100% on the accurate implementation of the code. If a EXECUTION.md file is provided, you must follow it step-by-step. Do not change its order, do not interpret it, do not optimize it. Execute exactly one step at a time. Your focus: Execution, Tools, Zero Verbosity. No Chat, though you can report a summar at the end of the execution.",
            system_prompt = "You are a Senior Software Engineer and a Code Assistant ready to follow instructions strictly.",
            description = "Write code as a senior engineer",
            model = "grok-code-fast-1", -- alternative: gpt-5.1-codex-mini | gpt-5-mini
            temperature = 0.1,
            mapping = "<leader>ac",
          },
          Agentic = {
            prompt = "You are a Software Development Assistant highly efficient. Your mode is strictly AGENT to ONLY run any tools. You must follow the instructions strictly without questions nor recommendations, nor rasoning. If the tool fails, then you have to explain briefly what happened. Your focus: Tools Execution, Zero Verbosity. No Chat.",
            system_prompt = "You are a Senior Software Assistant ready to follow instructions strictly.",
            description = "Execute any tool",
            model = "gpt-5-mini", -- alternative: gpt-5.1-codex-mini | grok-code-fast-1
            temperature = 0.1,
            mapping = "<leader>at",
          },
        },
      }
    end,
    config = function(_, opts)
      local chat = require("CopilotChat")
      vim.api.nvim_set_hl(0, "CopilotChatSeparator", { fg = "#374151" })
      vim.api.nvim_set_hl(0, "CopilotChatHeader", { fg = "#dbbc7f", bold = false })

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
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      ---@module 'snacks'
      { "folke/snacks.nvim" },
    },
    config = function()
      local map = LazyVim.safe_keymap_set

      local select = function()
        require("opencode").select()
      end

      local add = function()
        require("opencode").prompt("@this")
      end

      local toggle = function()
        require("opencode").toggle()
      end

      local ask = function()
        require("opencode").ask("@this: ", { submit = true })
      end

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      map("n", "<leader>ao", "", { desc = "opencode" })
      map("n", "<leader>aot", function()
        toggle()
      end, { desc = "Toggle" })
      map("n", "<leader>aoa", function()
        ask()
      end, { desc = "Ask this" })
      map({ "n", "v" }, "<leader>aos", function()
        select()
      end, { desc = "Execute opencode action…" })
      map({ "n", "x" }, "<leader>ao>", function()
        add()
      end, { desc = "Add to opencode" })
    end,
  },
}
