" Vim color file
" Name: tivoli
" Maintainer: Mikkel Hoegh <mikkel@hoegh.org>
" Version: 0.1
" Last Time Modified: 13.03.2007

" This theme is based on kib_plastic by <kib2@free.fr>
" The original theme can be downloaded from this address:
" http://kib2.free.fr/documents/Vim/

" This is a very colourful theme with a lot of contrast. Personally, I
" never understood why there are so many colour themes for vim with
" bland colours. 
" My idea of syntax highlighting is to create as much
" contrast as possible between the important elements and downplaying
" less important elements for maximum
" productivity. This theme should reflect that.

" Main colours used:
" Bright red-orange: #ff6600
" Bright yellow-green: #99ff00
" Bright turqoise: #0099ff
" "Gentoo" lilac: #6600ff
" Agressive pink: #cc0033
"

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="tivoli"

" Help : type ':highlight' and read...

" ======================================================
" ==================================== normal Mode:
" ======================================================

" ==== Some constants : 

" Normal : foreground and background
hi Normal	guibg=#222222 guifg=#eeeeee

" ==== Titles : 
hi Title	guifg=#4e9a06


" ==== Comments : any comment
hi Comments	guifg=#6600ff " any comment

" ===== Constants :
hi Constants guifg=#6782d3 " any constant   
hi String guifg=#729fcf  " a string constant: "this is a string"
hi Character guifg=#6600ff  " a character constant: 'c', '\n'
hi Number guifg=#cc0033  " a number constant: 234, 0xff
hi Boolean guifg=#cc0033  " a boolean constant: TRUE, false
hi Float guifg=#0099ff  " a floating point constant: 2.3e10

" ===== Identifier : any variable name
hi Identifier	guifg=#ff8000   " function name (also: methods for classes)

" ===== Statements : Les mots cles de chaque language
hi Statement	guifg=#9700cc " par défaut
hi Conditional guifg=#4e9a06 " if, then, else, endif, switch, etc.
hi Repeat guifg=#73d216 " boucles for, do, while, etc.
hi Label guifg=#8ae234 " case, default, etc.
hi Operator guifg=#99ff00  " "sizeof", "+", "*", etc.
hi Keyword guifg=#99ff00  " any other keyword
hi Exception guifg=#ce5c00  " try, catch, throw

" ==== PreProc : generic Preprocessor
hi PreProc	guifg=#8f5502 " generic Preprocessor
hi Include guifg=#8f5502  " preprocessor #include
hi Define guifg=#8f5502  " preprocessor #define
hi Macro guifg=#8f5502  " same as Define
hi PreCondit guifg=#8f5502  " preprocessor #if, #else, #endif, etc.

" ==== Types : int, long, char, etc.
hi Type		guifg=#ff6600   " int, long, char, etc.
hi StorageClass guifg=#99ff00  " static, register, volatile, etc.
hi Structure guifg=#0099ff " struct, union, enum, etc.
hi Typedef guifg=#6600ff  " A typedef
 
" ==== Special : any special symbol
hi Special	guifg=#4e9a06 " any special symbol
hi SpecialChar guifg=#4e9a06   " special character in a constant
hi Tag guifg=#4e9a06   " you can use CTRL-] on this
hi Delimiter guifg=#4e9a06   " character that needs attention
hi SpecialComment guifg=#6600ff   " special things inside a comment
hi Debug guifg=#4e9a06   " debugging statements

" ==== Underlined : text that stands out, liens HTML
hi Underlined	guifg=#20b0eF gui=none

" ==== Ignore :
hi Ignore guifg=#f57900  " left blank, hidden

" ==== Error : any erroneous construct
hi Error guifg=#990000  "

" ==== Todo :
hi Todo		guibg=#ffff00 guifg=#000000 " keywords TODO FIXME and XXX

" ======================================================
" ==================================== End Normal mode
" ======================================================

" ======================================================
" ==================================== Start Python Mode:
" ==== Dmitry Vasiliev as written a very good Python.vim
" ==== syntax file, wich brings more features. See:
" ==== http://www.hlabs.spb.ru/vim/python.vim
" ======================================================

" pythonSync: 

" pythonStatement:
hi pythonStatement guifg=#4e9a06 " Python Statement : break, continue, del

" pythonImport:
hi pythonImport guifg=#9700cc " Python Imports : break, continue, del

" pythonRepeat:
hi pythonRepeat guifg=#4e9a06 " Python Repeat : for, while, etc.

" pythonConditional:
hi pythonConditional guifg=#d28202 " Python conditonnal : if, elif, else, then

" pythonPrecondit:
hi pythonPrecondit guifg=#ef2929 " python Precondit : import from

" pythonOperator: 
hi pythonOperator guifg=#ef2929 " pythonOperator : and, in, is, not, or

" pythonComment:
hi pythonComment guifg=#6600ff " Python comments

" pythonEscape:


" pythonRawString:
hi pythonRawString guifg=#ad7fa8 " Python raw strings

" pythonBuiltin: True False bool enumerate set frozenset help


" pythonException:

" ===== Linked 
" pythonFunction: links to Function

" pythonTodo: links to Todo

" pythonDecorator: links to Define 

" pythonString: links to String

" pythonNumber: links to Number

" pythonSpaceError: links to Error

" ======================================================
" ==================================== End Python Mode:
" ======================================================
hi Cursor guibg=#ff6a6a guifg=#ffffff
"hi CursorIM
hi Directory	guifg=#bbd0df
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#888a85 guifg=#2e3436 gui=none
hi Folded	    guibg=#333333 guifg=#eeeeee             " How the text appears once folded
hi FoldColumn	guibg=#babdb6 guifg=#555753 
hi LineNr	    guibg=#111111 guifg=#555555             " Line numbers
hi MatchParen	guibg=#babdb6 guifg=#2e3436
hi ModeMsg	    guifg=#f57900
hi MoreMsg	    guifg=#f57900
hi NonText	    guibg=#eeeeee guifg=#555753
hi Question	    guifg=#aabbcc
hi Search	    guibg=#fce94f guifg=#c4a000
hi IncSearch	guibg=#c4a000 guifg=#fce94f
hi SpecialKey	guifg=#ce5c00
hi StatusLine	guibg=#888a85 guifg=#2e3436 gui=none
hi StatusLineNC	guibg=#888a85 guifg=#fce94f gui=none
hi Visual	    guibg=#006699 guifg=#ffffff             " Selection of text in Visual Mode
"hi VisualNOS
hi WarningMsg	guifg=salmon
hi WildMenu
hi Menu        guibg=#ff6a6a guifg=#000000
"hi Scrollbar   guibg=grey30 guifg=tan
"hi Tooltip
hi Pmenu	    guibg=#babdb6 guifg=#555753
hi PmenuSel	    guibg=#eeeeee guifg=#2e3436
hi CursorLine	guibg=#212628


"  {{{ terminal
" TODO
" }}}

"vim: sw=4
