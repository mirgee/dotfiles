#!/bin/bash -e

echo 'Setting your system to be awesome.'

# Check prerequisities
if ! [ -x "$(command -v cmake)" ]; then
  echo 'Please install `cmake` before running setup.' >&2
  exit 1
fi

if [[ -f .aliases || -f .gitconfig || -f .vim || -f .vimrc ]]; then
  echo 'Some dotfile already exists, not making any smart move automatically.'
  echo 'Either remove these dotfiles or edit this script manually.'
  exit 1
fi


# Create symbolic links in $HOME
cd ~
ln -s dotfiles/aliases .aliases
ln -s dotfiles/agignore .agignore
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/vim .vim
ln -s dotfiles/vimrc .vimrc

# Install vim packages
cd dotfiles/vim/bundle
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

# Setup Ycm
cd YouCompleteMe/
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
