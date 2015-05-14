"---------------------------------------------------------------------------
" Powerline Settings
"---------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

" Insert the charcode segment after the filetype segment
"call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" Replace the scrollpercent segment with the charcode segment
"call Pl#Theme#ReplaceSegment('scrollpercent', 'fileinfo')

"---------------------------------------------------------------------------
" Set up the window colors and size
"---------------------------------------------------------------------------
" Set 256 colors mode
set t_Co=256
" Search settings
set nohlsearch
" Message settings
set shortmess+=I
"language mes en
" Set colors
syntax enable
set background=dark
colorscheme xoria256 "Monokai "molokai "aldmeris "relaxedgreen
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set guioptions+=at
set guioptions-=r
if has("gui_running")
  if has("gui_gtk2")
    :set guifont=Liberation\ Mono\ 10
    ":set guifont=Droid\ Sans\ Mono\ 10
  elseif has("x11")
    " Also for GTK 1
    :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_win32")
    :set guifont=DejaVu_Sans_Mono:h10
  else
    :set guifont=Liberation\ Mono\ 12
  endif
  if !exists("g:vimrcloaded")
    winpos 1000 0
    if !&diff
      winsize 90 72
      "winsize 82 76
    else
      winsize 200 66
      "winsize 200 76
    endif
    let g:vimrcloaded = 1
  endif
endif
