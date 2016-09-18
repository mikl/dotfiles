"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikkel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by http://vi-improved.org/vimrc.html
" Please feel free to copy this if you'd like to.

" Disabling vi-compatibilty is the first thing to do.
set nocompatible

" Load the core Vim config, to get our baseline settings.
if filereadable(expand("$HOME/.config/nvim/core.vim"))
  source $HOME/.config/nvim/core.vim
endif

""""""""""""""""""""
" Theme and colors "
""""""""""""""""""""
set background=light
syntax enable
colorscheme desert
