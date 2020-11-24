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
