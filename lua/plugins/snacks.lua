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
      toggle = { enabled = true },
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
      ---@class snacks.dashboard.Config
      dashboard = {
        enabled = true,
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
    },
    init = function()
      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#ffffff" })
    end,
  },
}
