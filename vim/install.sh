#!/bin/bash
# 初始化VIM配置的脚本
# 最小支持的VIM版本为7.4
# author: Cary
# email: 289872225@qq.com

VIMDIR=~/.vim
VIMRC=~/.vimrc
VIMRCLOCAL=~/.vimrc.local
VIMRCPLUG=~/.vimrc.plug
SCRIPTDIR=$(cd "$(dirname "$0")"; pwd)

version=`vim --version|head -n 1|awk '{print $5}'`
min_version=7.4

if [ $(expr $version \>= $min_version) -eq 0 ]
then
    echo "最小支持VIM版本为$min_version, 您的VIM版本号为:$version"
    exit
fi

if [ ! -d "$VIMDIR/autoload" ]; then
    mkdir -p "$VIMDIR/autoload"
    if [ ! -d "$VIMDIR/autoload" ]; then
        echo "创建 $VIMDIR/autoload 失败"
        exit
    fi
fi

if [ ! -d "$VIMDIR/plugged" ]; then
    mkdir -p "${VIMDIR}/plugged"
    if [ ! -d "$VIMDIR/plugged" ]; then
        echo "创建 $VIMDIR/plugged 失败"
        exit
    fi
fi

if [ ! -f "$VIMRC" ]; then
    cp -f ${SCRIPTDIR}/.vimrc $VIMRC
    if [ ! -f "$VIMRC" ]; then
        echo "移动.vimrc文件失败,路径: ${SCRIPTDIR}/.vimrc -> $VIMRC"
        exit
    fi
fi

if [ ! -f "$VIMRCLOCAL" ]; then
    cp -f ${SCRIPTDIR}"/.vimrc.local" $VIMRCLOCAL
    if [ ! -f "$VIMRCLOCAL" ]; then
        echo "移动.vimrc.local文件失败, 路径: ${SCRIPTDIR}/.vimrc.local -> $VIMRCLOCAL"
        exit;
    fi
fi

if [ ! -f "$VIMRCPLUG" ]; then
    cp -f ${SCRIPTDIR}"/.vimrc.plug" $VIMRCPLUG
    if [ ! -f "$VIMRCPLUG" ]; then
        echo "移动.vimrc.plug 文件失败, 路径: ${SCRIPTDIR}/.vimrc.plug -> $VIMRCPLUG"
        exit;
    fi
fi

if [ ! -f "$VIMDIR/.editorconfig" ]; then
    cp -f ${SCRIPTDIR}/.editorconfig ${VIMDIR}/.editorconfig
    if [ ! -f "$VIMDIR/.editorconfig" ]; then
        echo "移动.editorconfig失败, 路径: ${SCRIPTDIR}/.editorconfig -> ${VIMDIR}/.editorconfig"
        exit;
    fi
fi

echo "初始化VIM配置文件成功!"

if [ ! -f "$VIMDIR/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "下载plug.vim成功"
fi

if [ $? -ne 0 ]; then
    echo "下载plug.vim失败"
    exit
fi
