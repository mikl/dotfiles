"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikkel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by http://vi-improved.org/vimrc.html
" Please feel free to copy this if you'd like to.

" Disabling vi-compatibilty is the first thing to do.
set nocompatible

" Configure Vundle.
if !isdirectory("~/.vim/bundle/Vundle.vim/")
  filetype off " Vundle turns it on again.
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle
  Plugin 'VundleVim/Vundle.vim'

  " From Github.
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'benekastah/neomake'
  Plugin 'bling/vim-airline'
  Plugin 'cespare/vim-toml'
  Plugin 'chriskempson/base16-vim'
  Plugin 'evidens/vim-twig'
  Plugin 'exu/pgsql.vim'
  Plugin 'groenewege/vim-less'
  Plugin 'jlanzarotta/bufexplorer'
  Plugin 'joonty/vdebug.git'
  Plugin 'junegunn/fzf.vim'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'nono/vim-handlebars'
  Plugin 'rking/ag.vim'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-eunuch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-git'
  Plugin 'tpope/vim-ragtag'
  Plugin 'tpope/vim-surround'

  " Snipmate and dependencies.
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'

  " From other sources.
  Plugin 'Better-Javascript-Indentation'
  Plugin 'DetectIndent'
  Plugin 'Enhanced-Javascript-syntax'
  Plugin 'HTML-AutoCloseTag'
  Plugin 'Markdown'
  Plugin 'Markdown-syntax'
  Plugin 'PHP-correct-Indenting'
  Plugin 'SyntaxRange'
  Plugin 'The-NERD-tree'
  Plugin 'closetag.vim'
  Plugin 'ctrlp.vim'
  Plugin 'editorconfig-vim'
  Plugin 'securemodelines'
  "Plugin 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}

  call vundle#end()
  filetype plugin indent on
endif

""""""""""""""""""""
" General settings "
""""""""""""""""""""
set history=1000 " How many commands to remember
set undolevels=150 " 1000 undolevels is more than I'll ever need.
set noconfirm " Gives you a confirm-dialog instead of a flat refusal
set ffs=unix,dos,mac " support all three file-format with unix no. 1
set viminfo+=!,h " give me viminfo, please
set iskeyword+=_,$,@,%,#,- " these shouldn't divide words.
set magic " Should always be on
set encoding=utf-8 " Force UTF-8 as default
set termencoding=utf-8 " Also for terminals.

""""""""""""""""""""
" Theme and colors "
""""""""""""""""""""
set background=light " color of terminal background
let g:solarized_hitrail=1 " Highlight trailing spaces.
let g:solarized_italic=0 " Italics are less legible.
"set t_Co=256 " I always use 256 colour terminals.
syntax enable
colorscheme solarized

""""""""""""""""""""""""
" Backup configuration "
""""""""""""""""""""""""
set backup " enable backup files
set backupdir=$HOME/.vim/backup " where to put backup files
set directory=$HOME/.vim/temp " directory for temp files

""""""""""""""""""""""""""""""""
" User interface configuration "
""""""""""""""""""""""""""""""""
set linespace=0 " number of pixels between lines
set wildmenu " better autocompletion for commands
set ruler
set cmdheight=2 " command-bar is 2 rows high
set number " turn on line numbers
set lazyredraw " don't redraw when running macros (speed-boost)
set hidden " don't close buffers when switching
set backspace=2 " don't stop me from using backspace. ever.
set whichwrap+=<,>,h,l
set mouse=a " I like using my mouse
set report=0 " Tell me how many lines commands change. Always.
set noerrorbells " I hate console beeps.
set visualbell
set showcmd
set noshowmatch " Don't jump cursor to matching brace.

"""""""""""""""
" Visual cues "
"""""""""""""""
set showmatch
set ignorecase
set smartcase
set wildmode=longest,list
set wildignore+=*.pyc,*.DS_Store,*.db
set nohlsearch
set incsearch
" what to show when I hit :set list
set listchars=eol:¬,tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:⁝
set scrolloff=5 " always show me the next/previous 5 lines
set laststatus=2
set cursorline
set showmode

""""""""""""""""""""""""""""""
" Text formatting and layout "
""""""""""""""""""""""""""""""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab " I prefer spaces to tabs.
set smarttab
set textwidth=72

"""""""""""
" Folding "
"""""""""""
set foldenable
set foldmethod=indent " My files are always neatly indented
set foldlevel=100 " Don't autofold

"""""""""""""""""""
" Misc. functions "
"""""""""""""""""""

" Helper function to preserve search history and cursor position while
" executing some command.
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

""""""""""""
" Mappings "
""""""""""""
set pastetoggle=<f2>
let mapleader = ","

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Quick reload of vimrc
nmap <leader>R :source $MYVIMRC<CR>

" Quick editing of vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Strip trailing spaces
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Make VIM reformat the entire file
nmap <leader>= :call Preserve("normal gg=G")<CR>

" Open/close NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" sudo save this file
nmap <leader>S :SudoWrite<CR>

" Easy split navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make Y behave like other capitals.
nnoremap  Y y$

" Easy access to CtrlP.
nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>

" Quick Git status.
nmap <silent> <leader>gs :Gstatus<cr>

"""""""""""""""""""""""""""""""
" File explorer configuration "
"""""""""""""""""""""""""""""""
let g:explDetailedList=0
let g:explWinSize=5
let g:explHideFiles='^\.,\.pyc$'

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
