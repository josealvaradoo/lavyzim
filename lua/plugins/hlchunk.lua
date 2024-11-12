-- Highlight the current chunk/block of code in a file
return {
  {
    "shellRaining/hlchunk.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          priority = 15,
          style = {
            { fg = "#B3FFDD" }, -- #806d9c
            { fg = "#c21f30" }, -- #c21f30
          },
          use_treesitter = true,
          chars = {
            left_arrow = "─",
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
          duration = 200,
          delay = 300,
        },
      })
    end,
  },
}
