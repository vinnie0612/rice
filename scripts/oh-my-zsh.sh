#!/bin/bash

if command -v zsh > /dev/null 2>&1; then
    echo "zsh exists"
else
    echo "install zsh first"
    exit
fi

if ! [ $SHELL == $(which zsh) ]; then
    echo "setting default shell"
    chsh -s $(which zsh)
fi

echo "installing omz"

curl --silent -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o /tmp/omz.sh

sh /tmp/omz.sh --unattended > /dev/null 2>&1

echo "installing plugins"

git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null

git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null

git clone --quiet https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions > /dev/null

echo "enabling plugins"

sed -i 's/plugins=(git)/plugins=(zsh-syntax-highlighting zsh-autosuggestions git)/' ~/.zshrc

sed -i "/source \$ZSH\/oh-my-zsh.sh/ i\\fpath+=\${ZSH_CUSTOM:-\${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src" ~/.zshrc

echo "changing theme"

sed -i "s/robbyrussell/half-life/" ~/.zshrc

sed -i '/# ENABLE_CORRECTION="true"/ s/^# //' ~/.zshrc
