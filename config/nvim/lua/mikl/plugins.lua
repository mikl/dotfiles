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

  -- Treesitter for syntax highlighting and more.
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- .editorconfig support.
  use {'gpanders/editorconfig.nvim'}

  -- My favoirte color scheme.
  use {'sainnhe/sonokai'}
end)

vim.cmd('colorscheme sonokai')

require('mikl/treesitter')
