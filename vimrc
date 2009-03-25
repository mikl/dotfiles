"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikkel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by http://vi-improved.org/vimrc.php
" Please feel free to copy this if you'd like to.


""""""""""""""""""""
" General settings "
""""""""""""""""""""
set nocompatible " no, I'd rather not have my editor vi-compatible
filetype on " detect the type of the file
set history=100 " How many commands to remember
set confirm " Gives you a confirm-dialog instead of a flat refusal
set ffs=unix,dos,mac " support all three file-format with unix no. 1
filetype plugin on " load filetype plugins
filetype indent on
set viminfo+=!,h " give me viminfo, please
set iskeyword+=_,$,@,%,#,- " these shouldn't divide words.
set magic " Should always be on
set enc=utf-8
set tenc=utf-8

""""""""""""""""""""
" Theme and colors "
""""""""""""""""""""
set background=dark " color of terminal background
if &t_Co > 2 || has("gui_running")
  syntax on
endif
colorscheme desert

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

"""""""""
" CTags "
"""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Ctags_Cmd="/usr/bin/ctags"


"""""""""""""""""""""""""""""""
" File explorer configuration "
"""""""""""""""""""""""""""""""
let g:explDetailedList=0
let g:explWinSize=5
let g:explHideFiles='^\.,\.pyc$'
function MyFileHandler(fn)
  exec "silent! !gvim -rv " . escape(a:fn,' \%#(){}&[];`"' . "'")
endfunction
let g:explFileHandler = 'MyFileHandler'

"""""""""""""""""""""""""""""
" Grep plugin configuration "
"""""""""""""""""""""""""""""
let Grep_Key = '<F10>'
let Grep_Default_Options = '-i'
let Grep_Default_Filelist = '*.py *.pt *.dtml'
let Grep_Find_Path = '/usr/bin/find'
let Grep_Xargs_Path = '/usr/bin/xargs'

"""""""""""""""""""""""""""""""""
" Applies to multiple filetypes "
"""""""""""""""""""""""""""""""""
au FileType html,php,xml,xsl,dtd,xhtml source ~/.vim/scripts/closetag.vim 

" Security fix: modelines have been an avenue for trojan attacks against
" VIM-users, so we'll disable that.
set nomodeline

