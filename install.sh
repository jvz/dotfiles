#!/bin/bash

require_command() {
    type "$1" >/dev/null 2>&1 || { echo "$2"; exit 1; }
}

install_dependencies() {
    require_command brew "You must install homebrew to run this script. Go to https://brew.sh/ and follow the instructions."
    brew update && brew install stow vim git zsh tmux
}

stow_dirs() {
    for d in "$@"; do
        stow -R "$d"
    done
}

full_name() {
    [[ "$1" = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

stow_file() {
    local src="`full_name \"$1\"`"
    local dst="$2"
    mkdir -p "$dst"
    ln -si "$src" "$dst"
}

main() {
    install_dependencies
    git submodule update --init --recursive
    # it's important for files to be stowed first to avoid oversharing directories with stow
    stow_file sbt-extras/sbt "$HOME/bin"
    stow_file vim-plug/plug.vim "$HOME/.vim/autoload"
    stow_file zimfw/zimfw.zsh "$HOME/.zim"
    stow_dirs vim emacs git zsh
    vim -c ":PlugInstall"
    echo To finish installing zim, run the following:
    echo source "$HOME/.zim/zimfw.zsh" install
}

main
