local image =
  "chafa ~/.config/nvim/lua/assets/dashboard/github-copilot.png --size 30x30 --format symbols --align center -c full"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      toggle = {},
      bigfile = {},
      indent = {},
      input = {},
      notify = {},
      notifier = {},
      quickfile = {},
      statuscolumn = {},
      words = {},
      zen = {},
      picker = {
        enabled = true,
        ui_select = true,
      },
      ---@class snacks.dashboard.Config
      dashboard = {
        preset = {
          header = [[]], -- use [[]] when you want to use a custom header
        },
        formats = {
          header = {
            "%s",
            align = "center",
          },
        },
        sections = {
          {
            section = "header",
            padding = 0,
            enabled = true, -- enable for yummy
          },
          {
            pane = 1,
            {
              section = "terminal",
              cmd = image,
              height = 18,
              width = 60,
              padding = 0,
            },
          },
          {
            pane = 2,
            {
              { section = "keys", gap = 1, padding = 2 },
              { section = "startup" },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>cz",
        function()
          Snacks.dim()
        end,
        desc = "Toggle zen mode",
      },
      {
        "<leader>cZ",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle zoom",
      },
    },
    init = function()
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#56635f" })
    end,
  },
}
