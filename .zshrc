# .zshrc
# Author: Paul Stadnikov <paul.stadnikov@gmail.com>
# Based on configurations created 
# Piotr Karbowski <piotr.karbowski@gmail.com>
# Andriy Senkovych <jolly_roger@itblog.org.ua> https://github.com/jollyroger/config 
# License: BSD
# zsh-copletions from here https://github.com/zsh-users/zsh-completions.git
#rm ~f -f ~/.zsh/.zcompdump; compinit

# Basic zsh config.
#ZDOTDIR=${ZDOTDIR:-${HOME}}
ZDOTDIR="${HOME}/.zsh"
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"

export TERM=xterm-256color

# Colors.
autoload colors
colors

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

# Functions
if [ -f '/etc/profile.d/prll.sh' ]; then
. "/etc/profile.d/prll.sh"
fi

ewarn() { echo -e "\033[1;33m>>> \033[0m$@"; }

over_ssh() {
if [ -n "${SSH_CLIENT}" ]; then
return 0
else
return 1
fi
}

reload () {
          exec "${SHELL}" "$@"
}

confirm() {
local answer
echo -ne "zsh: sure you want to run '${YELLOW}$@${NC}' [yN]? "
read -q answer
echo
if [[ "${answer}" =~ ^[Yy]$ ]]; then
command "${=1}" "${=@:2}"
else
return 1
fi
}

confirm_wrapper() {
if [ "$1" = '--root' ]; then
local as_root='true'
shift
fi

local runcommand="$1"; shift

if [ "${as_root}" = 'true' ] && [ "${USER}" != 'root' ]; then
runcommand="sudo ${runcommand}"
fi
confirm "${runcommand}" "$@"export TERM=xterm-256color
}

poweroff() { confirm_wrapper --root $0 "$@"; }
reboot() { confirm_wrapper --root $0 "$@"; }
hibernate() { confirm_wrapper --root $0 "$@"; }

detox() {
if [ "$#" -ge 1 ]; then
confirm detox "$@"
else
command detox "$@"
fi
}

has() {
local string="${1}"
shift
local element=''
for element in "$@"; do
if [ "${string}" = "${element}" ]; then
return 0
fi
done
return 1
}

begin_with() {
local string="${1}"
shift
local element=''
for element in "$@"; do
if [[ "${string}" =~ "^${element}" ]]; then
return 0
fi
done
return 1

}

termtitle() {
case "$TERM" in
rxvt*|xterm|xterm-256color|nxterm|gnome|screen|screen-*)
case "$1" in
precmd)
print -Pn "\e]0;%n@%m: %~\a"
;;
preexec)
zsh_cmd_title="$2"
# Escape '\' char.
zsh_cmd_title="${zsh_cmd_title//\\/\\\\}"
# Escape '$' char.
zsh_cmd_title="${zsh_cmd_title//\$/\\\\\$}"
# Escape '%' char.
#zsh_cmd_title="${zsh_cmd_title//%/\%\%}"
# As I am unable to deal with all %, especialy
# the nasted one, I will just strip this char.
zsh_cmd_title="${zsh_cmd_title//\%/<percent>}"
print -Pn "\e]0;${zsh_cmd_title} [%n@%m: %~]\a"
;;
esac
;;
esac
}

git_check_if_worktree() {
# This function intend to be only executed in chpwd().
# Check if the current path is in git repo.

# We would want stop this function, on some big git repos it can take some time to cd into.
if [ -n "${skip_zsh_git}" ]; then
git_pwd_is_worktree='false'
return 1
fi
# The : separated list of paths where we will run check for git repo.
# If not set, then we will do it only for /root and /home.
if [ "${UID}" = '0' ]; then
# running 'git' in repo changes owner of git's index files to root, skip prompt git magic if CWD=/home/*
git_check_if_workdir_path="${git_check_if_workdir_path:-/root}"
else
git_check_if_workdir_path="${git_check_if_workdir_path:-/home}"
git_check_if_workdir_path_exclude="${git_check_if_workdir_path_exclude:-${HOME}/_sshfs}"
fi

if begin_with "${PWD}" ${=git_check_if_workdir_path//:/ }; then
if ! begin_with "${PWD}" ${=git_check_if_workdir_path_exclude//:/ }; then
local git_pwd_is_worktree_match='true'
else
local git_pwd_is_worktree_match='false'
fi
fi

if ! [ "${git_pwd_is_worktree_match}" = 'true' ]; then
git_pwd_is_worktree='false'
return 1
fi

# todo: Prevent checking for /.git or /home/.git, if PWD=/home or PWD=/ maybe...
# damn annoying RBAC messages about Access denied there.
if [ -d '.git' ] || [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
git_pwd_is_worktree='true'
git_worktree_is_bare="$(git config core.bare)"
else
unset git_branch git_worktree_is_bare
git_pwd_is_worktree='false'
fi
}

git_branch() {
git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
git_branch="${git_branch##*/}"
git_branch="${git_branch:-no branch}"
}

#git_dirty() {
#if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status --untracked-files='no' --porcelain)" ]; then
#git_dirty='%F{green}*'
#else
#unset git_dirty
#fi
#}

git_dirty() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status --untracked-files='no' --porcelain)" ]; then
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
git_dirty="$STATUS"
else
unset git_dirty
fi
}

precmd() {
# Set terminal title.
termtitle precmd

if [ "${git_pwd_is_worktree}" = 'true' ]; then
git_branch
git_dirty

git_prompt=" %F{blue}[%F{253}${git_branch}${git_dirty}%F{blue}]"
else
unset git_prompt
fi
}

preexec() {
# Set terminal title along with current executed command pass as second argument
termtitle preexec "${(V)1}"
}

chpwd() {
git_check_if_worktree
}

# Are we running under grsecurity's RBAC?
rbac_auth() {
local auth_to_role='admin'
if [ "${USER}" = 'root' ]; then
if ! grep -qE '^RBAC:' "/proc/self/status" && command -v gradm > /dev/null 2>&1; then
echo -e "\n${BLUE}*${NC} ${GREEN}RBAC${NC} Authorize to '${auth_to_role}' RBAC role."
gradm -a "${auth_to_role}"
fi
fi
}
#rbac_auth

# Le features!
# extended globbing, awesome!
setopt extendedGlob

# zmv - a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Include user-specified configs.
if [ ! -d "${ZSHDDIR}" ]; then
mkdir -p "${ZSHDDIR}" && echo "# Put your user-specified config here." > "${ZSHDDIR}/example.zsh"
fi

for zshd in $(ls -A ${HOME}/.config/zsh.d/^*.(z)sh$); do
. "${zshd}"
done

# Completion.
#path=(~/.zsh-completions/src $path)
fpath=("${ZDOTDIR}/zsh-completions/src" $fpath)
 
autoload -U promptinit
promptinit
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# If running as root and nice >0, renice to 0.
if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
fi

# Fancy prompt.
if over_ssh && [ -z "${TMUX}" ]; then
prompt_is_ssh='%F{blue}[%F{red}SSH%F{blue}] '
elif over_ssh; then
prompt_is_ssh='%F{blue}[%F{253}SSH%F{blue}] '
else
unset prompt_is_ssh
fi

case $USER in
root)
PROMPT='[%{${fg[red]}%}%n%{${reset_color}%}@%{${fg[blue]}%}%m%{${reset_color}%}:%{${fg[cyan]}%}%1~%{${reset_color}%}]${git_prompt}%F{cyan} %# %b%f%k'
RPROMPT='[%{${fg[cyan]}%}%*%{${reset_color}%}]'

;;

*)
PROMPT='[%{${fg[green]}%}%n%{${reset_color}%}@%{${fg[blue]}%}%m%{${reset_color}%}:%{${fg[cyan]}%}%1~%{${reset_color}%}]${git_prompt}%F{cyan} %# %b%f%k'
RPROMPT='[%{${fg[cyan]}%}%*%{${reset_color}%}]'

;;
esac

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Appends every command to the history file once it is executed
setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

# Shell config.
umask 077
if ! [[ "${PATH}" =~ "^${HOME}/bin" ]]; then
export PATH="${HOME}/bin:${PATH}"
fi

# Not all servers have terminfo for rxvt-256color. :<
if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ]; then
export TERM='rxvt-unicode'
fi

export EDITOR="/usr/bin/vim"
export TMP="$HOME/.tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"

if [ ! -d "${TMP}" ]; then mkdir "${TMP}"; fi

# Aliases
. "${ZDOTDIR}/zsh_aliases"

# Keys.
case $TERM in
rxvt*|xterm*)
bindkey "^[[7~" beginning-of-line #Home key
bindkey "^[[8~" end-of-line #End key
bindkey "^[[3~" delete-char #Del key
bindkey "^[[A" history-beginning-search-backward #Up Arrow
bindkey "^[[B" history-beginning-search-forward #Down Arrow
bindkey "^[Oc" forward-word # control + right arrow
bindkey "^[Od" backward-word # control + left arrow
bindkey "^H" backward-kill-word # control + backspace
bindkey "^[[3^" kill-word # control + delete
;;

linux)
bindkey "^[[1~" beginning-of-line #Home key
bindkey "^[[4~" end-of-line #End key
bindkey "^[[3~" delete-char #Del key
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
;;

screen|screen-*)
bindkey "^[[1~" beginning-of-line #Home key
bindkey "^[[4~" end-of-line #End key
bindkey "^[[3~" delete-char #Del key
bindkey "^[[A" history-beginning-search-backward #Up Arrow
bindkey "^[[B" history-beginning-search-forward #Down Arrow
bindkey "^[Oc" forward-word # control + right arrow
bindkey "^[Od" backward-word # control + left arrow
bindkey "^H" backward-kill-word # control + backspace
bindkey "^[[3^" kill-word # control + delete
;;
esac

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

if [ -f ~/.alert ]; then cat ~/.alert; fi

# set PYTHONPATH 
export PYTHONPATH='/usr/share/pyshared;/usr/share/pyshared-data;/usr/share/python;/usr/locale/lib/python2.7;/usr/lib/pymodules/python2.7;/usr/local/lib/python2.7/dist-packages;/usr/local/bin;'

# Load RVM function

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p194/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
