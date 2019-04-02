#!/bin/bash

DOT_FILES=(.zshrc .vimrc .vimrc.local .vimrc.local.bundles)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

# nvim
DOT_FILES=(init.vim local_bundles.vim local_init.vim)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/nvim/$file $HOME/.config/nvim/$file
done
