#!/bin/bash
#
# Install Oh My Zsh and set dotfiles
# Install dotfiles and configure git

source ./scripts/utils.sh

echo_info "Installing dotfiles..."

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install plugin zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# Install plugin F-Sy-H
git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H

# Install plugin zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# Move permanent files to Home directory
replace "./scripts/.zshrc" ".zshrc"

# Set Zsh as default shell in Linux
chsh -s $(which zsh)

# Fix “zsh compinit: insecure directories” warnings
fpath=(/usr/local/share/zsh-completions $fpath)

# Git configs
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch master
git config --global --add oh-my-zsh.hide-dirty 1
git config --global --add oh-my-zsh.hide-status 1

# Finish
echo_success "Dotfiles settings complete."
