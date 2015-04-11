" Copy to ~/.gvimrc or ~/_gvimrc.

" GUI specific settings
if has("gui_running")
    colorscheme solarized           " Set default color schema

    " Solarized Colorscheme Config
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    set background=dark

    set encoding=utf-8              " Use UTF-8 everywhere.

    if has("win32") || has("win64")

        " Font configuration
        set guifont=Consolas:h10.5:b

        " Disable tearoff menu entries
        let &guioptions = substitute(&guioptions, "t", "", "g")
        " Maximize window on startup 
        "au GUIEnter * simalt ~x

        "winpos 0 0                     " Set starting position of GUI window

    elseif has("mac")

        " Font configuration
        set guifont=Menlo:h14           " Set font family and font size
        set antialias                   " MacVim: smooth fonts

    elseif has("unix")

    endif

    " Toolbar and scrollbar settings
    set guioptions-=T               " Toggle off the toolbar
    set guioptions-=r               " Toggle off the right-hand scrollbar
    set guioptions-=l               " Toggle off the left-hand scrollbar
    set guioptions-=b               " Toggle off the bottom scrollbar
    "set guioptions-=m              " Toggle off the menubar
    let do_syntax_sel_menu = 1      " Always show file types in menu
    set lines=60 columns=140        " Window dimensions

endif

" Alt-Space is System menu
if has("gui") && (has("win32") || has("win64"))
    noremap  <silent> <M-Space> :simalt ~<CR>
    inoremap <silent> <M-Space> <C-O>:simalt ~<CR>
    cnoremap <silent> <M-Space> <C-C>:simalt ~<CR>
endif


" Replace :q command with buffer closing behavior
cnoreabbrev wq w<bar>bd
cnoreabbrev q bd

