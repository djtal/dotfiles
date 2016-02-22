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
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'rking/ag.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'benekastah/neomake'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf' }


call vundle#end()            " required


filetype plugin indent on    " required
syntax on

set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-ocean

set colorcolumn=85

" Tab/Space
set expandtab
set tabstop=2
set shiftwidth=2

" more natural split defaut position
set splitbelow
set splitright

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nmap <C-N><C-N> :set invnumber<CR>
nmap <Leader>c :set cursorline!<CR>

let mapleader=","
nnoremap <leader><leader> <c-^>
nnoremap <leader><space> :noh<cr>

" Fast saving
nmap <leader>w :w!<cr>

" on the fly vimrc editing and applying
nmap <leader>v :tabedit $MYVIMRC<CR>

if has("autocmd")
  autocmd bufwritepost init.vim source $MYVIMRC
  " Delete all whitespace in end of line
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd! BufWritePost * Neomake
endif
" easy acces to edit in split mode and tab
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" tabs managment
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
nmap tt :tabnext<cr>
map tt :tabnext<cr>
nmap tp :tabprev<cr>
map tp :tabprev<cr>
nmap <C-t> :tabnew<cr>
imap <C-t> <Esc>:tabnew<cr>


nnoremap <leader>ft Vatzf

imap <c-l> <space>=><space>

" jj alow to go out from insert/edit mode
inoremap jj <ESC>



" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
autocmd BufWritePre <buffer> call <SID>StripTrailingWhitespaces()


" Airline config

let g:airline_theme='base16'
let g:airline_detect_modified=1
" let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1

" Ag config

let g:ag_working_path_mode="r"


" NeoMake

let g:neomake_ruby_enabled_makers = ['rubocop']

" vim-rspec config

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline_whitespace_symbol = 'Ξ'

