-- Treesitter configuration.
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "hcl",
    "heex",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "python",
    "regex",
    "scss",
    "surface",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
}
