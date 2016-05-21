# My dotfiles

This repo contains my personal settings files for vim, zsh, git, tmux.

#### Based on several configurations

* Piotr Karbowski https://github.com/slashbeast/things
* Andriy Senkovych https://github.com/jollyroger/config

## Installation

1. Install requarements
    - install ack `$ sudo apt-get install ack-grep`;
    - install ctags `$ sudo apt-get install ctags`;
    - install patched powerline fonts `https://github.com/powerline/fonts`;
2. Backup your dot files.
3. Clone repository `$ git clone https://github.com/pawlyk/dotfiles.git ~/`.
4. Install Vundle `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`.
5. Run vim and execute command `:PluginInstall` in vim.
6. Install tmux-powerline `$ git clone git://github.com/erikw/tmux-powerline.git ~/.tmux/tmux-powerline/`.
7. Edit file `$ vim ~/.tmux/tmux-powerline/themes/default.sh` to customize look and feel.
8. Enjoy.


## Screenshots

**tmux+zsh+vim**

[![terminal](https://github.com/pawlyk/dotfiles/raw/master/screenshots/screenshot.png)](https://github.com/pawlyk/dotfiles/raw/master/screenshots/screenshot.png)


## Used plugins

### Tmux
* tmux-powerline https://github.com/erikw/tmux-powerline

### Vim 
* see .vimrc
### Zsh 
* oh-my-zsh http://ohmyz.sh/
