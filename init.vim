set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rails'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'



call vundle#end()            " required

filetype plugin indent on    " required
syntax on


set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nmap <C-N><C-N> :set invnumber<CR>
nmap <Leader>c :set cursorline!<CR>




set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean


" Airline config

let g:airline_theme='base16'
let g:airline_detect_modified=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_linecolumn_prefix = '␊ '
" let g:airline_linecolumn_prefix = '␤ '
" let g:airline_linecolumn_prefix = '¶ '
" let g:airline_branch_prefix = '⎇ '
" let g:airline_paste_symbol = 'ρ'
" let g:airline_paste_symbol = 'Þ'
" let g:airline_paste_symbol = '∥'
" let g:airline_whitespace_symbol = 'Ξ'
