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

unset -f goto
goto() {  # regex
	GOTO_CMDLINE="$(
		grep -iE '^\S*'"${1}" tags.xref \
			| while read IDENT TYPE LINE FILE TEXT; do
				echo "nano +${LINE} ${FILE}"
				break
			done
	)"
	echo "$GOTO_CMDLINE"
	if [ -n "$GOTO_CMDLINE" ]; then
		$GOTO_CMDLINE
	else
		echo "no matching tags found" >&2
	fi
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

unset -f huh
huh() {  # args...
	git diff "$@"
}

unset -f huhs
huhs() {  # args...
	git diff --staged "$@"
}

unset -f huhw
huhw() {  # args...
	git diff --word-diff=plain --word-diff-regex='\b\w+\b|\W' "$@"
}

unset -f k
k() {  # args...
	git status "$@"
}

unset -f red
red() {  # cmd...
	(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31;1m&\e[m,'>&2)3>&1
}

unset -f v
v() {  # [ path ]
	if [ -z "$1" ]; then
		run xdg-open .
	else
		run xdg-open "$1"
	fi
}

unset -f d
d() {
	echo 'deez nuts' | figlet -f big -w 128 | lolcat
}

unset -f dn
dn() {
	echo -e '\e[31;1;3mD\e[0m\e[33;1;3mE\e[0m\e[32;1;3mE\e[0m\e[32;3mZ\e[0m \e[36;1;3mN\e[0m\e[36;3mU\e[0m\e[34;1;3mT\e[0m\e[35;1;3mS\e[0m' >&2
}

unset -f shrink_and_archive
shrink_and_archive() {
	for f in "$@"; do
		ffmpeg -i "$f" -threads 16 -c:v h264 -preset slower -crf 25 -c:a copy "${f/%.mkv/ small.mp4}" \
			&& rm "$f" \
			|| ( (>&2 echo -e '\e[31;1mfuck:' "$f" '\e[0m'); rm "${f/%.mkv/ small.mp4}" )
	done
}
