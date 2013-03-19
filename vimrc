" inspiration taken from multiple source including :
" http://mislav.uniqpath.com/2011/12/vim-revisited/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://vimcasts.org/
" http://amix.dk/vim/vimrc.html
" https://www.destroyallsoftware.com/screencasts/catalog/some-vim-tips

call pathogen#infect()

set nocompatible
syntax on
set background=dark
colorscheme molokai-im
set softtabstop=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" No backup file and no swap file
set nobackup
set noswapfile

" Indentation
set ai "Auto indent
set si "Smart indet

set ttyfast


filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Tab/Space
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline

" folding
set foldmethod=indent "fold based on indent
" set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

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
  au BufNewFile,BufRead Guardfile setlocal ft=ruby
" Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript
  au BufNewFile,BufRead *.pde set ft=arduino
  au BufNewFile,BufRead *.ino set ft=arduino
  " Delete all whitespace in end of line
  autocmd BufWritePre * :%s/\s\+$//e
endif

" line numbering
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nmap <C-N><C-N> :set invnumber<CR>
nmap <Leader>c :set cursorline!<CR>

" invisible char
" nmap <leader>l :set list!<CR>

" http://bairuidahu.deviantart.com/art/Flying-vs-Cycling-261641977
nnoremap <leader>l :ls<CR>:b<space>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#9797a9
highlight SpecialKey guifg=#9797a9

"for moving in a line
noremap <C-A>      <Home>
noremap <C-E>      <End>


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <leader>ft Vatzf

imap <c-l> <space>=><space>

" jj alow to go out from insert/edit mode
inoremap jj <ESC>


" block using arrow key (don't understand why at this time but try)

"nnoremap j gj
"nnoremap k gk

" force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Keep the cursor in place while joining limes
nnoremap J mzJ`z

" don't write too long line of code so show me the limit
"set wrap
"set textwidth=79
"set formatoptions=qrn1
set colorcolumn=85

" always show statusline
set laststatus=2

" netrw confi
let g:netrw_liststyle=3

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


" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Markdown handling

" Enable spellchecking for Markdown
" au BufRead,BufNewFile *.md setlocal spell

 " Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80"

function! NewHash()
  execute '%s/:\([^ ]*\)\(\s*\)=>/\1:/g'
endfunction


" Powerline configuration
set rtp+=~/.vim/bundle/powerline.vim/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'


" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
" pb with fugitve call
" set statusline=%<\ %n:%f\ %m%r%y\ %{fugitive#statusline()}\ %=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" Rails.vim quick mapping

" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes
command! Rstart :! touch tmp/restart.txt<CR><CR>

" Ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack <C-R>=expand("<cword>")<CR>

" Surround.vim
" via: http://whynotwiki.com/Vim
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw# Wrap the token under the cursor in #{}
" v...s# Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35 = "#{\r}" " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>" " -
let g:surround_61 = "<%= \r %>" " =



"Function: ToHaml
"Desc: Convert an erb template to an haml one
"
"Arguments:
"
function! ToHaml()
  "change les tag erb ruby en haml <%- -> -
  execute '%s/<%-/-/g'
  "change les tag eruby <%= -> =
  execute '%s/<%=/=/g'
  "supprime les tags erb ruby fermant
  execute '%s/-\send//g'
  execute '%s/\s*-%>//g'
  execute '%s/\s*%>//g'
  "remplace le stags ouvrant par %tag ex <table... -> %table
  execute '%s/<\([a-z]\)/%\1/g'
  "supprime les reste de fin de balise html ouvrante
  execute '%s/>$//g'
  "supprime les thag html fermant
  execute '%s/<\/.*//g'
  "transforme les hash 1.8  en 1.9
  execute '%s/:\([^ ]*\)\(\s*\)=>/\1:/g'
  "passse la coloration syntaxique en haml en attendant le renomage
  execute 'set filetype=haml'
endfunction


augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap  P :Pick<CR>
  nnoremap  S :Squash<CR>
  nnoremap  F :Fixup<CR>
  nnoremap  C :Cycle<CR>
endfun
