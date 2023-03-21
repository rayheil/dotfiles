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
Plug 'joshdick/onedark.vim'

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
set colorcolumn=80        " vertical line on col 80
set number                " enable line numbers
set wildmenu              " use a better menu selector
set cursorline            " horizontal line where the cursor is right now
set mouse=a               " enable mouse
set nowrap                " by default, don't wrap text
filetype plugin indent on " enable all the nice indentation options
set clipboard=unnamedplus " sync nvim and system clipboard

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

" Highlight the text TODO in all files.
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" Properly enable color scheme in alacritty
if has('termguicolors')
    " Turns on true terminal colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Turns on 24-bit RGB color support
    set termguicolors

    " Defines how many colors should be used. (maximum: 256, minimum: 0)
    set t_Co=256
endif

" Override onedark's default comment color to blue for visibility
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#61afef", "cterm": "170", "cterm16": "5"},
\}
colorscheme onedark " must come after the above override

" Syntax highlighting (must be at bottom of file) 
syntax on
