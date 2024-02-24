if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.bash_profile_env" ]; then
    source "$HOME/.bash_profile_env"
fi
. "$HOME/.cargo/env"
