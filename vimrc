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

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set foldmethod=manual      " Manual Fold

set ignorecase " Ignore cases while searching.

set hlsearch " Set hightlight while searching.

if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

set langmenu=zh_CN.UTF-8

set helplang=cn

"Map keys
nnoremap <F1> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F2> :set number! number?<cr>
nmap <F3> :Tlist<CR>
nnoremap <F4> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>

