" How to install
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" $ :BundleInstall
" $ sudo apt-get install ack-grep
" install Custom Menlo font for Powerline from https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts 
"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------

set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"---------------------------------------------------------------------------
" Plugin Bundles
"---------------------------------------------------------------------------

" Navigation
Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'c9s/bufexplorer'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'mru.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'codegram/vim-todo'
Bundle 'sjl/gundo.vim'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
" Snippets
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
" Additional easement
" MatchIt
Bundle 'matchit.zip'
" Libraries
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
" VCS
Bundle 'vcscommand.vim'
" Language Additions
" Python
Bundle 'klen/python-mode'
Bundle 'rainerborene/vim-pony'
Bundle 'vim-scripts/pydoc.vim'
"Bundle 'vim-scripts/vim-flake8'
Bundle 'mjbrownie/pythoncomplete.vim'
"Bundle 'ethanrublee/VimPdb'
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rvm'
" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
" Other Languages
Bundle 'mutewinter/nginx.vim'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'ap/vim-css-color'
Bundle 'acustodioo/vim-tmux'
Bundle 'hallison/vim-markdown'
Bundle 'xhtml.vim'
Bundle 'groenewege/vim-less'
" Color themes
Bundle 'twilight256.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/xoria256.vim'

filetype plugin indent on " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

"---------------------------------------------------------------------------
" Global Stuff
"---------------------------------------------------------------------------
" Printing options
set printoptions=header:0,duplex:long,paper:A4

" Set filetype stuff to on
syntax on
filetype on
filetype indent plugin on
"set ofu=syntaxcomplete#Complete
"inoremap <C-space> <C-x><C-o>

" Set default file encoding
set fileencoding=utf-8

filetype indent on

" Tabstops are 4 spaces
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set lbr
set showcmd
set showmatch
set ruler
" highlighting special symbols
set list
set list listchars=tab:▹·,trail:·,extends:»,precedes:«,nbsp:×

" backups
set nobackup
set noswapfile
set writebackup
set undofile
set undodir=~/.vim/undo
set nu!

" set allow create files and directories from vim
set modifiable
set write

" set autoread files and set curent directory
set autoread
set autochdir
set browsedir=buffer

" search
set ignorecase
set hlsearch
set incsearch

" regexp
set magic

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Set the status line the way i like it <<<
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Set the textwidth to be 80 chars
set textwidth=82
" set colorcolumn=80
set linebreak
set listchars+=precedes:<,extends:>
    

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
set number
" set relativenumber

" Make the command-line completion better
set wildmenu
set completeopt=longest,menuone,preview
set wildmode=list:longest,full
set wildignore+=.*.sw*,__pycache__,*.pyc

" set spellchacer
set spelllang=en_us

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|:nohls<cr>

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
" set nocursorline
" set nocursorcolumn

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Mouse scrolling
set mouse=a
set mousemodel=popup
set mousehide
map <S-Insert> <MiddleMouse>
"map! <S-Insert> <MiddleMouse>

" ask configuration
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Spell-checker
set wildmenu
"set wcm=<Tab>

" Spell check:
" menu SetSpell.off :set nospell<CR>
" menu SetSpell.en  :set spl=en spell<CR>
" menu SetSpell.ua  :set spl=ua spell<CR>
" menu SetSpell.ru  :set spl=ru spell<CR>

" Slow Vim
set notimeout
set ttimeout
set timeoutlen=50

"---------------------------------------------------------------------------
" MiniBufExplorer Settings
"---------------------------------------------------------------------------
"disallow more that 1 miniBufExplorer
let g:miniBufExplorerMoreThanOne = 0
" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 0
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Red

"---------------------------------------------------------------------------
" BufExplorer Settings
"---------------------------------------------------------------------------
" Do not sort in reverse order.
let g:bufExplorerReverseSort=0
" Show directories.
let g:bufExplorerShowDirectories=1
" Show relative paths.
let g:bufExplorerShowRelativePath=0
" Show unlisted buffers.
let g:bufExplorerShowUnlisted=0
" Sort by most recently used.
let g:bufExplorerSortBy='name'
" Split new window above current.
let g:bufExplorerSplitBelow=0


set switchbuf=usetab,newtab

"---------------------------------------------------------------------------
" TagBar Settings
"---------------------------------------------------------------------------
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1

"---------------------------------------------------------------------------
" MRU Settings
"---------------------------------------------------------------------------
" set max entries
let MRU_Max_Entries = 1000
" set exclude path
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" set window height
let MRU_Window_Height = 62
" set MRU in current window
let MRU_Use_Current_Window = 1
" set max MRU menu entries
let MRU_Max_Menu_Entries = 100
" set max MRUsubmenu entries
let MRU_Max_Submenu_Entries = 15

"---------------------------------------------------------------------------
" Gundo Plugin Settings
"---------------------------------------------------------------------------
let g:gundo_width = 30
let g:gundo_preview_height = 40

"---------------------------------------------------------------------------
" Neocomplcache Plugin Settings
"---------------------------------------------------------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=200
let g:neocomplcache_auto_completion_start_length=3

"Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w'
let g:neocomplcache_omni_patterns.python = '[^. *\t]\.\w'

" Required to make neocomplcache_cursor_hold_i_time work
" See https://github.com/Shougo/neocomplcache/issues/140
let s:update_time_save = &updatetime
autocmd InsertEnter * call s:on_insert_enter()

function! s:on_insert_enter()
  if &updatetime > g:neocomplcache_cursor_hold_i_time
    let s:update_time_save = &updatetime
    let &updatetime = g:neocomplcache_cursor_hold_i_time
  endif
endfunction

autocmd InsertLeave * call s:on_insert_leave()

function! s:on_insert_leave()
  if &updatetime < s:update_time_save
    let &updatetime = s:update_time_save
  endif
endfunction

"---------------------------------------------------------------------------
" SuperTab Plugin Settings
"---------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"---------------------------------------------------------------------------
" CtrlP Plugin Settings
"---------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_custom_ignore = '\.exe$\|\.so$\|\.dll$'
let g:ctrlp_custom_ignore = 'some_bad_symbolic_links' 
let g:ctrlp_user_command = 'find %s -type f'

"---------------------------------------------------------------------------
" NERD Tree Plugin Settings
"---------------------------------------------------------------------------
" Show hiden files on startup
let NERDTreeShowHidden=1
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

"---------------------------------------------------------------------------
" Keyboard shortcuts
"---------------------------------------------------------------------------
source ~/.vim/keycuts.vim

"---------------------------------------------------------------------------
" Fix constant spelling mistakes
"---------------------------------------------------------------------------
source ~/.vim/typos.vim

"---------------------------------------------------------------------------
" Set up the window colors and size
"---------------------------------------------------------------------------
source ~/.vim/gui.vim

"---------------------------------------------------------------------------
" snipMate Plugin Settings
"---------------------------------------------------------------------------
" Toggle the snipMate on an off with Tab
:filetype plugin on

"---------------------------------------------------------------------------
" Powerline Settings
"---------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

" Insert the charcode segment after the filetype segment
call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')

" Replace the scrollpercent segment with the charcode segment
call Pl#Theme#ReplaceSegment('scrollpercent', 'fileinfo')

"---------------------------------------------------------------------------
" Python Settings
"---------------------------------------------------------------------------
source ~/.vim/pysettings.vim
