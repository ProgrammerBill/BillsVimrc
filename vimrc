" ____  _ _ _  ____                  _      __     ___
"| __ )(_) | |/ ___|___  _ __   __ _( )___  \ \   / (_)_ __ ___
"|  _ \| | | | |   / _ \| '_ \ / _` |// __|  \ \ / /| | '_ ` _ \
"| |_) | | | | |__| (_) | | | | (_| | \__ \   \ V / | | | | | | |
"|____/|_|_|_|\____\___/|_| |_|\__, | |___/    \_/  |_|_| |_| |_|
"                              |___/
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/tagbar'
Plugin 'mzlogin/vim-markdown-toc'
call vundle#end()            " required


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

" Encoding Configuration
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set showcmd " show input command.
set clipboard=unnamedplus   " Allow copy to clipboard by y

" No Swap files
set nowritebackup
set noswapfile
set laststatus=2 " Always show file name in status bar

" File Configuration

filetype plugin on " Turn on filetype plugin.
filetype indent on " Trun on filetype indent.
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown     " .md is Markdown file
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.md, exec ":call SetTitle()"

highlight ColorColumn ctermbg=yellow

" Map keys
nnoremap <F1> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " Eliminate spaces after lines.
nnoremap <F2> :set number! number?<cr>                            " Switch showing number line.
nnoremap <F3> :Tlist<CR>                                          " Add Tlist switch.
autocmd filetype markdown nnoremap <F3> :TagbarToggle<CR>         " Add Tagbar for MarkDown
nnoremap <F4> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>          " Switch Mouse mode.
nnoremap <F5> :call CompileRunGcc()<CR>
nnoremap <F6> :call GetRidOfM() <CR>
nnoremap <F7> :let &colorcolumn=(empty(&colorcolumn) ? '81' : '')<CR>

map <C-A> ggVGY  " ctrl+a alias select all and copy.
vmap <C-c> "+y   " ctrl+c copy when in selection mode.


" Vim Plugins

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

" Cscope Keys Mapping
nnoremap <buffer> <leader>cs :cscope find s <c-r>=expand('<cword>')<cr><cr> " find symbols references
nnoremap <buffer> <leader>cg :cscope find g <c-r>=expand('<cword>')<cr><cr> " find definitions
nnoremap <buffer> <leader>cc :cscope find c <c-r>=expand('<cword>')<cr><cr> " find who calls this function
nnoremap <buffer> <leader>ct :cscope find t <c-r>=expand('<cword>')<cr><cr> " find this text positions
nnoremap <buffer> <leader>ce :cscope find e <c-r>=expand('<cword>')<cr><cr> " use egrep to find text
nnoremap <buffer> <leader>cf :cscope find f <c-r>=expand('<cword>')<cr><cr> " find this file
nnoremap <buffer> <leader>ci :cscope find i <c-r>=expand('<cword>')<cr><cr> " search file that includes this file
nnoremap <buffer> <leader>cd :cscope find d <c-r>=expand('<cword>')<cr><cr> " search funcs that this func calls

" cscope add cscope.out automatically
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    set nocscopeverbose
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
       let cscope_file=findfile("cscope.out", ".;")
       let cscope_pre=matchstr(cscope_file, ".*/")
       if !empty(cscope_file) && filereadable(cscope_file)
           exe "cs add" cscope_file cscope_pre
       endif
     endif
endif

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
 \ 'ctagstype': 'markdown',
 \ 'ctagsbin' : '~/.vim/plugin/markdown2ctags-0.3.3/markdown2ctags.py',
 \ 'ctagsargs' : '-f - --sort=yes --sro=»',
 \ 'kinds' : [
 \ 's:sections',
 \ 'i:images'
 \ ],
 \ 'sro' : '»',
 \ 'kind2scope' : {
 \ 's' : 'section',
 \ },
 \ 'sort': 0,
 \ }


autocmd BufReadPost * if exists("b:current_syntax") && b:current_syntax == "logcat"
autocmd BufReadPost *     syn keyword myTags BatteryService StatsUtilsManager
autocmd BufReadPost *     syn keyword myKeywords success
autocmd BufReadPost * endif

" Function Lists
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

func SetTitle()
    let authorName = 'BillCong'               " AuthorName used by created files
    let mailAddress = 'cjcbill@gmail.com' " MailAddress used by created files
    if &filetype == 'sh'
        call setline(1,          "\#########################################################################")
        call append(line("."),   "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ".authorName)
        call append(line(".")+2, "\# mail: ".mailAddress)
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    elseif &filetype == 'markdown'
        call setline(1,          "---")
        call append(line("."),   "title: ".expand("%"))
        call append(line(".")+1, "subtitle: ")
        call append(line(".")+2, "author: ".authorName)
        call append(line(".")+3, "mail: ".mailAddress)
        call append(line(".")+4, "changelog:")
        call append(line(".")+5, "- ver: 1.0")
        call append(line(".")+6, "  date: ".strftime("%Y.%m.%d"))
        call append(line(".")+7, "  author:")
        call append(line(".")+8, "  desc: ")
        call append(line(".")+9, "")
        call append(line(".")+10, "---")
        call append(line(".")+11, "")
    else
        call setline(1,          "/*************************************************************************")
        call append(line("."),   "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: ".authorName)
        call append(line(".")+2, "    > Mail: ".mailAddress)
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    autocmd BufNewFile * normal G
endfunc

func GetRidOfM()
    exec ":e ++ff=dos "
    exec ":set ff=unix"
    exec "w"
endfunc
