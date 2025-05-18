#!/bin/bash

read_environment() {
  echo "Select the environment for setup:"
  echo "1) work"
  echo "2) personal"
  read -p "Enter the number: " ENV_NUMBER

  case $ENV_NUMBER in
    1)
      ENVIRONMENT="work"
      ;;
    2)
      ENVIRONMENT="personal"
      ;;
    *)
      echo "Invalid number. Exiting."
      exit 1
      ;;
  esac
}

stow_files() {
    DOTFILES_DIR=$(dirname "$(realpath "$0")")
    stow --verbose -D "$1"
    stow --verbose -d "$DOTFILES_DIR" -t "$HOME" -S "$1"
}

read_environment

stow_files "bash"
stow_files "$ENVIRONMENT"
stow_files "git"
stow_files "nvim"
stow_files "tmux"
stow_files "ripgrep"

echo "Dotfiles setup complete for the $ENVIRONMENT environment."
