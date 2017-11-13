#!/bin/sh

/usr/sbin/apache2ctl start

tmux new-session -d -s vitrivr 'bash'
tmux send-keys '/adampro/bootstrap.sh' 'C-m'
tmux select-window -t vitrivr:0
tmux split-window -v 'bash'
tmux send-keys 'cd /cineast/build/libs' 'C-m'
tmux send-keys 'sleep 30s' 'C-m'
tmux send-keys 'java -jar cineast.jar' 'C-m'
tmux send-keys 'setup' 'C-m'
tmux -2 attach-session -t vitrivr

while true ; do sleep 1m; done