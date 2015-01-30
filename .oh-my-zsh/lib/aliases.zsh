# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias '..=cd ..'
alias '...=cd ../..'
alias '....=cd ../../..'
alias '~=cd ~'
alias -- -='cd -'

# Super user
alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias 'l=ls'
alias 'll=ls -lh'
alias 'la=ls -ah'
alias 'lla=ls -alh'
alias 'lq=ls -Q'
alias 'lr=ls -R'
alias 'lrs=ls -lrS'
alias 'lt=ls -lrt'
alias 'lrta=ls -lrtA'
alias 'lrth=ls -lrth'
alias 'lrtha=ls -lrthA'
alias 'ls=ls --color=auto --human-readable --group-directories-first --classify'

alias afind='ack-grep -il'

# other
alias 'tf=tail -f'
alias 'grep=grep --colour=auto'
alias 'fgrep=grep -F --color=auto'
alias 'egrep=grep -E --colour=auto'
alias 'ack=ack-grep'
alias 'vnice=nice -n 20 ionice -c 3'
alias 'get_iplayer=get_iplayer --nopurge'

# tree
alias "tree=tree -A -I 'CVS|*~'"
alias "treea=tree -a"
alias "treed=tree -a -I '*~|*.png|*.jpg|*.jpeg|*.gif|*.bmp|*.ps|*.pdf|*.tar.gz|*.tgz|*.zip|*.rar|*.rar|.git|.idea|*.swp|*.pyc'"
alias "treedr=tree -a -I '*~|*.png|*.jpg|*.jpeg|*.gif|*.bmp|*.ps|*.pdf|*.tar.gz|*.tgz|*.zip|*.rar|*.rar|.git|.gitkeep|.idea|.redcar|bin|bundler_stubs|tmp|*.swp|*.pyc|'"

# rsync
alias 'rcp=rsync -v --progress'
alias 'rmv=rsync -v --progress --remove-source-files'

# add xoria256 theme to mc
alias 'mc=mc -S xoria256'

if command -v colordiff > /dev/null 2>&1; then
alias "diff=colordiff -Nuar"
else
alias "diff=diff -Nuar"
fi

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

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'

# Automatically background processes (no output to terminal etc)
alias 'z=echo $RANDOM > /dev/null; zz'
zz () {
    echo $*
    $* &> "/tmp/z-${1:gs/\//_}-$RANDOM" &!
}

# Userful aliases

# Tmux
alias 'ltmux=if tmux has; then tmux attach; else tmux new; fi'
alias 'dtmux=sh ~/.tmux/dtmux.sh'
alias 'rtmux=sh ~/.tmux/rtmux.sh'
alias 'ptmux=sh ~/.tmux/ptmux.sh'

# rails
alias 'rg=rails generate'
alias 'rc=rails console'
alias 'rs=rails server'
alias 'rsd=rails server --debugger'
alias 'rn=rails new'
alias 'rdb=rails dbconsole'

alias 'ra=rails application'
alias 'rd=rails destroy'
alias 'rb=rails benchmarker'
alias 'rpr=rails profiler'
alias 'rpl=rails plugin'
alias 'rr=rails runner'

alias 'rga=rails generate assets'
alias 'rgc=rails generate controller'
alias 'rgg=rails generate generator'
alias 'rgh=rails generate helper'
alias 'rgit=rails generate integration_test'
alias 'rgml=rails generate mailer'
alias 'rgmg=rails generate migration'
alias 'rgm=rails generate model'
alias 'rgo=rails generate observer'
alias 'rgpt=rails generate performance_test'
alias 'rgr=rails generate resource'
alias 'rgs=rails generate scaffold'
alias 'rgsc=rails generate scaffold_controller'
alias 'rgsm=rails generate session_migration'
alias 'rgt=rails generate task'
alias 'rgca=rails generate coffee:assets'
alias 'rgjq=rails generate jquery:assets'
alias 'rgjs=rails generate js:assets'

# rake
alias 'rdm=rake db:migrate'
alias 'rdr=rake db:rollback'

# bundler
alias 'be=bundle exec'
alias 'bi=bundle install'
alias 'bu=bundle update'
