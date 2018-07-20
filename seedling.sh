#!/bin/bash
clear

isZendesk=true

# Download Zsh
if ! [ -x "$(command -v zsh)" ]; then
  sg aha-team -c "aws s3 sync s3://zendesk-datascientists-intermediate-east/zsh/ ~/.zsh/ && chmod +x ~/.zsh/zsh && chmod -R g-w,o-w ~/.zsh/share"
  export PATH=$HOME/.zsh:$PATH
  echo "export PATH=$HOME/.zsh:$PATH" >> ~/.bashrc
  isZendesk=true
fi

# Install Oh My Zsh and enable Powerlevel 9k
echo "NO PASSWORD" | bash <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
cat lib/zshrc_additions >> ~/.zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="blinks"/' ~/.zshrc

if [ $isZendesk ]; then
 sed -i "1ifpath=($HOME/.zsh/share/zsh/5.5.1-dev-0/functions)" ~/.zshrc
fi
zsh -c 'source ~/.zshrc'

# Install Ultimate VIM
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Set up vim for awesomeness
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat lib/vimrc_template > ~/.vimrc

vim +PluginInstall +qall
source ~/.bashrc

echo "You're All Done :)"
