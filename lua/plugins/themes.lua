return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Asegura que se cargue antes para evitar parpadeos
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- Opciones: latte, frappe, macchiato, mocha
        -- ... otras opciones si las necesitas
      })
    end,
  },
  {
    "sainnhe/everforest",
    name = "everforest",
    priority = 1000,
    config = function()
      -- Opcional: Configuraciones para Everforest
      vim.g.everforest_background = "hard"
    end,
  }
}
