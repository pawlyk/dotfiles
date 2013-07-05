" How to install
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" $ :BundleInstall
" $ sudo apt-get install ack-grep
" install Custom Menlo font for Powerline from https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts 
"---------------------------------------------------------------------------
" Vundle
"---------------------------------------------------------------------------

autocmd! BufWritePost .vimrc source %
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
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'c9s/bufexplorer'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'mru.vim'
Bundle 'Rykka/colorv.vim'
Bundle 'codegram/vim-todo'
Bundle 'mbbill/undotree'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
"Bundle 'ervandew/supertab'
"Bundle 'ervandew/snipmate.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-surround'
" Snippets
"Bundle 'garbas/vim-snipmate'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
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
"Bundle 'klen/python-mode'
Bundle 'rainerborene/vim-pony'
Bundle 'vim-scripts/pydoc.vim'
"Bundle 'vim-scripts/vim-flake8'
Bundle 'mjbrownie/pythoncomplete.vim'
"Bundle 'ethanrublee/VimPdb'
Bundle 'davidhalter/jedi-vim'
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rvm'
"Bundle 'spllr/vim-padrino'
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
Bundle 'juvenn/mustache.vim'
Bundle 'sql.vim'
Bundle 'SQLComplete.vim'
" Color themes
Bundle 'vim-scripts/xoria256.vim'
"Bundle 'altercation/vim-colors-solarized'

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
set encoding=utf-8

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
"set listchars=eol:␤,tab:▹·,trail:·,extends:»,precedes:«,nbsp:×
set listchars=tab:▹·,trail:·,extends:»,precedes:«,nbsp:×,eol:¬
"set list

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
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

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
set wrap 
set linebreak
set breakat=\ |@-+;:,./?^I
set textwidth=80
set wrapmargin=0
set colorcolumn=80
set columns=86
"match ErrorMsg '\%>80v.\+'
set listchars+=precedes:<,extends:>
"set wrap
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"set formatoptions=qrn1
set formatoptions=cqrnt1

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
set number
" set relativenumber

" Make the command-line completion better
set wildmenu
"set completeopt=longest,menuone,preview
" set completion options
set completeopt=menu,menuone,longest
" limit popup menu height
set pumheight=15
set wildmode=list:longest,full
set wildignore+=.*.sw*,__pycache__,*.pyc

" set spellchacer
set spelllang=en_us

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
" set nocursorline
" set nocursorcolumn

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
" Plugins shortcuts
"---------------------------------------------------------------------------
source ~/.vim/plugins.vim

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
" Python Settings
"---------------------------------------------------------------------------
source ~/.vim/pysettings.vim
