call pathogen#infect()

set nocompatible
syntax on
set background=dark
colorscheme molokai
set softtabstop=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
let mapleader=","
nnoremap <leader><leader> <c-^>

nnoremap <leader><space> :noh<cr>

au BufNewFile,BufRead *.less setlocal ft=css

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

nmap <C-N><C-N> :set invnumber<CR>


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader>ft Vatzf

imap <c-l> <space>=><space>

" jj alow to go out from insert/edit mode
inoremap jj <ESC>

" always show statusline
set laststatus=2

" netrw confi
let g:netrw_liststyle=3

