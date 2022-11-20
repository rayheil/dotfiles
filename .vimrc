" Plugins (vim-plug because I'm wimpy)
call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'jpalardy/vim-slime'
  Plug 'preservim/nerdcommenter'
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
filetype plugin indent on

" Autoindent
set autoindent

" Show a line where our cursor is right now
set cursorline

" Make statusline display some simple info
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" Set format options.
" Automatically wrap text and comments if tw is set, but do not autowrap
" comments when we press <Enter> or <o>
set formatoptions=tc

" By default, don't wrap lines
set nowrap

" Mouse mode
set mouse=a

" Copy to wl-clipboard from visual mode with C-@
xnoremap <silent> <C-@> :w !wl-copy<CR><CR>

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

" Make there be colors? Idk how I'll be honest
if has('termguicolors')
    "" Turns on true terminal colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    "" Turns on 24-bit RGB color support
    set termguicolors

    "" Defines how many colors should be used. (maximum: 256, minimum: 0)
    set t_Co=256
endif

" Override onedark's default comment color to purple for visibility
" The cterm and cterm16 don't match, I can't figure them out. They mean
" purple.
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#61afef", "cterm": "170", "cterm16": "5"},
\}

" Dark mode good (revolutionary)
colorscheme onedark 
set bg=dark

" Syntax (everything else must be loaded already)
syntax on
