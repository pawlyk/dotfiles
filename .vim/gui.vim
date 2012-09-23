"---------------------------------------------------------------------------
" Set up the window colors and size
"---------------------------------------------------------------------------
set t_Co=256

if has("gui_running")
    if has("gui_gtk2")
        :set guifont=Ubuntu\ Mono\ 11
    elseif has("x11")
        " Also for GTK 1
        :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
        :set guifont=DejaVu_Sans_Mono:h10
        language mes en
    endif
  set background=dark
  syntax enable
  colorscheme xoria256 "Monokai "molokai "aldmeris "relaxedgreen "xoria256
  if !exists("g:vimrcloaded")
      winpos 1000 0
      if !&diff
          winsize 82 48
      else
          winsize 200 48
      endif
      let g:vimrcloaded = 1
  endif
else
  syntax enable
  colorscheme xoria256 "zenburn "lucius
endif
:nohls

set shortmess+=I
