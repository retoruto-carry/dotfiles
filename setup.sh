#!/bin/bash

DOT_FILES=(.zshrc .vimrc .vimrc.local .vimrc.local.bundles)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
