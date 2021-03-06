#!/bin/bash

# Get path to the directory of this file, no matter where it is sourced from
MYPATH=$(dirname ${BASH_SOURCE[0]})
ORIGIN=$(dirname $(readlink -f $0))

if [ -f "$HOME/.luskrc" ]; then
  echo "$HOME/.luskrc already exists -- not copying"
else
  cp luskrc $HOME/.luskrc
  sed -i s~__DOTFILES__~$ORIGIN~g $HOME/.luskrc
fi

# Make sure this line doesn't already exist
if ! grep -Fq ".luskrc" $HOME/.bashrc; then
  echo "source ~/.luskrc" >> $HOME/.bashrc
fi

# setup ROS env
cp rosrc $HOME/.rosrc
cp rosprofiles $HOME/.rosprofiles

# setup tmux
cp tmux.conf $HOME/.tmux.conf

# copy vimrc
cp vimrc $HOME/.vimrc

# Install lsg tool
git clone https://github.com/gerph/ls-with-git-status /tmp/lsg
mv /tmp/lsg/lsg $HOME/.local/bin/
rm -rf /tmp/lsg

# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall # make sure that your .vimrc is populated with plugins

# Install YouCompleteMe
#sudo apt install -y build-essential cmake
#sudo apt install -y python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
