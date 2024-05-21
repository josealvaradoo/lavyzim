-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<Down>", '<cmd>echo "Arrow disabled, use j instead"<cr>', { desc = "Move down disabled" })
map("n", "<Up>", '<cmd>echo "Arrow disabled, use k instead"<cr>', { desc = "Move up disabled" })
map("n", "<Left>", '<cmd>echo "Arrow disabled, use h instead"<cr>', { desc = "Move left disabled" })
map("n", "<Right>", '<cmd>echo "Arrow disabled, use l instead"<cr>', { desc = "Move right disabled" })

map("v", "J", ":m+1<cr>", { desc = "Move line to down" })
map("v", "K", ":m-2<cr>", { desc = "Move line to up" })

map("n", "dd", '"_dd<cr>', { desc = "Delete without cut off" })
map("v", "d", '"_d<cr>', { desc = "Delete without cut off" })
