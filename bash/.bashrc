# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export TERM=screen-256color
export GPG_TTY=$(tty)

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable extended globbing
shopt -s extglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\w\$ '
fi

# If this is an xterm set the title to just the directory
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_aliases_env" ]; then
    source "$HOME/.bash_aliases_env"
fi

if [ -f "$HOME/.bashrc_env" ]; then
    source "$HOME/.bashrc_env"
fi

if [ -f "$HOME/.bash_completions" ]; then
    source "$HOME/.bash_completions"
fi

if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

if [ -f "$HOME/.fzf.bash" ]; then
    source "$HOME/.fzf.bash"
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.config/lsp/lua-language-server/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
