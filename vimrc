set nocompatible
" expand tabs to spaces.  makes sense if we want people with other editors
" to see the file looking the same.
set expandtab
"Autoindentation
set autoindent
"use 2 spaces when using autoindent/cindent
set shiftwidth=2
"use the same value as shiftwidth
set softtabstop=2
"use 2 char positions for a TAB
set tabstop=2
"allow backspacing over identatiom, end-of-line, and start-of-line
set backspace=2
"show colored syntax highlighting
syntax on
"show current uncompleted command
set showcmd
"set cindent and tabstop for *.c, *.h, *.pl and *.sh files
:autocmd BufEnter *.c,*.cpp,*.h,*.pl,*.sh set cindent tabstop=4
"show matching parenthesis
set showmatch
"incremental searching
set incsearch
" smoother output, we're not on a 1200 dialup :)
set ttyfast
"The following line sets the smartindent mode for *.py files. It means that after typing lines 
"which start with any of the keywords in the list (ie. def, class, if, etc) the next line will
"automatically indent itself to the next level of indentation
":autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
:autocmd BufRead *.c,*.cpp set smartindent cinwords=if,else,for,while,class,switch,struct
:autocmd BufRead *.java set smartindent cinwords=if,else,for,while,class,switch,interface,abstract

"Tabs are needed in makefile
au BufNewFile,BufReadPost ?akefile se noexpandtab
au BufNewFile,BufReadPost configure.in se noexpandtab ts=8 shiftwidth=2
au BufLeave Makefile set expandtab
au BufLeave configure.in set expandtab
au BufNewFile,BufRead *.ahk setf ahk
" keep the horizontal cursor position when moving vertically
set nostartofline

set wildmenu
set ignorecase
set showmode
set ruler
set background=dark
filetype on
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"life saver - when pasting preserve the indentation
"set paste
" paste resets lot of useful things ..just enable mouse handling 
" for the same behaviour as paste
set mouse=""

" Select your colormap / brightness
"let xterm16_colormap = 'standard'

"close the folds when moving out
"set foldclose=all
"set foldmethod=indent

set iskeyword+=.

autocmd FileType python source $HOME/.vim/custom/python/vimrc

"Don't start spellchecking automatically.useful for large files
let spell_root_menu   = '-'
let spell_auto_type   = ''
let spell_insert_mode = 0

"256 colors
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm
set t_Co=16

set winheight=999
"set fileformats=unix
map M :%s/$//g
match Todo /\s\+$/
%retab

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.rb,*.rake,*.rhtml,*.erb,*.builder,*.js,*.html  :call <SID>StripTrailingWhitespaces()
