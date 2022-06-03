" ____  _ _ _  ____                  _      __     ___
"| __ )(_) | |/ ___|___  _ __   __ _( )___  \ \   / (_)_ __ ___
"|  _ \| | | | |   / _ \| '_ \ / _` |// __|  \ \ / /| | '_ ` _ \
"| |_) | | | | |__| (_) | | | | (_| | \__ \   \ V / | | | | | | |
"|____/|_|_|_|\____\___/|_| |_|\__, | |___/    \_/  |_|_| |_| |_|
"                              |___/
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/tagbar'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'gburca/vim-logcat'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'liuchengxu/vim-clap'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'hsanson/vim-android'
call vundle#end()            " required


set nu " Show line numbers.

set shortmess=atI " Do not show Messages before startup.

set nocompatible " Use Vim's configuration not Vi.

autocmd InsertEnter * se cul    " Set underline when in insert mode.

syntax on                  " Enable syntax highlighting.

" Indent Configuration
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
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

" Set leader key
let mapleader=','

" Normal mode is square, and Insert mode is vertial line.
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set showcmd " show input command.

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed " Allow copy to clipboard by y for mac
else
  set clipboard=unnamedplus   " Allow copy to clipboard by y
endif

" No Swap files
set nowritebackup
set noswapfile
set nobackup
set laststatus=2 " Always show file name in status bar

set nofoldenable " no fold
set backspace=2  "compatible with version 5.4 and earlier

" File Configuration

filetype plugin on " Turn on filetype plugin.
filetype indent on " Trun on filetype indent.
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown     " .md is Markdown file
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.md,*.py exec ":call SetTitle()"
autocmd BufRead,BufNewFile *.cpp,*.[ch],*.sh,*.java,*.md, exec ":call SetParams()"
autocmd BufNewFile,BufFilePre,BufRead *.py set filetype=python     " .py is Markdown file
autocmd BufNewFile,BufFilePre,BufRead *.go set filetype=go     " .go is go file

highlight ColorColumn ctermbg=yellow
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


" Map keys
nnoremap <F1> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR> " Eliminate spaces after lines.
nnoremap <F2> :set number! number?<cr>                            " Switch showing number line.
nnoremap <F3> :Tlist<CR>                                          " Add Tlist switch.
autocmd filetype markdown nnoremap <F3> :TagbarToggle<CR>         " Add Tagbar for MarkDown
autocmd filetype go nnoremap <F3> :TagbarToggle<CR>         " Add Tagbar for MarkDown
nnoremap <F4> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>          " Switch Mouse mode.
nnoremap <F5> :call CompileRunGcc()<CR>
nnoremap <F6> :call GetRidOfM() <CR>
nnoremap <F7> :let &colorcolumn=(empty(&colorcolumn) ? '101' : '')<CR>
nnoremap <F8> :call SwitchTabSize() <CR>

map ]b :bnext<CR>
map [b :bprevious<CR>

map <C-A> ggVGY  " ctrl+a alias select all and copy.
vmap <C-c> "+y   " ctrl+c copy when in selection mode.
nnoremap <C-e> :edit $MYVIMRC<CR>

"nn <silent> <C-]> :LspDefinition<cr>
"nn <silent> <C-[> :LspReferences<cr>
"nn <silent> <M-=> :LspDocumentFormat<cr>
"nn <f2> :LspRename<cr>

" Jump to last opened Cursor position.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif

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

func SetParams()
    if &filetype == 'cpp'
        set softtabstop =2        " Tab key indents by 2 spaces.
        set shiftwidth  =2        " >> indents by 2 spaces.
    else
        set softtabstop =4       " Tab key indents by 4 spaces.
        set shiftwidth  =4       " >> indents by 4 spaces.
    endif
endfunc

func SwitchTabSize()
    if &softtabstop == 4 && &shiftwidth == 4
        set softtabstop =2        " Tab key indents by 2 spaces.
        set shiftwidth  =2        " >> indents by 2 spaces.
    else
        set softtabstop =4       " Tab key indents by 4 spaces.
        set shiftwidth  =4       " >> indents by 4 spaces.
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

    if &filetype == 'sh'
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
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
    if &filetype == 'python'
        call append(line(".")+5, "#! /usr/bin/env python")
        call append(line(".")+6, "# -*- coding: utf-8 -*-")
    endif
    autocmd BufNewFile * normal G
endfunc

func GetRidOfM()
    exec ":e ++ff=dos "
    exec ":set ff=unix"
    exec "w"
endfunc



" Vim Plugins

"Tlist Configuration
" ===================================== Tlist ================================
let Tlist_Auto_Open = 1                 " Auto open Tlist.

if system('uname -s') == "Darwin\n"
  let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'  " Set Ctag path.
else
  let Tlist_Ctags_Cmd = '/usr/bin/ctags'  " Set Ctag path.
endif

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

" ===================================== cscope ================================
" cscope add cscope.out automatically
if has("cscope")
    if system('uname -s') == "Darwin\n"
        set csprg=/usr/local/bin/cscope
    else
        set csprg=/usr/bin/cscope
    endif
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

"if executable('cquery')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'cquery',
"      \ 'cmd': {server_info->['cquery']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
"      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"      \ })
"endif


" ===================================== tagbar ================================
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
 \ 'ctagstype': 'markdown',
 \ 'ctagsbin' : '~/.vim/plugin/markdown2ctags/markdown2ctags.py',
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


" ===================================== fzf ================================
" fzf with ripgrep
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

autocmd BufReadPost * if exists("b:current_syntax") && b:current_syntax == "logcat"
autocmd BufReadPost *     syn keyword myTags BatteryService StatsUtilsManager
autocmd BufReadPost *     syn keyword myKeywords success
autocmd BufReadPost * endif

" ===================================== fzf.vim ================================
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
"let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


" vim-lsp
" ===================================== vim-lsp ================================

"if executable('pyls')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'allowlist': ['python'],
"        \ })
"endif
"
"if executable('clangd')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd']},
"        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
"        \ })
"endif
"
"
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gs <plug>(lsp-document-symbol-search)
"    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> gt <plug>(lsp-type-definition)
"    nmap <buffer> <leader>rn <plug>(lsp-rename)
"    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"    nmap <buffer> K <plug>(lsp-hover)
"    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"    let g:lsp_format_sync_timeout = 1000
"    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"
"    " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

" ===================================== airline ================================
" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme="tomorrow"
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#vimtex#left = ""
let g:airline#extensions#vimtex#right = ""
let g:airline#extensions#tabline#formatter = 'unique_tail'

"
set laststatus=2 " Show the statusline
set noshowmode " Hide the default mode text
"  airline symbols dictionary
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if has("gui_running")
  set guifont=MesloLGSDZForPowerline-Regular:h16
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ===================================== vim-clap ================================
let g:clap_theme = 'material_design_dark'


" ===================================== coc.nvim ================================
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gb :CocCommand clangd.switchSourceHeader<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ===================================== coc.highlight ================================
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:android_sdk_path="/Users/jiangwenwen/Workspace/AOSP/Android"



