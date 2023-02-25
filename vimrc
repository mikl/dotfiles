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

""""""""""""
" Mappings "
""""""""""""

" Easy split navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""
" Theme and colors "
""""""""""""""""""""
set background=light
syntax enable
colorscheme desert
