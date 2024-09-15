return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, opts = { flavour = "macchiato" } },
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = true, opts = { flavour = "dragon" } },
  { "qaptoR-nvim/chocolatier.nvim", priority = 1000, config = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
