#########################################################################
# File Name: setup.sh
# Author: BillCong
# mail: cjcbill@gmail.com
# Created Time: 2020年11月26日 星期四 13时56分51秒
#########################################################################
#!/bin/bash
set -x
VIMRC_PATH=$HOME/.vimrc
VIM_PATH=$HOME/.vim

VIMRC_BACKUP_PATH=/tmp/
VIM_BACKUP_PATH=/tmp/.vimbk

BILLSVIM=$PWD
BILLSVIMRC=$BILLSVIM/vimrc

# download submodules
git submodule update --init --recursive

# backup origin vim files.
# check if the symbolic link exists
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
ln -s $BILLSVIM/vimrc $VIMRC_PATH

# install fzf
$BILLSVIM/bundle/fzf/install

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

OS=`uname -s`
# install ctags
if [ "$OS" = "Darwin" ];then
    if ! [ -x "$(command -v ctags)" ]; then
        brew install ctags-exuberant
    fi

    if ! [ -x "$(command -v cscope)" ]; then
        brew install Cscope
    fi
else
    if ! [ -x "$(command -v ctags)" ]; then
        sudo apt install ctags
    fi

    if ! [ -x "$(command -v cscope)" ]; then
        sudo apt install cscope
    fi
fi

echo "VIM setup finished"
set +x
