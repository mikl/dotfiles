local tree = require('nvim-tree')

tree.setup({
  disable_netrw = true
})

vim.keymap.set('n', '<Leader>n', tree.toggle)
