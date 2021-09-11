#########################################################################
# File Name: setup.sh
# Author: BillCong
# mail: cjcbill@gmail.com
# Created Time: 2020年11月26日 星期四 13时56分51秒
#########################################################################
#!/bin/bash
set -x
VIMRC_PATH=~/.vimrc
VIM_PATH=~/.vim

VIMRC_BACKUP_PATH=~/.vimrcbk
VIM_BACKUP_PATH=~/.vimbk

BILLSVIM=$PWD
BILLSVIMRC=$BILLSVIM/vimrc

# download submodules
git submodule update --init --recursive

# backup origin vim files.
if [ -h $VIMRC_PATH ];then
    rm $VIMRC_PATH
elif [ -f $VIMRC_PATH ];then
    mv $VIMRC_PATH $VIMRC_BACKUP_PATH
fi

if [ -h $VIM_PATH ];then
    rm $VIM_PATH
elif [ -d $VIM_PATH ];then
    mv $VIM_PATH $VIM_BACKUP_PATH
fi

ln -s $BILLSVIM $VIM_PATH
ln -s $VIM_PATH/vimrc $VIMRC_PATH

# install fzf
$BILLSVIM/tools/fzf/install

# update vim-logcat
if [ -d $BILLSVIM/syntax ];then
    rm -rf $BILLSVIM/syntax
fi
mkdir $BILLSVIM/syntax
ln -s $BILLSVIM/bundle/vim-logcat/syntax/logcat.vim $BILLSVIM/syntax/logcat.vim

if [ -d $BILLSVIM/ftdetect ];then
    rm -rf $BILLSVIM/ftdetect
fi
mkdir $BILLSVIM/ftdetect
ln -s $BILLSVIM/bundle/vim-logcat/ftdetect/logcat.vim $BILLSVIM/ftdetect/logcat.vim

# configure tmux
TMUX_RET=`sed -n 's/.*\(set-window-option -g mode-keys vi\).*/1/p' ~/.tmux.conf`
if [ -z $TMUX_RET ];then
    echo "set-window-option -g mode-keys vi" >> ~/.tmux.conf
fi

echo "VIM setup finished"
set +x
