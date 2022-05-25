" Globals that need to activate
" Install plugins with 'junegunn/vim-plug'
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.config/nvim/plugged")
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ======================
"  VIM BUILDIN SETTINGS
" ======================

" Space as leaders
let mapleader = " "

" Regular copy and paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Mouse support
set mouse=a

" Enable line numbers
set number

" No background
hi Normal guibg=NONE ctermbg=NONE

" ==================
"  MY DUMB SETTINGS
" ==================

" Detect filetypes
filetype on

" Do not make Coc suggestions in markdown files
autocmd FileType markdown let b:coc_suggest_disable = 1

" Set status line to display some simple info
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" Do not wrap lines over
set nowrap

" =================
"  PLUGIN SETTINGS
" =================

source $HOME/.config/nvim/plugconf/coc.vim

