# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

export EDITOR=/usr/bin/vim

# set vi mode for zsh
bindkey -v
export KEYTIMEOUT=1

# fix to work Home/End keys in tmux
if [[ -n "$TMUX" ]]; then
    bindkey "\eOH" up-line-or-history
    bindkey "\eOF" down-line-or-history
    bindkey "\e[1~" beginning-of-line
    bindkey "\e[4~" end-of-line
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos-mod"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man colorize command-not-found compleat cp \
    dircycle extract history history-substring-search rsync safe-paste \
    #tmux tmuxinator vi-mode vundle web-search \
    tmux tmuxinator vundle web-search \
    docker git github gnu-utils go mercurial postgres redis-cli\
    gem ruby rvm \
    celery django fabric pip python virtualenv virtualenvwrapper \
    virtualenv-prompt \
    debian systemd )

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/user/.rvm/gems/ruby-2.1.2/bin:/home/user/.rvm/gems/ruby-2.1.2@global/bin:/home/user/.rvm/rubies/ruby-2.1.2/bin:/home/user/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/user/.rvm/bin:/home/user/.rvm/scripts"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.utils/aliases.zsh

# Fixes 
echo DEBIAN_PREVENT_KEYBOARD_CHANGES=yes>>~/.zshenv

export WORKON_HOME='~/.venvs'
source /usr/local/bin/virtualenvwrapper.sh

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
