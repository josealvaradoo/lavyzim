-- This is a plugin to show floatting notifications and cmdline box
return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false,
      },
    },
  },
}
