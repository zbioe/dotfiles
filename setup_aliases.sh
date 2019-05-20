#!/bin/sh

set -e

BASEDIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"

make_link(){
    rpath=$1
    src=${BASEDIR}/$rpath
    path=${HOME}/.${rpath}
    bkp=${path}.bkp
    if [ -s $bkp ]; then
	rm -Rf $bkp
    fi
    if [ -s $path ]; then
	mv $path $bkp
    fi
    ln -sf $src $path
}

make_link tmux.conf
make_link emacs.d
make_link gitignore
make_link gitconfig
