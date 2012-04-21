set linespace=1
set antialias

" Don't beep
set visualbell
set guifont=Inconsolata:h14

set guioptions-=T   " No toolbar
set guioptions-=r   " No scrollbars

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
  " MacVIM shift+arrow-keys behavior (required in .vimrc)
  let macvim_hig_shift_movement = 1

  " macvim alloy file browser
  noremap <leader>d :maca toggleFileBrowser:<CR>
  noremap <leader>b :maca openFileBrowser:<CR>
end
