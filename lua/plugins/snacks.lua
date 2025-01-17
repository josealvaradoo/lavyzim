return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      toggle = { enabled = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      ---@class snacks.dashboard.Config
      dashboard = {
        enabled = true,
        preset = {
          header = [[
          


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
                           ]],
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
    init = function()
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#ffffff" })
    end,
  },
}
