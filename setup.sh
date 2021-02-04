#########################################################################
# File Name: setup.sh
# Author: BillCong
# mail: cjcbill@gmail.com
# Created Time: 2020年11月26日 星期四 13时56分51秒
#########################################################################
#!/bin/bash

VIMRC_PATH=~/.vimrc
VIM_PATH=~/.vim

VIMRC_BACKUP_PATH=~/.vimrcbk
VIM_BACKUP_PATH=~/.vimbk

BILLSVIMRC=$PWD/vimrc
BILLSVIM=$PWD

if [ -f $VIMRC_PATH ];then
    mv $VIMRC_PATH $VIMRC_BACKUP_PATH
fi

if [ -d $VIM_PATH ];then
    mv $VIM_PATH $VIM_BACKUP_PATH
fi

ln -s $BILLSVIMRC $VIMRC_PATH
ln -s $BILLSVIM $VIM_PATH

$BILLSVIM/tools/fzf/install

echo "VIM setup finished"
