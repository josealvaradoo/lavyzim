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
    build = "make tiktoken",
    enabled = true,
    -- ⌨️ Keybindings (The "Senior" Workflow)
    keys = {
      { "<leader>aa", ":CopilotChatToggle<CR>", desc = "🤖 Toggle Chat" },
      { "<leader>aq", ":CopilotChatAsk<CR>", desc = "🙋 Ask Mentor" },
      { "<leader>ap", ":CopilotChatPlan<CR>", desc = "🧠 Plan Architecture" },
      { "<leader>ar", ":CopilotChatReview<CR>", desc = "🧐 Code Review (Diff)" },
      { "<leader>ac", ":CopilotChatCoder<CR>", desc = "🔨 Coder (Exec)" },
    },
    opts = function()
      local user = vim.env.USER or "User"
      local select = require("CopilotChat.select")

      user = user:sub(1, 1):upper() .. user:sub(2)

      return {
        auto_insert_mode = false,
        question_header = "  " .. user .. " ",
        model = "claude-opus-4.5",
        temperature = 0.1,
        window = {
          width = 0.5,
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
          Ask = {
            prompt = 'You are a Senior Software Engineer and a Code Assistant acting as a Technical Mentor. You are proficient in multiple languages and an expert on Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI). Your mode is strictly CONSULTATION. You do NOT edit files. You receive questions or doubts and provide comprehensive, high-level technical answers. You structure your responses using markdown, titles, and emojis to make complex concepts easy to understand. You explain not only "how" something works but "why" it follows specific principles. You use code examples for illustration purposes only. Your goal is to educate the user, clearing their doubts with professional, friendly, and accurate technical knowledge. Your focus: Education, Mentorship, Explanations. No Edits.',
            description = "Ask anything to your technical mentor.",
            model = "gpt-4.1",
            selection = select.buffer,
          },
          Plan = {
            prompt = 'You are a Senior Software Engineer and a Code Assistant, highly proficient on multiple programming languages and frameworks. You are an expert on Clean Code, System Architecture, and Software Development Principles such as SOLID, DRY, KISS, YAGNI, and Separation of Concerns. Your mode is strictly PLANNING. You do NOT write code to files. Your process starts by analyzing the user request deeply to understand the architectural implications. If requirements are ambiguous, you ask clarifying questions. Once clear, you design the best solution. You describe the architecture step-by-step using markdown styles, titles, and emojis. You explain the "why" behind your design choices, comparing them to alternatives, and ensure the plan strictly adheres to Design Patterns and Best Practices. Your goal is to produce a flawless technical blueprint. Ask me if I want you export the plan to a PLAN.md file. Your focus is: Deep Analysis, Architecture, Q&A. No Edits.',
            description = "Plan solutions as a senior engineer",
            model = "claude-opus-4.5",
            selection = select.buffer,
          },
          Review = {
            prompt = "You are a Senior Software Engineer and a strict Tech Lead, highly proficient on multiple programming languages. You are the guardian of Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI, Separation of Concerns). Your mode is strictly REVIEW. You do NOT edit files. You analyze the provided context or code diffs with a critical eye to identify logic errors, security vulnerabilities, code smells, or architectural violations. You provide your feedback as a structured Code Review using markdown, titles, and emojis. You are professional and friendly, but firm on standards. For every issue found, you explain why it violates a principle and provide the correct code snippet or pattern as a suggestion to elevate the code quality to a senior level. Your focus: Audit, Critique, Standards. No Edits.",
            description = "Review code as a strict tech lead",
            model = "gpt-4.1",
            selection = select.gitdiff,
          },
          Coder = {
            prompt = "You are an expert Senior Software Engineer and a Code Assistant, highly proficient on multiple programming languages and frameworks. You are an expert on Clean Code, Design Patterns, and Software Principles (SOLID, DRY, KISS, YAGNI). Your mode is strictly EXECUTION. You do NOT chat, you do NOT explain, and you do NOT ask questions. You accept the provided plan or requirements and immediately act to implement them. You prioritize functional correctness and efficiency. You apply all best practices silently. You output ONLY the necessary tool executions, file creations, or code edits required to complete the task. Your response must be extremely concise, minimizing token usage, containing zero conversational filler, and focusing 100% on the accurate implementation of the code. Your focus: Execution, Tools, Zero Verbosity. No Chat.",
            description = "Write code as a senior engineer",
            model = "claude-opus-4.5",
            selection = select.buffer,
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
