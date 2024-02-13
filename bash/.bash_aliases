#!/bin/bash
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drmf='docker rm -f'
alias kcontainers='docker rm -f $(docker ps -qa)'
alias kcontainers-stopped='docker ps -aq --no-trunc -f status=exited | xargs docker rm'
alias cs='cat package.json| jq .scripts' # cs .... c=see s=scripts
alias godev="cd ~/dev/"
alias aprettyjson="json | pygmentize -l json"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias stopjenkins="sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist"
# alias koverlaynet='docker network rm $(echo $(docker network ls -f "driver=overlay" -q))'
# alias udockerenv='eval $(docker-machine env)'
# alias pdockerenv="docker-machine env"
# alias cdefaultdockermachine="docker-machine create -d virtualbox --virtualbox-memory 4096 default"
# alias unsetdockermachine="unset ${!DOCKER_*}"
# --------------------------------------------------------------------------------------------------------- TMUX
alias tmuxa="tmux attach"
alias etmux="sublime ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"
# --------------------------------------------------------------------------------------------------------- NETWORK
alias checkportnc="nc -zv"
alias inspectports="lsof -iTCP -sTCP:LISTEN -n -P"
#   alias checkportnamo="nmap -p <port-arg> <host-arg> " <<<< how can I do these things...
# --------------------------------------------------------------------------------------------------------- GIT
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
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
# alias gc="gitk"
# alias gca='gitk --all'
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
alias cvirtualenv="basename `echo $VIRTUAL_ENV`"
export VCXPOOL_DIR="~/.indy_client/pool/pool1"
alias walletclean="wallet-delete -f vcxs* & wallet-delete -f dummy* & wallet-delete -f forward* & wallet-delete -f vcxapi* & wallet-delete -f test* ; wallet-list"
alias cdindyclient="cd ~/.indy_client"
alias dummywipe="wallet-delete -f dummy_* && wallet-delete -f forward*"
alias indypool="docker rm -f indypool ||:; docker run --name indypool -p 9701-9708:9701-9708 -d docker.io/pstas/indypool-localhost:1.15.0-localhost"
alias stop-indypool="docker rm -f indypool"
alias indypool-printgenesis="docker exec indypool cat '/var/lib/indy/sandbox/pool_transactions_genesis'"
alias pool1-localhost=" rm -r ~/.indy_client/pool/pool1; cp -r ~/.indy_client/pool/localhost ~/.indy_client/pool/pool1; mv ~/.indy_client/pool/pool1/localhost.txn ~/.indy_client/pool/pool1/pool1.txn"
alias pool1-absanet="   rm -r ~/.indy_client/pool/pool1; cp -r ~/.indy_client/pool/absadocker ~/.indy_client/pool/pool1; mv ~/.indy_client/pool/pool1/absadocker.txn ~/.indy_client/pool/pool1/pool1.txn"
alias pool1-stagingnet="rm -r ~/.indy_client/pool/pool1; cp -r ~/.indy_client/pool/SOVRIN_STAGINGNET ~/.indy_client/pool/pool1; mv ~/.indy_client/pool/pool1/SOVRIN_STAGINGNET.txn ~/.indy_client/pool/pool1/pool1.txn"
alias pool1-miro-stagingnet="rm -r ~/.indy_client/pool/pool1; cp -r ~/.indy_client/pool/MIRO_STAGINGNET ~/.indy_client/pool/pool1; mv ~/.indy_client/pool/pool1/MIRO_STAGINGNET.txn ~/.indy_client/pool/pool1/pool1.txn"
alias pool1cat="cat $VCXPOOL_DIR/pool1.txn"
alias pool1rm="rm -r $VCXPOOL_DIR"
#alias tfubuntussh="ssh ubuntu@`cat terraform.tfstate |  jq -r '.resources[]  | select(.type == \"aws_instance\") | .instances[0].attributes.public_ip'`"
alias tfec2printip="cat terraform.tfstate |  jq -r '.resources[]  | select(.type == \"aws_instance\") | .instances[0].attributes.public_ip'"
alias gitx="open -a GitX ."
alias gitg="/Applications/GitHub\ Desktop.app/Contents/MacOS/GitHub\ Desktop"
alias restart-redis="docker rm -f redis ||:; docker run --platform linux/amd64 --name redis -p 6379:6379 -d ghcr.io/absaoss/vcxagencynode/vcxagency-redis:0.3.1 redis-server"
alias stop-redis="docker rm -f redis"
# alias restart-pg="docker rm -f postgres ||:; docker volume rm -f pgdata ||:; docker run --name postgres -v /tmp:/tmp -v  pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres:12.3"
alias restart-mysql="docker rm -f mysql ||:; docker volume rm -f mysqldata ||:; docker run --platform linux/amd64/v8 -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:5.7.35"
alias stop-mysql="docker rm -f mysql ||:; docker volume rm -f mysqldata"
alias restart-mongo="docker rm -f mongo ||:; docker volume rm -f mongovcxs ||:; docker run --platform linux/arm64/v8 --name mongo -v mongovcxs:/data/db -p 27017:27017 -d mongo:4.2.0"
alias stop-mongo="docker rm -f mongo ||:; docker volume rm -f mongovcxs"
alias restart-indydev="indypool && restart-redis && restart-mongo && restart-mysql"
alias stop-indydev="stop-indypool && stop-redis && stop-mongo && stop-mysql"
# alias remove-all-running-containers="docker rm -f $(docker ps -qa)"
alias run-swagger="docker run --platform linux/arm64/v8 --name swagger -d -p 6060:8080 swaggerapi/swagger-editor"
alias gitkfix="rm ~/.config/git/gitk"
alias indyscan-uidev="ssh -L 3708:localhost:3708 -L 3709:localhost:3709 indyscan-absa" ## creates tunnel so indyscan webapp can be run against the API (3708) and Daemon (WS) (3709)
alias tunnel-registry="ssh -L 5000:localhost:5000 registry.absanet.id"
# TODO: we should prolly also copy repsective libsovtoken
alias indy-use-1.16="cp /usr/local/lib/libindy.1.16.dylib /usr/local/lib/libindy.dylib"
alias indy-use-vdr6351b2="cp /usr/local/lib/libindy.vdr.6351b2.dylib /usr/local/lib/libindy.dylib"    
alias indylibs-list="ls -lah /usr/local/lib/libindy.dylib /usr/local/lib/libnullpay.dylib /usr/local/lib/libindystrgpostgres.dylib /usr/local/lib/libvcx.dylib | awk -F'>' '{print $2}'"
alias indylibs-list-avaliable="ls -lah /usr/local/lib/provisioned"
alias activate-proxy="export HTTP_PROXY=bc-vip.intra.absa.co.za:8080 && export HTTPS_PROXY=bc-vip.intra.absa.co.za:8080 && export http_proxy=bc-vip.intra.absa.co.za:8080 && export https_proxy=bc-vip.intra.absa.co.za:8080"
alias deactivate-proxy="unset HTTP_PROXY && unset HTTPS_PROXY && unset http_proxy && unset https_proxy"
alias cargo-check-tests-all-features="cargo check --tests --all-features"
