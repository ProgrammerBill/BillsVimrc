# Bill's Vim

```
 ____  _ _ _  ____                  _      __     ___
| __ )(_) | |/ ___|___  _ __   __ _( )___  \ \   / (_)_ __ ___
|  _ \| | | | |   / _ \| '_ \ / _` |// __|  \ \ / /| | '_ ` _ \
| |_) | | | | |__| (_) | | | | (_| | \__ \   \ V / | | | | | | |
|____/|_|_|_|\____\___/|_| |_|\__, | |___/    \_/  |_|_| |_| |_|
                              |___/
```

[English](README.md)

Bill's Vim是我个人的vim配置, 目的是能够快速布置环境。

## 快速开始

1. git clone https://github.com/ProgrammerBill/BillsVim.git
2. 运行setup.sh,将安装fzf并备份当前的vim配置
3. 在~/.bashrc中配置"export PATH=$PATH:[your directory]/BillsVim/tools",以便能够使用工具

## Vim插件:

- ~~Vundle用于安装vim插件[Vundle](https://github.com/VundleVim/Vundle.vim#quick-start)~~
- vim-plug用于安装vim插件,支持快速启动以及必要时加载功能[vim-plug](https://github.com/junegunn/vim-plug)
- TagBar用于显示MarkDown的标题[tagbar](https://github.com/preservim/tagbar)
- Cscope用于支持函数查找[cscope](http://cscope.sourceforge.net/)
- vim-markdown-toc用于快速生成MarkDown标题[vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)
- 用于配置`*`查找，且不会跳转到下一行 [Visual Star Search](https://github.com/bronson/vim-visual-star-search)
- vim-logcat用于查看Android日志时高亮. [gburca/vim-logcat](https://github.com/gburca/vim-logcat)
- fzf用于快速查找文件 [junegunn/fzf](https://github.com/junegunn/fzf)
- fzf.vim是vim中fzf的插件 [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- `cscope_macros`用于cscope的快捷键设置
- vim-autocomplpop用于快速补齐[vim-autocomplpop](https://github.com/othree/vim-autocomplpop)

## 工具

- ff能够快速打开文本类型的文件，基于fzf的查找结果进行。
- cs用于快速设置ctags和cscope tags，用于快速查找函数，调用函数处等。
