"
" Plugin config for NeoVim.
"
" Configure Vundle.
if !isdirectory("~/.vim/bundle/Vundle.vim/")
  filetype off " Vundle turns it on again.
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle
  Plugin 'VundleVim/Vundle.vim'

  " From Github.
  Plugin 'airblade/vim-gitgutter'
  Plugin 'benekastah/neomake'
  Plugin 'blueyed/vim-colors-solarized'
  Plugin 'ciaranm/securemodelines'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'godlygeek/tabular'
  "Plugin 'jelera/vim-javascript-syntax' " Possibly no longer needed.
  Plugin 'joonty/vdebug.git'
  Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plugin 'junegunn/fzf.vim'
  Plugin 'lifepillar/vim-solarized8'
  Plugin 'pangloss/vim-javascript'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'scrooloose/nerdtree'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-eunuch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-git'
  Plugin 'tpope/vim-ragtag'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  " Snipmate and dependencies.
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'

  call vundle#end()
  filetype plugin indent on
endif
