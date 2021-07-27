" Load the core Vim config, to get our baseline settings.
if filereadable(expand("$HOME/.config/nvim/core.vim"))
  source $HOME/.config/nvim/core.vim
endif

set termguicolors
colorscheme desert

" This maps Leader + e to exit terminal mode.
" http://ryanselk.com/2015/05/19/terminals-in-neovim/
tnoremap <Leader>e <C-\><C-n>

""""""""""""""""""
" Plugin options "
""""""""""""""""""

" Use CSS when exporting HTML
let html_use_css = 1

let g:snips_author = 'Mikkel Hoegh' " SnipMate full name.

""""""""""""""
" fzf config "
""""""""""""""

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
