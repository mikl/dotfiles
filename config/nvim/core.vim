" Core settings for Vim itself.

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
set relativenumber " turn on relative line numbers
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

" sudo save this file
nmap <leader>S :SudoWrite<CR>

" Easy split navigation.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make Y behave like other capitals.
nnoremap  Y y$

"""""""""""""""""""""""""""""""
" File explorer configuration "
"""""""""""""""""""""""""""""""
let g:explDetailedList=0
let g:explWinSize=5
let g:explHideFiles='^\.,\.pyc$'
