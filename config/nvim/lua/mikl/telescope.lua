require('telescope').setup({
  defaults = {
    color_devicons = false,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzy_native')

local tsb = require('telescope.builtin')

vim.keymap.set('n', '<Leader>f', tsb.find_files)

