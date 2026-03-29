# Vim Configuration

## Overview

This folder contains my personal Vim configuration, managed with **Vundle**.  
It sets up a development-friendly Vim environment with useful plugins for color, indentation, and Git integration.

## Setup Instructions

To install the Vim configuration and plugins:

1. Navigate to this folder:
   `cd ~/dotfiles/vimfiles`
   
2. Run the installer script:
  `./install_vim.sh`

**This script will:**
- Install Vundle (if not already installed).
- Set up your .vimrc configuration file.
- Install the listed Vim plugins.

3. After the scrip finishes, you can open Vim and start using the configured setup immediately.

## Plugins Included:
- [jellybeans](https://github.com/nanotech/jellybeans.vim)
- [vim-indent-guides](https://github.com/preservim/vim-indent-guides)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)

### Troubleshooting:
- If the plugin installation doesn't work, manually open Vim and run:
  `:PluginInstall`
- If Vundle isn't cloned correctly, you can manually clone it:
  `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

### Citations: 
- [Vundle](https://github.com/VundleVim/Vundle.vim)
- [jellybeans](https://github.com/nanotech/jellybeans.vim)
- [vim-indent-guides](https://github.com/preservim/vim-indent-guides)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
