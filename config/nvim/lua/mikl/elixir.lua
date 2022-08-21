local elixir = require('elixir')

elixir.setup({
  tag = 'v0.10.0',

  -- default settings, use the `settings` function to override settings
  settings = elixir.settings({
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = false,
    suggestSpecs = false,
  }),

  on_attach = function(client, bufnr)
    local map_opts = { buffer = true, noremap = true}

    -- run the codelens under the cursor
    vim.keymap.set('n', '<space>r',  vim.lsp.codelens.run, map_opts)
    -- remove the pipe operator
    vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', map_opts)
    -- add the pipe operator
    vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', map_opts)
    vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', map_opts)

    -- standard lsp keybinds
    vim.keymap.set('n', 'df', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>', map_opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.diagnostic.open_float()<cr>', map_opts)
    vim.keymap.set('n', 'dt', '<cmd>lua vim.lsp.buf.definition()<cr>', map_opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', map_opts)
    vim.keymap.set('n', 'gD','<cmd>lua vim.lsp.buf.implementation()<cr>', map_opts)
    vim.keymap.set('n', '1gD','<cmd>lua vim.lsp.buf.type_definition()<cr>', map_opts)
    -- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
    -- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
    -- there are also core vim.lsp functions that put the same data in the loclist
    vim.keymap.set('n', 'gr', ':References<cr>', map_opts)
    vim.keymap.set('n', 'g0', ':DocumentSymbols<cr>', map_opts)
    vim.keymap.set('n', 'gW', ':WorkspaceSymbols<cr>', map_opts)
    vim.keymap.set('n', '<leader>d', ':Diagnostics<cr>', map_opts)

    -- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
    -- require('cmp_nvim_lsp').update_capabilities(capabilities)
  end
})

