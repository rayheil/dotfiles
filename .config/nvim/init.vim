" ------------------------------------------------------------------------------
" plugins with vim-plug
" ------------------------------------------------------------------------------

call plug#begin()

" Sensible defaults
Plug 'tpope/vim-sensible'

" NERDTree
Plug 'scrooloose/nerdtree'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'

" Comments
Plug 'tpope/vim-commentary'

" Search
Plug 'ctrlpvim/ctrlp.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

" Themes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" ------------------------------------------------------------------------------
" Completion 
" ------------------------------------------------------------------------------

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set ofu=syntaxcomplete#Complete
set completeopt=noinsert,menuone,noselect

" ------------------------------------------------------------------------------
" Linting
" ------------------------------------------------------------------------------

" do not use ghc as a linter, it can't find cabal imports 
let g:ale_linters = {'haskell': ['cabal_ghc', 'ghc-mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc']}

" ------------------------------------------------------------------------------
" General
" ------------------------------------------------------------------------------

set bg=dark               " dark background for theme
set nocp                  " nocompatible, always on for nvim but good to set
set ruler                 " show document progress
set number                " enable line numbers
set wildmenu              " use a better menu selector
set cursorline            " horizontal line where the cursor is right now
set mouse=a               " enable mouse
set nowrap                " by default, don't wrap text
set clipboard=unnamedplus " sync nvim and system clipboard
set relativenumber

" ------------------------------------------------------------------------------
" Code folding? No thank you
" ------------------------------------------------------------------------------

set nofoldenable

" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------

set hlsearch  " highlight search
set incsearch " incremental search
set smartcase " smart choose whether to be case-sensitive

" ------------------------------------------------------------------------------
" Custom
" ------------------------------------------------------------------------------

" Make statusline display some simple info
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" Text Files (when I want text to wrap and stuff) 
function SetPlaintextOptions()
  setlocal tw=80
endfunction
autocmd BufNewFile,BufRead *.txt,*.tex,*.md call SetPlaintextOptions()

" C files
function SetCOptions()
  set cindent
endfunction
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()

:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Colorscheme
colorscheme catppuccin

" Syntax highlighting (must be at bottom of file) 
syntax on

