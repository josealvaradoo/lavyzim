return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  version = false,
  build = ":TSUpdate",
  event = { "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
      "html",
      "css",
      "scss",
      "go",
      "php",
      "cpp",
      "tsx",
      "vue",
      "svelte",
    },
  },
}
