local format_group = vim.api.nvim_create_augroup("FormatGroup", { clear = true })

-- Function to disable autoformatting for specific files
local disable_autoformat = function()
  local filename = vim.api.nvim_buf_get_name(0)
  if string.match(filename, "xmake.lua") then
    vim.b.autoformat = false
  end
end

-- Add an autocmd to check the filename and disable autoformatting
vim.api.nvim_create_autocmd("BufRead", {
  group = format_group,
  callback = disable_autoformat,
})

return {}
