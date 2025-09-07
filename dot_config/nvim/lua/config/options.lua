-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { { ".git", "lua", "mix.exs" }, "cwd" }

if vim.g.neovide then
  vim.o.guifont = "Iosevka Slab:h12"

  vim.g.neovide_cursor_vfx_mode = "pixiedust"

  -- macOS keybinding, copied from https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
