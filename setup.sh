#!/bin/bash -e

echo 'Setting your system to be awesome.'

# Check prerequisities
if ! [ -x "$(command -v cmake)" ]; then
  echo 'Please install `cmake` before running setup.' >&2
  exit 1
fi


# Create symbolic links in $HOME
cd ~
if [[ -f .aliases || -f .gitconfig || -f .vim || -f .vimrc ]]; then
  echo 'Some dotfile already exists, not making any smart move automatically.'
  echo 'Either remove these dotfiles or edit this script manually.'
  exit 1
fi
ln -sf ~/source/dotfiles/aliases ~/.aliases
ln -sf ~/source/dotfiles/agignore ~/.agignore
ln -sf ~/source/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/source/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/source/dotfiles/vim ~/.vim
ln -sf ~/source/dotfiles/vimrc ~/.vimrc

echo 'Finished'

# Install vim packages
cd ~/source/dotfiles/vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe.git
# git clone https://github.com/junegunn/fzf.vim.git
# git clone https://github.com/junegunn/fzf.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/terryma/vim-smooth-scroll.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/vim-scripts/indentpython.vim.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/fisadev/vim-isort.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jremmen/vim-ripgrep.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/powerline/powerline.git
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git
git clone https://github.com/jnurmine/Zenburn.git
git clone https://github.com/tomasr/molokai.git
git clone https://github.com/editorconfig/editorconfig-vim.git
git clone https://github.com/pangloss/vim-javascript.git

# Setup Ycm
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --gocode-completer
cd ..

# Setup ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
cd ..

# Setup git
git config --global core.excludesfile ~/dotfiles/gitignore_global

# Setup other dependencies
sudo pip install --upgrade autopep8
