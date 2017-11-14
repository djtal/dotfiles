call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-vinegar'
Plug 'janko-m/vim-test'
Plug 'BlakeWilliams/vim-tbro'
Plug 'dag/vim-fish'
Plug 'tpope/vim-projectionist'
Plug 'ryanoasis/vim-devicons'
Plug 'kana/vim-textobj-user'
Plug 'andyl/vim-textobj-elixir'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'bfontaine/Brewfile.vim'
Plug 'cespare/vim-toml'
Plug 'tmux-plugins/vim-tmux'
Plug 'machakann/vim-highlightedyank'

" Better search
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-grepper'

" Themes

Plug 'trevordmiller/nova-vim'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-janah'


" JS plugins
"

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'elzr/vim-json'
Plug 'jaawerth/nrun.vim'
Plug 'jparise/vim-graphql'

Plug 'junegunn/goyo.vim'

Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

call plug#end()

filetype plugin indent on    " required
syntax on

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

set background=dark
" let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme nova

" let g:seoul256_background = 236
" colo seoul256

set colorcolumn=85,120
" let &colorcolumn=join(range(85,999),",")
highlight ColorColumn ctermbg=246 guibg=#41535D
highlight VertSplit guibg=#41535D
highlight StatusLineNC guibg=#41535D


" No backup file and no swap file
set nobackup
set noswapfile

" Tab/Space
set expandtab
set tabstop=2
set shiftwidth=2
" set conceallevel=2

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
" jj alow to go out from insert/edit mode
inoremap jj <ESC>
" quickliy go to end of line in insert mode very usefull with auto parenthesis
inoremap ii <Esc>$a
" Do not show stupid q: window
" https://vi.stackexchange.com/questions/457/does-ex-mode-have-any-practical-use
" for more exemple of Ex mode
map q: :q


" on the fly vimrc editing and applying
nmap <leader>v :tabedit $MYVIMRC<CR>

if has('autocmd')
  autocmd bufwritepost init.vim source $MYVIMRC
  " Delete all whitespace in end of line
  " autocmd BufWritePre * :%s/\s\+$//e
  " autocmd! BufWritePost * Neomake
endif

augroup filetypedetect
    au BufRead,BufNewFile Dangerfile setfiletype ruby
    au BufRead,BufNewFile *.ronn setfiletype markdown
    " associate *.foo with php filetype
augroup END

" easy acces to edit in split mode and tab
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" tabs managment
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
map <C-w> :tabclose<CR>
nmap tt :tabnext<cr>
map tt :tabnext<cr>
nmap tp :tabprev<cr>
map tp :tabprev<cr>


nnoremap <leader>ft Vatzf
" open tig in a new tabs
nnoremap <Leader>gg :tabnew<CR>:terminal tig<CR>

augroup terminalCallbacks
  autocmd!
  autocmd TermClose * call feedkeys('<cr>')
augroup END

imap <c-l> <space>=><space>


" visual move block of line
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap k :m '<-2<cr>gv=gv


" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
" autocmd BufWritePre <buffer> call <SID>StripTrailingWhitespaces()


" vim-incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" vim light-line
"
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ],
      \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? '🔥 ' : ''
  return modified . filename
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" vim-grepper
nnoremap <leader>g :Grepper -tool rg<cr>


" vim-projectionnist
"
let g:projectionist_heuristics = {
      \  "config/prod.exs": {
      \    "web/controllers/*_controller.ex": {
      \      "type": "controller",
      \      "alternate": "test/controllers/{}_controller_test.exs",
      \    },
      \    "web/models/*.ex": {
      \      "type": "model",
      \      "alternate": "test/models/{}_test.exs",
      \    },
      \    "web/views/*_view.ex": {
      \      "type": "view",
      \      "alternate": "test/views/{}_view_test.exs",
      \    },
      \    "web/templates/*.html.eex": {
      \      "type": "template",
      \      "alternate": "web/views/{dirname|basename}_view.ex"
      \    },
      \    "lib/organizations_api/*.ex": {
      \      "type": "lib",
      \      "alternate": "test/lib/organizations_api/*.ex"
      \    },
      \    "CHANGELOG.md": {
      \      "type": "change",
      \    },
      \    "doc/swagger.yaml": {
      \      "type": "swag",
      \    },
      \    "test/*_test.exs": {
      \      "type": "test",
      \      "alternate": "web/{}.ex",
      \    }
      \  }
      \}

let g:rails_projections = {
      \ "doc/*_swagger.yml": {
      \   "alternate": "spec/swagger/%s_swagger_spec.rb",
      \   "command": "swagger"
      \ },
      \ "CHANGELOG.md": {
      \   "type": "change",
      \ },
      \ "app/use_cases/*.rb": {
      \   "command": "case"
      \ },
      \ "app/serializers/*.rb": {
      \   "command": "serializer"
      \ },
      \ "lib/uts_events/*.rb": {
      \   "command": "uts",
      \   "alternate": "spec/uts/{}_spec.rb",
      \ },
      \ "spec/factories/*.rb": {
      \   "command": "factory"
      \ },
      \ "spec/requests/*.rb": {
      \   "alternate": "app/controllers/{}_controller.rb",
      \ }
      \}


" Neoformat
"
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.css Neoformat



let g:jsx_ext_required = 0

" conceling
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"

" ALE
"
let g:ale_sign_column_always = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:go_fmt_fail_silently = 1 " avoid conflict with vim-ogo : https://github.com/w0rp/ale/issues/609

nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" vim-test config

" Use tbro with vim-test
let g:tbro_window = 1

function! TbroStrategy(cmd)
  execute 'Tbro ' . a:cmd
endfunction

let g:test#custom_strategies = {'tbro': function('TbroStrategy')}
let g:test#strategy = 'tbro'


nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>


nnoremap ! :Tbro

nmap <silent> <leader>r :Tbro rake db:migrate<CR>

" vim-goyo

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-fzf

nmap <C-p> :FZF<cr>


" vim-jsx

let g:jsx_ext_required = 0

" fugitive.vim
"
nnoremap <silent> <leader>gs :GStatus<CR>

" vim-rhubarb
"
let g:github_enterprise_urls = ['https://github.skillsoft.com']

" commentary mapping
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>


" Disble The file has been changed since reading it for time change only

function! ProcessFileChangedShell()
        if v:fcs_reason == 'mode' || v:fcs_reason == 'time'
                let v:fcs_choice = ''
        else
                let v:fcs_choice = 'ask'
        endif
endfunction

autocmd FileChangedShell <buffer> call ProcessFileChangedShell()

augroup vim_config
  autocmd FileType gitrebase call LoadGitrebaseBindings()
augroup END

fun! LoadGitrebaseBindings()
  nnoremap  P :Pick<CR>
  nnoremap  S :Squash<CR>
  nnoremap  F :Fixup<CR>
  nnoremap  C :Cycle<CR>
endfun


