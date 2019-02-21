# alias nnotesc='cat /usr/share/nixnote2/shortcuts.txt | grep'
# alias tmuxh='tmux -u new-session "cd $(pwd); exec $SHELL"'
# alias gitmux="tmux -u new-session \"cd $(pwd); watch -c -n 3 \'git graph --date-order\'; exec $SHELL\" ; split-window ; split-window ; select-layout even-vertical ; select-pane -L ;"
alias devmux="tmux new-session\; split-window -v -l 10\; select-pane -U\; split-window -h -b -l 20 \"watch -tc 'ls -A --group-directories-first --color=always | grep -v \\\"\\.swp\\\"'\"\; select-pane -R\; split-window -h"
alias qk='konsole --profile "Mint darker quad" <&- >&- 2>&- & disown'
alias ccwhirl='CC="cc -fdiagnostics-color" whirl'
