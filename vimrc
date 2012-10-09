" inspiration taken from multiple source including :
"   http://mislav.uniqpath.com/2011/12/vim-revisited/
"   http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"   http://vimcasts.org/
"   http://amix.dk/vim/vimrc.html
"   https://www.destroyallsoftware.com/screencasts/catalog/some-vim-tips
"
call pathogen#infect()

" General option
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
" No backup file and no swap file
set nobackup
set noswapfile
set encoding=utf-8 " Necessary to show unicode glyphs

set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" highlight current line
set cursorline


let mapleader=","
nnoremap <leader><leader> <c-^>
nnoremap <leader><space> :noh<cr>

" Fast saving
nmap <leader>w :w!<cr>
" on the fly vimrc editing and applying
nmap <leader>v :tabedit $MYVIMRC<CR>
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  au BufNewFile,BufRead *.less setlocal ft=css
   " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript
  " Delete all whitespace in end of line
  autocmd BufWritePre * :%s/\s\+$//e
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.pde  setfiletype arduino
    au! BufRead,BufNewFile *.ino  setfiletype arduino
augroup END


set number
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" don't write too long line of code so show me the limit
"set wrap
"set textwidth=79
"set formatoptions=qrn1
set colorcolumn=85

nmap <C-N><C-N> :set invnumber<CR>

" invisible char
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#9797a9
highlight SpecialKey guifg=#9797a9

" Make backspace delete lots of things
set backspace=indent,eol,start


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader>ft Vatzf

" match bracket pair with tab
nnoremap <tab> %
vnoremap <tab> %

" easy acces to edit in split mode and tab
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Keep the cursor in place while joining limes
nnoremap J mzJ`z

imap <c-l> <space>=><space>

" jj alow to go out from insert/edit mode
inoremap jj <ESC>

" always show statusline
set laststatus=2

" netrw config
let g:netrw_liststyle=3

" block using arrow key (don't understand why at this time but try)
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>


" tabs managment
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
nmap tt :tabnext<cr>
map tt :tabnext<cr>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Powerline configuration
let g:Powerline_symbols = 'fancy'

" Ack.vim
nnoremap <leader>a :Ack <C-R>=expand("<cword>")<CR>

"custom Rails.vim config (ok stollen form aother dotfiles)
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb

" T-Comment
nnoremap <leader>t :TComment<CR>

" Smart input custom rules
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')

call smartinput#define_rule({'at': '\%#', 'char': '#', 'input': '#{}<Left>', 'filetype': ['ruby'], 'syntax': ['Constant', 'Special']})
call smartinput#define_rule({'at': '\({\|\<do\>\)\s*\%#', 'char': '<Bar>', 'input': '<Bar><Bar><Left>', 'filetype': ['ruby']})

" via: http://whynotwiki.com/Vim
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =
