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
Plug 'dense-analysis/ale'

" Tab autocomplete pretty much everywhere
Plug 'ervandew/supertab'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

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

let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1

" customize which linters are used
" haskell: meant to work with ghcup
" markdown: meant to help with formatting
"   from https://www.rockyourcode.com/lint-your-markdown-files-in-vim/
let g:ale_linters = {
\   'haskell':  ['cabal_ghc', 'ghc-mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc'],
\   'markdown': ['mdl', 'writegood'],
\}

" set what is fixed on save or :ALEFix
let g:ale_fixers = {
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------

" open or focus with C-n
map <silent> <C-n> :NERDTreeFocus<CR>

" ------------------------------------------------------------------------------
" Autocomplete
" ------------------------------------------------------------------------------

" autocomplete vim menus on tab
"   longest : complete longest common string
"   list    : list all matches
"   full    : complete the next full match
set wildmode=longest,list,full
set wildmenu

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

" C files
function SetCOptions()
  set cindent
endfunction
autocmd BufNewFile,BufRead *.c,*.h call SetCOptions()

set nu

" Syntax highlighting (must be at bottom of file)
syntax on
