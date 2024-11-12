-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- Disable arrow keys to force using hjkl
map("n", "<Down>", '<cmd>echo "Arrow disabled, use j instead"<cr>', { desc = "Move down disabled" })
map("n", "<Up>", '<cmd>echo "Arrow disabled, use k instead"<cr>', { desc = "Move up disabled" })
map("n", "<Left>", '<cmd>echo "Arrow disabled, use h instead"<cr>', { desc = "Move left disabled" })
map("n", "<Right>", '<cmd>echo "Arrow disabled, use l instead"<cr>', { desc = "Move right disabled" })

-- Map Ctrl+c to escape from other modes
map({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

-- Move line up/down
map("v", "J", ":m+1<cr>", { desc = "Move line to down" })
map("v", "K", ":m-2<cr>", { desc = "Move line to up" })

-- Delete a line without cutting it
map("n", "dd", '"_dd', { desc = "Delete without cut off" })
map("v", "d", '"_d', { desc = "Delete without cut off" })

-- Resolve git conflicts
map("n", "gco", ":GitConflictChooseOurs<cr>", { desc = "Choose ours" })
map("n", "gct", ":GitConflictChooseTheirs<cr>", { desc = "Choose theirs" })
map("n", "gcb", ":GitConflictChooseBoth<cr>", { desc = "Choose base" })

-- Close all buffers but the current one
map("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>', { desc = "Delete other buffers but the current one" })
