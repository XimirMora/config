#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function short_wd {
	wd=$(pwd | sed 's/\/home\/gilo/~/')
	if ((${#wd} > 30)); then
		wd="${wd:0:5}...${wd:(-28)}"
	fi
	echo $wd
	}

PS1=$'\[$(tput setaf 40)\]$(short_wd)\[$(tput sgr0)\] '
TERM=xterm-256color

# aliases {{{
alias ls='ls --color=auto'
alias l='ls --color=auto -a'
alias grep='grep --color=auto'
alias vi=vim
alias size='du -h -d1 | sort -hk1,1'
# aliases }}}

# envar {{{
BROWSER=/usr/bin/google-chrome-stabel
EDITOR=/usr/bin/vim
LOADER_CONF=/boot/loader/loader.conf
# envar }}}
