#!/bin/bash
# --------------------------------------------------------------------------------------------------------- LS
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# --------------------------------------------------------------------------------------------------------- DOCKER
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drmf='docker rm -f'
alias kcontainers='docker rm -f $(docker ps -qa)'
alias kcontainers-stopped='docker ps -aq --no-trunc -f status=exited | xargs docker rm'
alias cs='cat package.json| jq .scripts' # cs .... c=see s=scripts
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias koverlaynet='docker network rm $(echo $(docker network ls -f "driver=overlay" -q))'

# --------------------------------------------------------------------------------------------------------- TMUX
alias tmuxa="tmux attach"
alias stmux="tmux source-file ~/.tmux.conf"

# --------------------------------------------------------------------------------------------------------- NETWORK
alias checkportnc="nc -zv"
alias inspectports="lsof -iTCP -sTCP:LISTEN -n -P"
# alias checkportnamo="nmap -p <port-arg> <host-arg> " <<<< how can I do these things...

# --------------------------------------------------------------------------------------------------------- GIT
# Basic log
alias log="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative" 
# Basic log with graph
alias logg="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"
# Verbose log
alias logv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"
# Verbose log with graph
alias loggv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"
# Log with full commit messages
alias logm="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --format=format:'%Creset%Cgreen%h%Creset | %C(white)%an | %C(yellow)%cr%n%Creset%s%n%n%b%n'"
# Show refs
alias refs="printf '$bldcyn' && git show-ref --abbrev && printf '$txtrst'"
# Show remote refs and urls
alias remotes="printf '$txtpur' && git remote -v && printf '$bldcyn\n' && git branch -r --no-color && printf '$txtrst'" 
alias g="git"
alias gt="git log --graph --pretty=oneline --abbrev-commit"
alias gtig="git log --graph --pretty=oneline --abbrev-commit | tig"
alias gbr="git branch"
alias gchb='git checkout -b '
alias gch='git checkout'
alias grb='git rebase'
alias gadd='git add -u'
alias gcommit='git commit'
alias gamend='git commit --amend'
alias grbmaster='git rebase origin/master'
alias gf="git fetch"
alias gfprune="git fetch -p"
alias ggmaster="git checkout master"
alias ggba='git checkout -'
alias gstatus='git status'
