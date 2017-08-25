#!/bin/bash
clear

# Install Oh My Zsh
echo "NO PASSWORD" | bash <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
cat lib/zshrc_additions >> ~/.zshrc
source ~/.zshrc

# Install Ultimate VIM
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Set up vim for awesomeness
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat lib/vimrc_template >> ~/.vimrc

cat zsh >> ~/.bashrc

