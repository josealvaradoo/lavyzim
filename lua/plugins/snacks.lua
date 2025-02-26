local header = [[
          


    ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒    ▒▓▓▓▓▒        ▒▓▓▓▓▒  
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒    ▒▓▓▓▓▓       ▒▓▓▓▓▒   
   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒      ▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓▓▒    
                         ▓▓▓▓▓▓▓▓▓▓▓▓▓▒      
                           ▒▒▒▒▒▒▒▒          
    ▒▒▒▒▒▒                                   
   ▓▓▓▓▓▓▓                                   
   ▓▓▓▓▓▓▓▒               ▒▒▒▒▒▒▒            
   ▒▓▓▓▓▓▓▓▒            ▒▓▓▓▓▓▓▓▒            
    ▒▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒              
     ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒                
       ▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒                   
                           

                           ]]

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
      explorer = {},
      ---@class snacks.picker.Config
      picker = {
        prompt = " ",
        sources = {},
        focus = "input",
        ui_select = true,
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        defaults = {
          no_header = true,
        },
      },
      ---@class snacks.dashboard.Config
      dashboard = {
        preset = {
          header = header,
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
            padding = 4,
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
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
    },
    init = function()
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#56635f" })
    end,
  },
}
