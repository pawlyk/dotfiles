# My dotfiles

This repo contains my personal settings files for vim, zsh, git, tmux.

#### Based on several configurations

* Piotr Karbowski https://github.com/slashbeast/things
* Andriy Senkovych https://github.com/jollyroger/config

## Installation

1. Install requarements
    - install ack `sudo apt-get install ack-grep`;
    - install ctags `sudo apt-get install ctags`;
    - install custom Menlo font for Powerline from `fonts` directory;
2. Backup your dot files.
3. Clone repository `git clone https://github.com/pawlyk/dotfiles.git ~/`.
4. Install Vundle `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`.
5. Run vim and execute command `:BundleInstall` in vim.
6. Install tmux-powerline `git clone git://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline/`.
7. Edit file `~/.tmux/tmux-powerline/themes/default.sh` to customize look and feel.
8. Clone necessary plugins from zsh from https://github.com/zsh-users/ and add them to `.zshrc` (line 373).
9. Enjoy.


## Screenshots

**tmux+zsh+vim**

[![terminal](https://github.com/pawlyk/dotfiles/raw/master/screenshots/screenshot.png)](https://github.com/pawlyk/dotfiles/raw/master/screenshots/screenshot.png)


## Used plugins

### Tmux
* tmux-powerline https://github.com/erikw/tmux-powerline

### Vim 
* Vundle https://github.com/gmarik/vundle
* ctrlp https://github.com/kien/ctrlp.vim
* ctrlp-cmatcher https://github.com/JazzCore/ctrlp-cmatcher
* vim-indent-guides https://github.com/mutewinter/vim-indent-guides
* vim-powerline https://github.com/Lokaltog/vim-powerline
* nerdtree https://github.com/scrooloose/nerdtree
* tagbar https://github.com/majutsushi/tagbar
* bufexplorer https://github.com/c9s/bufexplorer
* minibufexpl https://github.com/fholgado/minibufexpl.vim
* mru http://www.vim.org/scripts/script.php?script_id=521
* colorv https://github.com/Rykka/colorv.vim
* vim-todo https://github.com/codegram/vim-todo
* undotree https://github.com/mbbill/undotree
* editorconfig-vim https://github/editorconfig/editorconfig-vim
* vim-gitgutter https://github.com/airblade/vim-gitgutter
* Rainbow-parentheses-improved https://github.com/vim-scripts/Rainbow-Parentheses-Improved-and2
* nerdcommenter https://github.com/scrooloose/nerdcommenter
* vim-fugitive'https://github.com/tpope/vim-fugitive
* ack https://github.com/mileszs/ack.vim
* zencoding-vim https://github.com/mattn/zencoding-vim
* delimitMate https://github.com/Raimondi/delimitMate
* syntastic https://github.com/scrooloose/syntastic
* MatchTag https://github.com/gregsexton/MatchTag
* vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
* vim-surround https://github.com/tpope/vim-surround
* neocomplcache https://github.com/Shougo/neocomplcache
* neosnippet https://github.com/Shougo/neosnippet
* vim-snippets https://honza/vim-snippets
* vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
* matchit http://www.vim.org/scripts/script.php?script_id=39
* tlib_vim https://github.com/tomtom/tlib_vim
* vcscommand https://github.com/vcscommand.vim
* python-mode https://github.com/klen/python-mode
* vim-pony https://github.com/rainerborene/vim-pony
* pydoc.vim https://github.com/vim-scripts/pydoc.vim
* vim-flake8 https://github.com/vim-scripts/vim-flake8
* pythoncomplete https://github.com/mjbrownie/pythoncomplete.vim
* VimPdb https://github.com/ethanrublee/VimPdb
* vim-ruby https://github.com/vim-ruby/vim-ruby
* jedi-vim https://github.com//davidhalter/jedi-vim
* vim-haml https://github.com/tpope/vim-haml
* vim-rails https://github.com/tpope/vim-rails
* vim-rake https://github.com/tpope/vim-rake
* vim-bundler https://github.com/tpope/vim-bundler
* vim-rvm https://github.com/tpope/vim-rvm
* vim-padrino https://github.com/spllr/vim-padrino
* vim-javascript https://github.com/pangloss/vim-javascript
* vim-coffee-script https://github.com/kchmck/vim-coffee-script
* vim-json https://github.com/leshill/vim-json
* vim-jquery https://github.com/itspriddle/vim-jquery
* vim-handlebars https://github.com/nono/vim-handlebars
* nginx https://github.com/mutewinter/nginx.vim
* Better-CSS-Syntax-for-Vim https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim
* vim-css-color https://github.com/ap/vim-css-color
* vim-tmux https://github.com/acustodioo/vim-tmux
* vim-markdown https://github.com/hallison/vim-markdown
* vim-less https://github.com/groenewege/vim-less
* xhtml http://www.vim.org/scripts/script.php?script_id=1236 
* mustache https://github.com/juvenn/mustache.vim
* sql  http://www.vim.org/scripts/script.php?script_id=498
* SQLCompleteBundle http://www.vim.org/scripts/script.php?script_id=1572
* xoria256 https://github.com/vim-scripts/xoria256.vim

### Zsh 
* zsh-completions https://github.com/zsh-users/zsh-completions
* zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
* zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting
