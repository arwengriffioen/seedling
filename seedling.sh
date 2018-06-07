#!/bin/bash
clear

# Install Oh My Zsh
# Download Zsh
sg aha-team -c "aws s3 sync s3://zendesk-datascientists-intermediate-east/zsh/ ~/.zsh/ && chmod +x ~/.zsh/zsh && chmod -R g-w,o-w ~/.zsh/share"
export PATH=$HOME/.zsh:$PATH
echo "export PATH=$HOME/.zsh:$PATH" >> ~/.bashrc

# Install Oh My Zsh and set theme
echo "NO PASSWORD" | bash <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
cat ~/code/seedling/lib/zshrc_additions >> ~/.zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="blinks"/' ~/.zshrc
source ~/.zshrc

# Install Ultimate VIM
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Set up vim for awesomeness
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat ~/code/seedling/lib/vimrc_template >> ~/.vimrc

cat ~/code/seedling/lib/bash_additions zsh >> ~/.bashrc
source ~/.bashrc
