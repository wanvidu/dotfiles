-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>se", "<cmd>FzfLua grep_curbuf<CR>", { desc = "Grep Current Buffer" })
vim.keymap.set({ "n", "v" }, "<leader>sE", "<cmd>FzfLua resume<CR>", { desc = "Resume Previous FZF" })
