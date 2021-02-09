alias lsb='lsblk -o NAME,RM,SIZE,MOUNTPOINT,FSTYPE,LABEL'
alias umsshfs='fusermount3 -u'

alias ll='ls -al'
alias la='ls -A'
alias l='ls -aF'

unset -f dotfiles
dotfiles() {  # args...
	/usr/bin/git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" "$@"
}

unset -f wat
wat() {  # regex... path
	grep --color=always --exclude-dir='.git' -IinRE "$@" | less -FRX
}

unset -f watr
watr() {  # regex... path
	grep --color=always --exclude-dir='.git' --exclude-from=.ignore -IinRE "$@" | less -FRX
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

unset -f tag
tag() {  # regex
	grep -iE '^\S*'"${1}" tags.xref \
		| while read IDENT TYPE LINE FILE TEXT; do
			echo -e "${FILE}:${LINE}"
			echo -e "\t\t${TEXT}" | bat -l c++ -pp
		done
}

unset -f run
run() {  # command args...
	nohup "$@" >/dev/null 2>&1 &
}

unset -f gti
gti() {
	echo "bruh" >&2
}

unset -f huh
huh() {  # args...
	git diff "$@"
}

unset -f huhs
huhs() {  # args...
	git diff --staged "$@"
}

unset -f k
k() {  # args...
	git status "$@"
}

# ###
# wsl nonsense
# ###
unset -f git
git() {
	case "$PWD" in
		/mnt/*)
			/mnt/c/Program\ Files/Git/bin/git.exe "$@"
			;;
		*)
			/usr/bin/git "$@"
			;;
	esac
}

unset -f cmd.exe
cmd.exe() {
	/mnt/c/Windows/SysWOW64/cmd.exe "$@"
}

unset -f py.exe
py.exe() {
	/mnt/c/Windows/py.exe "$@"
}

unset -f mssql-cli
mssql-cli() {  # args...
	/mnt/c/Program\ Files/Python39/python.exe -m mssqlcli.main "$@"
}
