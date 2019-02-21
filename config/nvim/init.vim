" Load plugins.
if filereadable(expand("$HOME/.config/nvim/plugs.vim"))
  source $HOME/.config/nvim/plugs.vim
endif

" Load the core Vim config, to get our baseline settings.
if filereadable(expand("$HOME/.config/nvim/core.vim"))
  source $HOME/.config/nvim/core.vim
endif

set termguicolors
colorscheme monokai_pro

" Open/close NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Easy access to FZF.
nmap <leader>t :Files<cr>
nmap <leader>r :Buffers<cr>

" Quick Git status.
nmap <silent> <leader>gs :Gstatus<cr>

" This maps Leader + e to exit terminal mode.
" http://ryanselk.com/2015/05/19/terminals-in-neovim/
tnoremap <Leader>e <C-\><C-n>

""""""""""""""""""
" Plugin options "
""""""""""""""""""

" Enable Airline.
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp\|temp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Use CSS when exporting HTML
let html_use_css = 1

let g:snips_author = 'Mikkel Hoegh' " SnipMate full name.

" Hide files we don't want to see in NERD tree.
let NERDTreeIgnore=['\.py[co]$', '\.sass-cache', '\~$']

" Quit NERDTree as soon as you open a file.
let g:NERDTreeQuitOnOpen=1

" Neomake settings
let g:neomake_php_phpcs_args_standard='Drupal'

" Ctrl-P settings.
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$'
\ }

" Only do this part when compiled with support for autocommands
if !isdirectory("~/.vim/bundle/vundle/")
  " Applies to multiple filetypes "
  autocmd FileType html,php,xml,xsl,dtd,xhtml source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
endif

autocmd FileType javascript,json,php autocmd! BufWritePost * Neomake

" Security fix: modelines have been an avenue for trojan attacks against
" VIM-users, so we'll disable that.
set nomodeline

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
