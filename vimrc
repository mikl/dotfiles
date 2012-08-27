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
      \ 'DetectIndent',
      \ 'JavaScript_Indent',
      \ 'Markdown',
      \ 'PHP-correct-Indenting',
      \ 'Powerline',
      \ 'Solarized',
      \ 'The_NERD_Commenter',
      \ 'The_NERD_tree',
      \ 'ack',
      \ 'closetag',
      \ 'ctrlp',
      \ 'fugitive',
      \ 'git.zip',
      \ 'github:tangledhelix/vim-octopress',
      \ 'github:tpope/vim-eunuch',
      \ 'git:http://git.drupal.org/project/vimrc.git',
      \ 'jade',
      \ 'ragtag',
      \ 'snipmate-snippets',
      \ 'surround',
      \ 'unimpaired',
      \ 'vim-json-bundle',
      \ 'vim-twig'
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
set listchars=eol:¬,tab:▸\ ,trail:.,extends:>,precedes:<,nbsp:⁝
set scrolloff=5 " always show me the next/previous 5 lines
set laststatus=2
set cursorline
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
nmap <leader>S :w !sudo tee %<CR>

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

""""""""""""""""""
" Plugin options "
""""""""""""""""""

" Use CSS when exporting HTML
let html_use_css = 1

let g:snips_author = 'Mikkel Hoegh' " SnipMate full name.

" Syntastic settings.
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1 " Enable markers on the line containing a problem.
let g:syntastic_auto_jump=0 " Dont jump to the first line with a problem
let g:syntastic_phpcs_conf='--standard=Drupal --extensions=php,module,inc,install,test,profile,theme' " Test php,module,inc,install ... files with the Drupal CodingStandard

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Applies to multiple filetypes "
  autocmd FileType html,php,xml,xsl,dtd,xhtml source ~/.vim/managed-addons/closetag/plugin/closetag.vim

  " Automatically leave insert mode after 'updatetime' milliseconds of inaction
  autocmd CursorHoldI * stopinsert
endif

" Security fix: modelines have been an avenue for trojan attacks against
" VIM-users, so we'll disable that.
set nomodeline

