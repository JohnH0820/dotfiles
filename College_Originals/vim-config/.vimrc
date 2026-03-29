set nocompatible
filetype off

" Set runtime path for Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize Vundle
call vundle#begin()

" Plugin Manager itself
Plugin 'VundleVim/Vundle.vim'

" Colorscheme
Plugin 'nanotech/jellybeans.vim'

" Vim improvements
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'

" End Vundle
call vundle#end()

filetype plugin indent on

" Set color scheme
colorscheme jellybeans

