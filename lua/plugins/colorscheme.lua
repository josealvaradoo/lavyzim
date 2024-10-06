-- Install and set colorschemes
return {
  { "catppuccin/nvim", name = "catppuccin", lazy = true, opts = { flavour = "macchiato" } },
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = true, opts = { flavour = "dragon" } },
  { "qaptoR-nvim/chocolatier.nvim", priority = 1000, config = true, lazy = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "chocolatier",
    },
  },
}
