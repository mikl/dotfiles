"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikkel's vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by http://vi-improved.org/vimrc.php
" Please feel free to copy this if you'd like to.

" Disabling vi-compatibilty is the first thing to do.
set nocompatible

let vam_install_path = expand('$HOME') . '/.vim/managed-addons'
exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'
call vam#ActivateAddons([
      \ 'Command-T',
      \ 'Markdown',
      \ 'PHP-correct-Indenting',
      \ 'Solarized',
      \ 'Syntastic',
      \ 'The_NERD_Commenter',
      \ 'The_NERD_tree',
      \ 'ack', 
      \ 'closetag',
      \ 'comments1528',
      \ 'fugitive',
      \ 'git.zip',
      \ 'jade',
      \ 'php2548',
      \ 'ragtag',
      \ 'snipMate',
      \ 'snipmate-snippets',
      \ 'surround',
      \ 'unimpaired'
\], {'auto_install' : 1})

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
if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme solarized
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
set listchars=eol:¬,tab:▸\ ,trail:.,extends:>,precedes:<,nbsp:⁝
set scrolloff=5 " always show me the next/previous 5 lines
set laststatus=2
set cursorline

" Use Fugitive in the status line if available.
if exists('g:loaded_fugitive')
  set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %{fugitive#statusline()}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)
else
  set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)
endif

set showmode

""""""""""""""""""""""""""""""
" Text formatting and layout "
""""""""""""""""""""""""""""""
set autoindent
set smartindent
set cindent
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
cmap w!! %!sudo tee > /dev/null %
nmap <leader>S :w !sudo tee %<CR>

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

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Applies to multiple filetypes "
  autocmd FileType html,php,xml,xsl,dtd,xhtml source ~/.vim/scripts/closetag.vim

  " Automatically leave insert mode after 'updatetime' milliseconds of inaction
  autocmd CursorHoldI * stopinsert

  " Reload vimrc files everytime they're saved.
  " Disabled temporarily, since it seems to make my Vim lock up.
  " autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Security fix: modelines have been an avenue for trojan attacks against
" VIM-users, so we'll disable that.
set nomodeline

