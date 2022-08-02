" Plugins (vim-plug because I'm wimpy)
call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'jpalardy/vim-slime'
  Plug 'preservim/nerdcommenter'
  Plug 'morhetz/gruvbox'
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

" Gruvbox themes (and all the stuff to make it work properly)
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
