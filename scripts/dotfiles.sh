#!/bin/bash
#
# Install Oh My Zsh and set dotfiles
# Install dotfiles and configure git

source ./scripts/utils.sh

echo_info "Installing dotfiles..."

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"

# Install plugin zsh-autosuggestions
[ -d "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions" ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions"

# Install plugin zsh-completions
[ -d "$ZSH_CUSTOM_PLUGINS/zsh-completions" ] || \
  git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM_PLUGINS/zsh-completions"

# Install plugin F-Sy-H
[ -d "$ZSH_CUSTOM_PLUGINS/F-Sy-H" ] || \
  git clone https://github.com/z-shell/F-Sy-H.git "$ZSH_CUSTOM_PLUGINS/F-Sy-H"

# Install plugin zsh-nvm
[ -d "$ZSH_CUSTOM_PLUGINS/zsh-nvm" ] || \
  git clone https://github.com/lukechilds/zsh-nvm "$ZSH_CUSTOM_PLUGINS/zsh-nvm"

# Move permanent files to Home directory
replace "./scripts/.zshrc" ".zshrc"

# Set Zsh as default shell in Linux
chsh -s $(which zsh)

# Git configs (personal profile is the default)
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch master
git config --global --add oh-my-zsh.hide-dirty 1
git config --global --add oh-my-zsh.hide-status 1

# Professional Git profile (LFTM): used automatically for repos whose remote
# points at the github-lftm / github-lftmtech SSH hosts.
replace "./scripts/.gitconfig-lftm" ".gitconfig-lftm"
git config --global includeIf."hasconfig:remote.*.url:git@github-lftm:**".path "~/.gitconfig-lftm"
git config --global includeIf."hasconfig:remote.*.url:git@github-lftmtech:**".path "~/.gitconfig-lftm"

# Finish
echo_success "Dotfiles settings complete."
