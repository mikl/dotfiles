-- NeoVim-specific keybinds. Core keybinds are in core.vim.


----------------- Easy split navigation -----------------

-- Normal mode.
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Insert and visual mode.
vim.keymap.set({'i', 'v'}, '<c-h>', '<Esc><c-w>h')
vim.keymap.set({'i', 'v'}, '<c-j>', '<Esc><c-w>j')
vim.keymap.set({'i', 'v'}, '<c-k>', '<Esc><c-w>k')
vim.keymap.set({'i', 'v'}, '<c-l>', '<Esc><c-w>l')

-- Terminal mode:
vim.keymap.set('t', '<c-h>', "<c-\\><c-n><c-w>h")
vim.keymap.set('t', '<c-j>', "<c-\\><c-n><c-w>j")
vim.keymap.set('t', '<c-k>', "<c-\\><c-n><c-w>k")
vim.keymap.set('t', '<c-l>', "<c-\\><c-n><c-w>l")

