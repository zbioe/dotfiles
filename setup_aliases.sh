#!/bin/sh
set -e

DOTFILES="$(cd -P "$(dirname "$SOURCE")" && pwd)"

make_link(){
    rpath=$1
    src=${DOTFILES}/$rpath
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
make_link zshrc
make_link emacs.d
make_link aliases.d
make_link gitignore
make_link gitconfig
make_link profile.d
make_link kitty
