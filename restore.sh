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

if [ -f $VIMRC_BACKUP_PATH ];then
    rm $VIMRC_PATH
    mv $VIMRC_BACKUP_PATH $VIMRC_PATH 
fi

if [ -d $VIM_BACKUP_PATH ];then
    rm $VIM_PATH
    mv $VIM_BACKUP_PATH $VIM_PATH 
fi

echo "Restore VIM finished"
