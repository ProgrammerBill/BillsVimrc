" ____  _ _ _  ____                  _      __     ___
"| __ )(_) | |/ ___|___  _ __   __ _( )___  \ \   / (_)_ __ ___
"|  _ \| | | | |   / _ \| '_ \ / _` |// __|  \ \ / /| | '_ ` _ \
"| |_) | | | | |__| (_) | | | | (_| | \__ \   \ V / | | | | | | |
"|____/|_|_|_|\____\___/|_| |_|\__, | |___/    \_/  |_|_| |_| |_|
"                              |___/
"

set nu " Show line numbers.

set shortmess=atI " Do not show Messages before startup.

set nocompatible " Use Vim's configuration not Vi.

autocmd InsertEnter * se cul    " Set underline when in insert mode.

syntax on                  " Enable syntax highlighting.

" Indent Configuration
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set foldmethod=manual      " Manual Fold

" Searching Configuration
set ignorecase " Ignore cases while searching.
set hlsearch " Set hightlight while searching.

" Languages Configuration
set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8

"Map keys
nnoremap <F1> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " Eliminate spaces after lines.
nnoremap <F2> :set number! number?<cr>                            " Switch showing number line.
nnoremap <F3> :Tlist<CR>                                          " Add Tlist switch.
nnoremap <F4> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>          " Switch Mouse mode.

"Tlist Configuration
let Tlist_Auto_Open = 1                 " Auto open Tlist.
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  " Set Ctag path.
let Tlist_Sort_Type = "name"            " Sorted by name
let Tlist_Use_Right_Window = 1          " Showing Tlist in Right Side.
let Tlist_Inc_Winwidth = 0              " Do not increse Tlist Window width.
let Tlist_Enable_Fold_Column = 0        " Do not show fold tree.
let Tlist_Exit_OnlyWindow = 1           " Quit Tlist if window exits.

" Tlist Keys Mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
