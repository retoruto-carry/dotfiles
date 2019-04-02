#!/bin/bash

# zsh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# tmux
DOT_FILES=(.tmux.conf .tmux.conf.local)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/tmux/$file $HOME/$file
done

# nvim
DOT_FILES=(init.vim local_bundles.vim local_init.vim)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/nvim/$file $HOME/.config/nvim/$file
done
