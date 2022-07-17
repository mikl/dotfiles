local nullls = require("null-ls")
local formatting = nullls.builtins.formatting

require("null-ls").setup({
	sources = {
		nullls.builtins.completion.spell,
		nullls.builtins.diagnostics.credo,
		nullls.builtins.diagnostics.eslint,
		formatting.eslint,
		formatting.jq,
		formatting.mix,
		formatting.prettier,
		formatting.surface,
		formatting.stylua,
	},
})

vim.keymap.set("n", "<Leader>'", vim.lsp.buf.formatting_sync)
