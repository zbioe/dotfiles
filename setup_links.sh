#!/bin/sh

set -e

make_link(){
    src=$1
    dest=$2
    [ -s $dest ] && rm -r $dest
    ln -sf $src $dest
}

mkdir -p ${HOME}/.config

make_link $(pwd)/tmux.conf ~/.tmux.conf
make_link $(pwd)/gitignore ~/.gitignore
make_link $(pwd)/gitconfig ~/.gitconfig
make_link $(pwd)/i3 ~/.config/i3
make_link $(pwd)/i3status ~/.config/i3status
make_link $(pwd)/fish ~/.config/fish
make_link $(pwd)/bin ~/bin
make_link $(pwd)/gtk-3.0 ~/.config/gtk-3.0
make_link $(pwd)/gtkrc-2.0 ~/.gtkrc-2.0

echo "links created"