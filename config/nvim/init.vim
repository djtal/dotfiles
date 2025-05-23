call plug#begin('~/.local/share/nvim/plugged')
" Git/Github interaction
Plug 'RobertAudi/git-blame.vim'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

Plug 'preservim/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': ['html', 'eruby'] }
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'janko-m/vim-test'
Plug 'BlakeWilliams/vim-tbro'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" Plug 'tweekmonster/fzf-filemru'
Plug 'bfontaine/Brewfile.vim'
Plug 'cespare/vim-toml'
Plug 'tmux-plugins/vim-tmux'
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'andymass/vim-matchup'
Plug 'kana/vim-textobj-user'
Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-ruby/vim-ruby'
Plug 'segeljakt/vim-silicon'
Plug 'thirtythreeforty/lessspace.vim' " remove unwanted space
Plug 'pechorin/any-jump.vim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}

" more ruby
"Plug 'jlcrochet/vim-ruby'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'
Plug 'smjonas/inc-rename.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SmiteshP/nvim-navic'
Plug 'folke/trouble.nvim'

" tree-sitter stuff
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'windwp/nvim-ts-autotag'

Plug 'cuducos/yaml.nvim'
Plug 'pedrohdz/vim-yaml-folds'

Plug 'nvim-tree/nvim-web-devicons'
" Plug 'mhinz/vim-grepper'

" Themes

Plug 'nvim-lua/plenary.nvim'
Plug 'will/bgwinch.nvim'
Plug 'folke/tokyonight.nvim'


Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'


" JS plugins
"
"

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'


Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'dstein64/vim-startuptime'

Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'luukvbaal/statuscol.nvim'

call plug#end()

filetype plugin indent on    " required
syntax on

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

set background=dark
colorscheme tokyonight-storm

set colorcolumn=85,120

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

" use system clipboard
set clipboard=unnamed

set number
nmap <C-N><C-N> :set invnumber<CR>
nmap <Leader>c :set cursorline!<CR>

let mapleader=","
let localmapleader=";"

" make leader,leader jump to previous buffer
" nnoremap <leader><leader> <c-^>
nnoremap <leader><space> :noh<cr>
nmap <leader>) <Plug>(GitGutterNextHunk)
nmap <leader>( <Plug>(GitGutterPrevHunk)


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
  autocmd BufWritePre * :%s/\s\+$//e
  " autocmd! BufWritePost * Neomake
  autocmd FileType html,css,eruby EmmetInstall
endif

au FileType markdown setl conceallevel=0


augroup filetypedetect
    au BufRead,BufNewFile Dangerfile setfiletype ruby
    au BufNewFile,BufRead *.json.jbuilder set ft=ruby
    au BufNewFile,BufRead *.json.jb set ft=ruby
    au BufNewFile,BufRead *.gemfile set ft=ruby
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
" Disabled j and k to use with luasnip
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" disabled since used by sideway.vim
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" tabs managment
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
nmap tt :tabnext<cr>
map tt :tabnext<cr>
nmap tp :tabprev<cr>
map tp :tabprev<cr>


nnoremap <leader>ft Vatzf

augroup terminalCallbacks
  autocmd!
  autocmd TermClose * call feedkeys('<cr>')
augroup END

imap <c-l> <space>=><space>

lua << EOF
require('tree_sitter_config')
require('lsp')
require('ufo_config')
require('nulls_config')
require('dev_icon')
require('lualine_config')
require('lua_snip')
require('statuscol_config')
require('git_signs')
EOF

" visual move block of line
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap k :m '<-2<cr>gv=gv



" don't show previw  on automplete
set completeopt-=preview

" vim-silicon
"
let g:silicon = {
      \ 'theme':              'Dracula',
      \ 'font':                  'Hack',
      \ 'background':         '#aaaaff',
      \ 'shadow-color':       '#555555',
      \ 'line-pad':                   2,
      \ 'pad-horiz':                 80,
      \ 'pad-vert':                 100,
      \ 'shadow-blur-radius':         0,
      \ 'shadow-offset-x':            0,
      \ 'shadow-offset-y':            0,
      \ 'line-number':           v:true,
      \ 'round-corner':          v:true,
      \ 'window-controls':       v:true,
      \ 'default-file-pattern':       '',
      \ }

let g:silicon['default-file-pattern'] =
      \ '~/Pictures/capture/silicon-{time:%Y-%m-%d-%H%M%S}.png'


set noshowmode

" vim-grepper
nnoremap <leader>g :Grepper -tool rg<cr>



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

" vim-test config

" Use tbro with vim-test
let g:tbro_window = 1

vmap <silent> <localleader>t :call tbro#run_selection()<cr>
nmap <silent> <localleader>t :call tbro#run_line()<cr>

" vim-markown
let g:vim_markdown_conceal_code_blocks = 0

function! TbroStrategy(cmd)
  execute 'Tbro ' . a:cmd
endfunction

let g:test#custom_strategies = {'tbro': function('TbroStrategy')}
let g:test#strategy = 'tbro'

nmap <silent> <leader>t :TestNearest CAPYBARA_DRIVER=chrome_headless<CR>
nmap <silent> <leader><leader>t :TestNearest CAPYBARA_DRIVER='chrome'<CR>
nmap <silent> <leader>T :TestFile CAPYBARA_DRIVER=chrome_headless<CR>
nmap <silent> <leader><leader>T :TestFile CAPYBARA_DRIVER=''<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>


nnoremap ! :Tbro

nmap <silent> <leader>r :Tbro rake db:migrate<CR>

" vim-fzf
" no preview window at all
let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~40%' }
" nmap <C-p> :FZF<cr>
let g:fzf_tags_command = 'ptags'
" nnoremap <c-p> :FZFMru --tiebreak=end<cr>
nnoremap <c-p> :Files<cr>
"nnoremap <c-p> :FZFMru<cr>
let g:fzf_mru_relative = 1
" nnoremap <c-t> :Tags<cr>

"" vim-jsx

let g:jsx_ext_required = 0

" anyjump.vim
"
" window size & position options
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.8
let g:any_jump_grouping_enabled = 1


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

function! GetJiraIssueFromGit()
  let l:jiraIssue = matchstr(gitbranch#name(), '\v\c(TKT-[0-9]*)')
  if strlen(l:jiraIssue)
    return toupper(l:jiraIssue)
  endif
endfunction

" replace templated JIRA issue with proper reference infered from
" template look like
" _TODO: Add the Jira issue number below._
"
" **Jira issue:** [TKT-XXX](https://tracktorfr.atlassian.net/browse/TKT-XXX)
function ReplaceJiraIssue()
  let l:jiraIssue = GetJiraIssueFromGit()
  if strlen(l:jiraIssue)
    g/TKT-XXX/-2d
    %s/TKT-XXX/\=GetJiraIssueFromGit()/g
  endif
endfunction


abbr gtkt <C-R>=GetJiraIssueFromGit()<CR>
command! SJiraIssue call ReplaceJiraIssue()

" remove pre-formatted issue type from release note
" line are formatted like this
" * <IssueType> - Issue long summary [ISSUE-ID][]
" It will then remove `<IssueType> -`
command! SJiraIssueType %s/*\zs.\{-}-\ze//g | :noh

autocmd bufwritepost .tmux.conf execute ':!tmux source-file %'
autocmd bufwritepost .tmux.local.conf execute ':!tmux source-file %'
