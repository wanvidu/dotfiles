-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Enter>", "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

vim.keymap.set({ "i" }, "jj", "<Esc>", { noremap = false })
vim.keymap.set({ "i" }, "jk", "<Esc>", { noremap = false })
