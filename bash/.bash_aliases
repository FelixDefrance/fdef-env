#enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi
alias l='ls -lF --color=always'
alias ll='ls -alFh --color=always'

# enable ip with colors
alias ip='ip -c'

# colorized journalctl
[ -x /usr/bin/ccze ] && alias journalctlf='journalctl -f | ccze -A'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#
alias man-fr='man -L fr_FR'
alias o='xdg-open'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias less='less -RXSFm'
alias gitg='git log --all --decorate --graph  --oneline'
alias ncdu='ncdu --color dark'

alias psc='ps xawf -eo pid,user,cgroup,args'

# nice alternative to 'ls'
alias tree='tree -Csu'



#ANSI CODES
#Code	Effect
#0	All attributes off
#1	Bold
#2	Faint
#3	Italic
#4      Underline
#5	Blink
#6	Rapid blink
#7	Reverse video
#8	Concealed
#30	Black foreground
#31	Red foreground
#32	Green foreground
#33	Yellow foreground
#34	Blue foreground
#35	Magenta foreground
#36	Cyan foreground
#37	White foreground
#40	Black background
#41	Red background
#42	Green background
#43	Yellow background
#44	Blue background
#45	Magenta background
#46	Cyan background
#47	White background
#48	Subscript
#49	Superscript

#T_ROWS=`tput lines`        #  Define current terminal dimension
#T_COLS=`tput cols`         #+ in rows and columns.
#_UNDERLINE_ON=`tput smul`   # turn on underline
#_UNDERLINE_OFF=`tput rmul`  # turn off underline
#tput setf 4	# tput setf {fg color number}
#tput setb 2	# tput setb {bg color number}

#tput bold - Bold effect
#tput tsmi - Italic
#tput rev - Display inverse colors
#tput sgr0 - Reset everything

default='\E[39;49;00m'
bold='\E[1m'
italic='\E[3m'
underline='\E[4m'
blink='\E[5m'

blackonwhite='\E[30;47m'

#reset=`escape 0m`
#black='\E[30;47m'
#red='\E[31;47m'
#green='\E[32;47m'
#yellow='\E[33;47m'
#blue='\E[34;47m'
#magenta='\E[35;47m'
#cyan='\E[36;47m'
#white='\E[37;47m'
#bold_on=`escape 1m`
#bold_off=`escape 22m`
#blink_on=`escape 5m`
#blink_off=`escape 25m`

# Define color aliases
RED="\[\e[0;31m\]"
BLUE="\[\e[0;34m\]"
GRAY="\[\e[0;30m\]"
WHITE="\[\e[1;37m\]"
YELLOW="\[\e[1;33m\]"
BLACK="\[\e[0;34m\]"
CYAN="\[\e[0;36m\]"
PURPLE="\[\e[0;35m\]"

LIGHTGRAY="\[\e[1;37m\]"
DARKGRAY="\[\e[1;30m\]"
LIGHTBLUE="\[\e[1;34m\]"
LIGHTGREEN="\[\e[1;32m\]"
LIGHTCYAN="\[\e[1;36m\]"
LIGHTRED="\[\e[1;31m\]"
LIGHTPURPLE="\[\e[1;35m\]"
DEF="\[\033[00m\]"
