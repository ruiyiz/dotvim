" #########################################################################
" Author:       Ruiyi Zhang (me at ruiyizhang dot com)
" Description:  Vim Settings for Vim 7
" #########################################################################

" ~~~~
" Generic settings
" ~~~~

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Turn on verbose mode for diagnosing config/plugin loading issue
" Only turn it on for debugging purpose
"set verbose

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required! Let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'

" General
Bundle 'Shougo/unite.vim'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_dotfiles=0
nmap    <leader>p   :CtrlPBuffer<cr>

Bundle 'Lokaltog/vim-easymotion'

" Programming
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'

" Python
Bundle 'klen/python-mode'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Better Search
set incsearch                       " do incremental searching
set hlsearch                        " highlight search term
set ignorecase                      " Case insensitive when searching and replacing

" Disable Generation of Backup Files
set nobackup
set noswapfile

" Customize behavior of splitting windows
set splitbelow
set splitright

" Tab and Indention Handling
set smarttab
set tabstop=4                       " Set tab width
set expandtab                       " Use spaces when <Tab> hit
set autoindent                      " 
set shiftwidth=4                    " Set shift width

" Misc settings
set ffs=unix,dos                    " Force Vim to always use unix line ending on all platforms
set nocuc                           " 
set noea                            " allow unequal size windows when splitting window
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set history=50                      " keep 50 lines of command line history
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set foldmethod=marker               " Set folding method to use explicit marker
set undolevels=5000                 " Set how many undos can be done
set scrolloff=6                     " 
set laststatus=2                    " Always display status line
set number ruler                    " Display line number
set showmatch                       " Show matching braces
set vb t_vb=                        " Flashes the screen when a command doesn't work
set clipboard=unnamed               " Set unnamed register to the OS clipboard
set hidden                          " Allow modified buffer to be put into background

" Color scheme in terminal mode
"set background=dark
colorscheme zenburn

" Syntax highlighting
syntax on                           " Enable syntax highlighting
syntax sync fromstart
filetype plugin indent on

" Automatically find scripts in the autoload directory
au FuncUndefined Syn* exec 'runtime autoload/' . expand('<afile>') . '.vim'

" Filetype settings
if has('autocmd')
    " Enable file type detection.  Use the default filetype settings, so that
    " mail gets 'tw' set to 72, 'cindent' is on in C files, etc.  Also load
    " indent files, to automatically do language-dependent indenting.
    filetype plugin indent on           " 

    " Remove ALL autocommands for the current group
    augroup vimrcEx au!

    " For all text files set 'textwidth' to 78 characters
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.  Don't
    " do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END
else
    set autoindent
endif


" ~~~~
" Key Mappings
" ~~~~

" Change <leader> to ',' (comma)
let mapleader = ","

map     Q gq
map     <silent> <F9> :tabnew<CR>
map     <SPACE> <C-F>
map     <BS> <C-B>

" Remap <esc> to <leader>jj
inoremap <leader>zz <ESC>

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <F3>' paste#paste_cmd['i']
exe 'vnoremap <script> <F3>' paste#paste_cmd['v']

" Replace :q command with buffer closing behavior
" CHANGELOG: moved to gvimrc
"cnoreabbrev wq w<bar>bd
"cnoreabbrev q bd

" CTRL-Tab is Next window
"noremap  <silent> <C-Tab> <C-W>w
"inoremap <silent> <C-Tab> <C-O><C-W>w
"cnoremap <silent> <C-Tab> <C-C><C-W>w
"onoremap <silent> <C-Tab> <C-C><C-W>w
"nnoremap <silent> <C-S-Tab> <C-W>W
"inoremap <silent> <C-S-Tab> <C-O><C-W>W

" CTRL-F4 is Close window
"noremap  <silent> <C-F4> <C-W>c
"inoremap <silent> <C-F4> <C-O><C-W>c
"cnoremap <silent> <C-F4> <C-C><C-W>c
"onoremap <silent> <C-F4> <C-C><C-W>c

"map <C-T> :tabnew<CR>
"
"" ALT-LEFTARROW is Previous tab
"map <silent> <M-Left> :tabprev<CR>
"
"" ALT-RIGHTARROW is Next tab
"map <silent> <M-Right> :tabnext<CR>


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


" ~~~~
" Custom functions
" ~~~~

" Mapping to Make Movements Operate on 1 Screen Line in Wrap Mode
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


" ~~~~
" Abbreviations
" ~~~~

" Date/Time abbreviations
iab  mdyl  <c-r>=strftime("%a, %d %b %Y")<cr>
iab  mdys  <c-r>=strftime("%y%m%d")<cr>
iab  mdyc  <c-r>=strftime("%c")<cr>
iab  hml   <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


" ~~~~
" Filetype specific configurations
" ~~~~

" C & Cpp
au FileType c,cpp               setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 expandtab

" C#
au FileType cs                  setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab 

" Java
au FileType java                setlocal shiftwidth=4 tabstop=4 expandtab

" Python
au FileType python              setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

" Ruby
au FileType ruby                setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" SQL
au FileType sql                 setlocal shiftwidth=4 tabstop=4 expandtab softtabstop=4

" Markup Languages
au FileType html,xhtml          setlocal indentexpr=
au BufNewFile,BufRead *.config  setlocal filetype=xml
au BufNewFile,BufRead *.xaml    setlocal filetype=xml

" Misc
au FileType diff                setlocal shiftwidth=4 tabstop=4
au FileType changelog           setlocal textwidth=76
au FileType cvs                 setlocal textwidth=72
au FileType mail                setlocal expandtab softtabstop=2 textwidth=70

" Quickly Exiting Help Files
au BufRead *.txt      if &buftype=='help'|nmap <buffer> q <C-W>c|endif


" ~~~~
" Status line configuration (from tomasr)
" ~~~~
set ls=2 " Always show status line
if has('statusline')
   " Status line detail:
   " %f		file path
   " %y		file type between braces (if defined)
   " %([%R%M]%)	read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "			shows a '!' if the file format is not the platform
   "			default
   " %{'$'[!&list]}	shows a '*' if in list mode
   " %{'~'[&pm=='']}	shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "			only for debug : display the current syntax item name
   " %=		right-align following items
   " #%n		buffer number
   " %l/%L,%c%V	line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
	   set titlestring=%t%(\ [%R%M]%)
   endif
endif

