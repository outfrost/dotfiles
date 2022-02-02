alias devmux="tmux new-session\; split-window -v -l 10\; select-pane -U\; split-window -h -b -l 20 \"watch -tc 'ls -A --group-directories-first --color=always | grep -v \\\"\\.swp\\\"'\"\; select-pane -R\; split-window -h"
alias wmux="tmux new-session\; split-window -v -l 16\; select-pane -U\; split-window -h"
alias qk='konsole --profile "Outfrost quad" <&- >&- 2>&- & disown'
alias lsb='lsblk -o NAME,RM,SIZE,MOUNTPOINT,FSTYPE,LABEL'
alias umsshfs='fusermount3 -u'

# Until Konsole gets its shit together, no icons
alias ll='lsd -al --icon never'
alias la='lsd -A --icon never'
alias l='lsd -aF --icon never'

unset -f dotfiles
dotfiles() {  # args...
	/usr/bin/git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" "$@"
}

# Shorthand clone from AUR
unset -f aur
aur () {  # name
	git clone "https://aur.archlinux.org/${1}.git"
}

unset -f wat
wat() {  # regex... path
	grep --color=always -nRE "$@" | less -R
}

unset -f mkcd
mkcd() {  # path...
	mkdir -p "$@"
	cd "${!#}"
}

unset -f cdb
cdb() {
	cd -
}

unset -f fzn
fzn() {
	nano $(while filename="$(fzf)"; do echo "$filename"; done | tee /dev/stderr)
}

unset -f bzz
bzz() {
	bat $(while filename="$(fzf)"; do echo "$filename"; done)
}

unset -f fzx
fzx() {
	filename="$(fzf)"
	echo "$filename"
	echo -n "$filename" | xclip
}

unset -f run
run() {  # command args...
	nohup "$@" >/dev/null 2>&1 &
}

unset -f lk
lk() {
	clear
	( echo ' '
	  echo ' '
	  echo '.*+^ moe moe kyun~ ^+*.' ) | toilet -t -f ascii12 | lolcat
	xtrlock
}

unset -f gti
gti() {
	echo "bruh" >&2
}

unset -f k
k() {  # args...
	git status "$@"
}

unset -f huh
huh() {  # args...
	git diff "$@"
}

unset -f v
v() {  # [ path ]
	if [ -z "$1" ]; then
		run xdg-open .
	else
		run xdg-open "$1"
	fi
}
