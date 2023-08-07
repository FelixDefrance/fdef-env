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

netinfo(){
    echo "Internal IPv4 address: "; ip a | grep 'inet\ ' | grep -v 127 | awk -F " " '{print $NF, $2}'
    echo "External IPv4 address: "; wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' | sed 's/<\/body><\/html>//'
}

CT_start(){
    local CT_chroot=$1
    sudo iptables -t nat -I POSTROUTING -s 192.168.10.0/24 -j MASQUERADE
    sudo echo 1 >  /proc/sys/net/ipv4/ip_forward
    sudo systemd-nspawn -bD /var/lib/machines/$CT_chroot --network-bridge=br0
}

CT_list(){
    sudo ls /var/lib/machines
}
