-- Import core config file, shared with regular Vim'
vim.cmd 'source ~/.config/nvim/core.vim'

require('mikl/plugins')
require('mikl/keybinds')

-- Use single global statusline instead of one per window.
vim.opt.laststatus = 3
vim.opt.termguicolors = true
