return {
  {
    "mhanberg/elixir.nvim",
    name = "elixir",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
    config = function(_, _)
      local elixir = require("elixir")
      return {
        tag = "v0.12.0",
        settings = elixir.settings({
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        }),
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add Elixir-related treesitter syntaxes.
      vim.list_extend(opts.ensure_installed, {
        "eex",
        "elixir",
        "erlang",
        "heex",
        "surface",
      })
    end,
  },
}
