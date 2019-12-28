#!/bin/bash

# Get path to the directory of this file, no matter where it is sourced from
MYPATH=$(dirname ${BASH_SOURCE[0]})

cp luskrc ~/.luskrc

# TODO: make sure this line doesn't already exist
echo "source ~/.luskrc" >> ~/.bashrc

# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall # make sure that your .vimrc is populated with plugins

# Install YouCompleteMe
#sudo apt install -y build-essential cmake
#sudo apt install -y python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
