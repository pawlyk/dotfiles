# ============================================================================ #
#                                HISTORY SETTINGS                              #
# ============================================================================ #
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS     # Don't save duplicate commands in sequence
setopt HIST_IGNORE_SPACE    # Don't save commands starting with a space
setopt HIST_REDUCE_BLANKS   # Remove redundant blanks
setopt SHARE_HISTORY        # Share history across tabs

# ============================================================================ #
#                                COMPLETION                                    #
# ============================================================================ #
# Add Homebrew paths for completions
fpath=(/opt/homebrew/share/zsh/site-functions /opt/homebrew/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -C # -C speeds up startup by ignoring file security checks

# Completion menu styling (to allow arrow selection)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignore case

# ============================================================================ #
#                                ALIASES                                       #
# ============================================================================ #
# Navigation and lists (eza instead of ls)
alias 'l=eza'
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --git --group-directories-first"
alias la="eza -a --icons --git --group-directories-first"
alias lla="eza -la --icons --git --group-directories-first"
alias tree='eza --tree --icons --git --group-directories-first --ignore-glob="node_modules|cache|.git"'
alias treea='eza -a --tree --icons --git --group-directories-first --ignore-glob="node_modules|cache|.git"'

alias '..=cd ..'
alias '...=cd ../..'
alias '....=cd ../../..'
alias '~=cd ~'

# Reading files (bat instead of cat)
alias cat="bat"

# Search
alias rg="rg --color=auto"

# Vim / Neovim
alias v="nvim"
alias vim="nvim"

# Play safe!
alias 'rm=rm -iv'
alias 'mv=mv -iv'
alias 'cp=cp -iv'
alias "chmod=chmod -c"
alias "chown=chown -c"

# For convenience
alias 'mkdir=mkdir -p'

# Typing errors...
alias 'cd..=cd ..'
alias 'cd~=cd ~'
alias 'sl=ls'

# ============================================================================ #
#                                PLUGINS (HOMEBREW)                            #
# ============================================================================ #
# Plugin path depends on Mac architecture (M1/M2 vs Intel)
HOMEBREW_PREFIX=$(brew --prefix)

source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================================ #
#                                TOOL INITIALIZATION                           #
# ============================================================================ #
# fzf - fuzzy history search (Ctrl+R)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# zoxide - smart cd (run with 'z' or 'zi')
eval "$(zoxide init zsh)"

# Starship - modern prompt
eval "$(starship init zsh)"
