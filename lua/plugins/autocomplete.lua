return {
  -- Config autocomplete and code suggestions like IA Copilot
  -- {
  --   -- Plugin: Supermaven Nvim
  --   -- URL: https://github.com/supermaven-inc/supermaven-nvim
  --   -- Description: Supermaven is a fastest alternative to Github Copilot
  --   "supermaven-inc/supermaven-nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       keymaps = {
  --         accept_suggestion = "<Tab>",
  --         clear_suggestion = "<C-]>",
  --         accept_word = "<C-j>",
  --       },
  --     })
  --   end,
  -- },
  {
    -- Plugin: nvim-cmp
    -- URL: https://github.com/hrsh7th/nvim-cmp
    -- Description: A completion plugin for neovim coded in Lua
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
      opts.sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp", group_index = 2 },
        { name = "buffer" },
        { name = "path" },
      })
      opts.sorting = defaults.sorting

      return opts
    end,
    main = "lazyvim.util.cmp",
  },
}
