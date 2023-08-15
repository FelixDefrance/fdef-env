# history: don't duplicate history lines and share history between shells
setopt histignorealldups sharehistory histignorespace

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

export PAGER=less
export EDITOR=vim

# Aliases

alias l='ls -lF --color=always'                            
alias ll='ls -alFh --color=always'                         
# enable ip with colors                                    
alias ip='ip -c'                                           
# Add basic aliases                                        
alias man-fr='man -L fr_FR'                                
alias o='xdg-open'                                         
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias less='less -RXSFm'                                   
alias ncdu='ncdu --color dark'
alias tailf='tail -f'                                      
alias psc='ps xawf -eo pid,user,cgroup,args'
# nice alternative to 'ls'                                 
alias tree='tree -Csu'

# colorized journalctl                                     
[ -x /usr/bin/ccze ] && alias journalctlf='journalctl -f | ccze -A'
                                                           
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
