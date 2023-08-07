# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
[ -z "$PS1" ] && return

# Source alias definitions
if [ -f $HOME/.bash_aliases ]; then source $HOME/.bash_aliases; fi
if [ -f $HOME/.bash_aliases.local ]; then source $HOME/.bash_aliases.local; fi

# Source bash completion
if [ -f /etc/bash_completion ]; then source /etc/bash_completion; fi

# Source bash custom functions
if [ -f $HOME/.bash_custom_func ]; then source $HOME/.bash_custom_func; fi
if [ -f $HOME/.bash_custom_func.local ]; then source $HOME/.bash_custom_func.local; fi

# Customize the prompt
myUID=$(id -u)
if [ "X$myUID" = "X0" ] ; then
    PS1="${RED}\u${WHITE}@${WHITE}\h${DEF}:\w${RED}# ${DEF}"
    PS2="${RED}>${DEF} "
else
    PS1="${YELLOW}\u${WHITE}@${DEF}\h${GREEN}:\w${YELLOW}\$ ${DEF}"
    PS2="${RED}>${DEF} "
fi

# Limit the path to 3 levels
PROMPT_DIRTRIM=3

# Auto-logout session...
export TMOUT=3600

# Customize history format
export HISTSIZE=10000
export HISTTIMEFORMAT="[ %d/%m/%Y %H:%M:%S ] "
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoredups
# ... and ignore somes commands
export HISTIGNORE="history*:exit:reboot:^rm:[bf]g:ls:ll:help:man:pass"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Show some logon informations
if [ "X$TERM" != "Xdumb" ]
    then
    echo_bold "User connected :"
    who
    echo ""
    echo_bold "Last connexions :"
    lastlog | egrep -v "Jamais|Never"
fi

# Show screen sessions
if ( which screen &> /dev/null )
then
  if [[ $TERM != screen* ]]
  then
    if [ "$(screen -ls | sed -ne 's/[[:space:]]//' -ne 's/(Attached)// p')" ]
    then
      echo ''
      echo_reverse 'Il existe des sessions screen attachées sur cette machine pour cet utilisateur !'
      echo ''
      screen -ls | grep "Attached" | sed -e 's/^/          /'
      echo ''
    fi
    if [ "$(screen -ls | sed -ne 's/[[:space:]]//' -ne 's/(Detached)// p')" ]
    then
      echo ''
      echo_reverse "Il existe des sessions screen détachées sur cette machine pour cet utilisateur !"
      echo ''
      screen -ls | grep "Detached" | sed -e 's/^/          /'
      echo ''
    fi
  fi
fi

# Show tmux sessions
if ( which tmux &> /dev/null )
then
  if [ $(pgrep -u "$UID" "tmux" | wc -l) -gt 0 ]
  then
    if [[ $TERM != screen* ]]
    then
      nb_sessions=$(tmux list-session | wc -l)
      nb_sessions_attached=$(tmux list-session | grep "attached" | wc -l)
      nb_sessions_detached=$(tmux list-session | grep -v "attached" | wc -l)

      echo_reverse "Found ${nb_sessions} tmux session(s)"

      echo " * ${nb_sessions_attached} attached"
      tmux list-sessions | grep "attached" | sed -e 's/^/     - /'

      echo " * ${nb_sessions_detached} detached"
      tmux list-sessions | grep -v "attached" | sed -e 's/^/     - /'

    fi
  fi
fi
