#!/bin/sh
tmux new-session -d -s python-devel
tmux new-window -t python-devel:1 -n 'code'
tmux splitw -h -p 50 'vim'
tmux selectp -t 1

tmux new-window -t python-devel:2 -n 'consols'
tmux splitw -h -p 50
tmux selectp -t 0
tmux splitw -v -p 50
tmux selectp -t 2

tmux select-window -t python-devel:1
tmux -2 attach-session -t python-devel
