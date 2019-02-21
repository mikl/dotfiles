"
" Plugin config for NeoVim.
"
" Configure Vundle.
call plug#begin('$HOME/.config/nvim/plugged')

  " From Github.
  Plug 'airblade/vim-gitgutter'
  Plug 'ciaranm/securemodelines'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'iCyMind/NeoSolarized'
  Plug 'joonty/vdebug'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'phanviet/vim-monokai-pro'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Neomake for code style and syntax checks.
  Plug 'neomake/neomake'

  " Neosnippet and dependencies.
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

call plug#end()
