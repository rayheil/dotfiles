" Plugins (vim-plug because I'm wimpy)
call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'jpalardy/vim-slime'
  Plug 'preservim/nerdcommenter'
  Plug 'chriskempson/base16-vim'
call plug#end()

" Syntax highlighting
syntax enable

" Vim slime settings (paste into tmux buffer)
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_python_ipython = 1

" Make slime send the entire file
nmap <c-c><c-x> :%SlimeSend<cr>

" Enable line numbers
set number

" Detect filetypes
filetype plugin on

" Make statusline display some simple info
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" By default, don't wrap lines
set nowrap

" Mouse mode
set mouse=a

" Copy to wl-clipboard from visual mode with C-@
xnoremap <silent> <C-@> :w !wl-copy<CR><CR>

" Theme (everything else must be loaded already)
"" Turns on syntax highlighting
syntax on

if has('termguicolors')
    "" Turns on true terminal colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    "" Turns on 24-bit RGB color support
    set termguicolors

    "" Defines how many colors should be used. (maximum: 256, minimum: 0)
    set t_Co=256
endif

colorscheme base16-tomorrow-night

