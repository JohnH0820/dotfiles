" =============================================================================
" ~/.vimrc
" Install plugins on first run: vim +PlugInstall +qall
" =============================================================================

" ── vim-plug (auto-install if missing) ───────────────────────────────────────
let plug_path = expand('~/.vim/autoload/plug.vim')
if empty(glob(plug_path))
    silent execute '!curl -fLo ' . plug_path . ' --create-dirs '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'       " colorscheme
Plug 'tpope/vim-fugitive'            " git integration
Plug 'tpope/vim-commentary'          " gc to toggle comments
Plug 'preservim/nerdtree'            " file tree sidebar
Plug 'airblade/vim-gitgutter'        " show git diff in gutter
Plug 'itchyny/lightline.vim'         " lightweight status line

call plug#end()

" =============================================================================
" GENERAL
" =============================================================================
set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8
set history=500
set undolevels=500
set autoread                          " reload files changed outside vim
set backspace=indent,eol,start        " sensible backspace behavior
set hidden                            " allow switching buffers without saving
set mouse=a                           " enable mouse support

" =============================================================================
" APPEARANCE
" =============================================================================
colorscheme jellybeans
set background=dark
set number                            " line numbers
set relativenumber                    " relative line numbers
set cursorline                        " highlight current line
set showmatch                         " highlight matching brackets
set laststatus=2                      " always show status line
set noshowmode                        " lightline handles this

" =============================================================================
" INDENTATION
" =============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                         " use spaces instead of tabs
set smartindent
set autoindent

" =============================================================================
" SEARCH
" =============================================================================
set hlsearch                          " highlight search results
set incsearch                         " incremental search
set ignorecase                        " case-insensitive search...
set smartcase                         " ...unless you use uppercase

" =============================================================================
" KEY MAPPINGS
" =============================================================================
let mapleader = ","

" Clear search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Move between splits with Ctrl+direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
