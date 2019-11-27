alias devmux="tmux new-session\; split-window -v -l 10\; select-pane -U\; split-window -h -b -l 20 \"watch -tc 'ls -A --group-directories-first --color=always | grep -v \\\"\\.swp\\\"'\"\; select-pane -R\; split-window -h"
alias wmux="tmux new-session\; split-window -v -l 16\; select-pane -U\; split-window -h"
alias qk='konsole --profile "Outfrost quad" <&- >&- 2>&- & disown'
alias lsb='lsblk -o NAME,RM,SIZE,MOUNTPOINT,FSTYPE,LABEL'
alias umsshfs='fusermount3 -u'

alias ll='lsd -al'
alias la='lsd -A'
alias l='lsd -aF'

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
	cd "$OLDPWD"
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

unset -f lk
lk() {
	clear
	( echo ' '
	  echo ' '
	  echo '.*+^ moe moe kyun~ ^+*.' ) | toilet -t -f ascii12 | lolcat
	xtrlock
}

unset -f snapshot_unzip
snapshot_unzip() {  # path
	d="$(echo $1 | sed -E s/.zip$//)"; mkdir "$d" && unzip "$1" -d "$d";
}
