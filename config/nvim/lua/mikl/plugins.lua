local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

local pack_path = fn.stdpath("data") .. "/site/pack"

-- ensure a given plugin from github.com/<user>/<repo> is cloned in the pack/packer/start directory
local function ensure (user, repo)
  local install_path = fmt("%s/packer/start/%s", pack_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

-- ensure the plugin manager is installed
ensure("wbthomason", "packer.nvim")

require('packer').startup(function(use)
  -- Use Packer to update Packer.
  use {'wbthomason/packer.nvim'}

  -- LSP config to use language servers.
  use {'neovim/nvim-lspconfig'}

  -- Telescope for quick file finding.
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim'}}}

  -- Treesitter for syntax highlighting and more.
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- .editorconfig support.
  use {'gpanders/editorconfig.nvim'}

  -- Fancy statusline.
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  use {'numToStr/Comment.nvim'}

  use {'jose-elias-alvarez/null-ls.nvim'}

  use {'kyazdani42/nvim-tree.lua'}

  -- My favoirte color scheme.
  use {'sainnhe/sonokai'}
end)

vim.api.nvim_set_var('sonokai_better_performance', 1)
vim.api.nvim_set_var('sonokai_style', 'espresso')
vim.cmd('colorscheme sonokai')

require('mikl/null-ls')
require('mikl/nvim-tree')
require('mikl/telescope')
require('mikl/treesitter')

require('Comment').setup()

require('lualine').setup({
  options = {
      icons_enabled = false,
      theme = 'sonokai',
      globalstatus = true,
    },
  })

