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
end
