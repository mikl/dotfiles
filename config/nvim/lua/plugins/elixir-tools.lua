return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  ft = { "elixir", "eex", "heex", "surface" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")

    elixir.setup({
      nextls = { enable = true },
      credo = {},
      elixirls = {
        enable = false,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
