-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

----------------- Easy split navigation -----------------

-- Normal mode bindings are included in lazyvim defaults.
-- Insert and visual mode.
vim.keymap.set({ "i", "v" }, "<C-h>", "<Esc><C-w>h", { desc = "Go to left window" })
vim.keymap.set({ "i", "v" }, "<C-j>", "<Esc><C-w>j", { desc = "Go to lower window" })
vim.keymap.set({ "i", "v" }, "<C-k>", "<Esc><C-w>k", { desc = "Go to upper window" })
vim.keymap.set({ "i", "v" }, "<C-l>", "<Esc><C-w>l", { desc = "Go to right window" })

-- Terminal mode:
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
