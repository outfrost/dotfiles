#
# ~/.bash_profile
#

[ -r ~/.profile ] && . ~/.profile

# Start ssh-agent
[ -x /usr/bin/ssh-agent ] && [ -z "$SSH_AGENT_PID" ] && eval $(/usr/bin/ssh-agent -s) >/dev/null

[ -r ~/.bashrc ] && . ~/.bashrc
