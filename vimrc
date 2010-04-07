"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikkel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by http://vi-improved.org/vimrc.php
" Please feel free to copy this if you'd like to.

" Start with loading our bundles via pathogen.
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

" Because the system might have switched filetype detection on before
" our bundles were loaded, we switch it off and switch it on again.
filetype off
filetype plugin indent on

""""""""""""""""""""
" General settings "
""""""""""""""""""""
set nocompatible " no, I'd rather not have my editor vi-compatible
set history=100 " How many commands to remember
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
if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme august
endif

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
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set scrolloff=5 " always show me the next/previous 5 lines
set laststatus=2
set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)
set cursorline

set showmode

""""""""""""""""""""""""""""""
" Text formatting and layout "
""""""""""""""""""""""""""""""
set formatoptions=tcroqn
set autoindent
set smartindent
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " I prefer spaces to tabs.
set smarttab
set textwidth=72

"""""""""""
" Folding "
"""""""""""
set foldenable 
set foldmethod=indent " My files are always neatly indented
set foldlevel=100 " Don't autofold

""""""""""""
" Mappings "
""""""""""""
set pastetoggle=<f2>

"""""""""""""""""""""""""""""""
" File explorer configuration "
"""""""""""""""""""""""""""""""
let g:explDetailedList=0
let g:explWinSize=5
let g:explHideFiles='^\.,\.pyc$'

""""""""""""""""""
" Plugin options "
""""""""""""""""""
let g:snips_author = 'Mikkel Hoegh' " SnipMate full name.

"""""""""""""""""""""""""""""""""
" Applies to multiple filetypes "
"""""""""""""""""""""""""""""""""
au FileType html,php,xml,xsl,dtd,xhtml source ~/.vim/scripts/closetag.vim 

"""""""""""""""""""
" Misc. functions "
"""""""""""""""""""
function! s:rstrip ()
  exec '%s/\v\s+$//'
endfunction

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" Security fix: modelines have been an avenue for trojan attacks against
" VIM-users, so we'll disable that.
set nomodeline

