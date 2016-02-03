#!/bin/bash

# install configurations as symlinks

# git
ln -s ./.gitconfig $HOME/.gitconfig


# neovim
mkdir -p $HOME/.config/nvim/init.vim
ln -s ./init.vim $HOME/.config/nvim/init.vim

# vim
ln -s ./.vimrc $HOME/.vimrc
