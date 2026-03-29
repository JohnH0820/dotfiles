#!/bin/bash

DOTFILES_DIR=~/dotfiles
VIMRC=$DOTFILES_DIR/vim-config/.vimrc
VUNDLE_DIR=~/.vim/bundle/Vundle.vim

echo "Copying .vimrc to home directory..."
cp $VIMRC ~/.vimrc

if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
else
    echo "Vundle already installed."
fi

echo "Installing Vim plugins..."
vim +PluginInstall +qall

echo "Vim setup complete!"

