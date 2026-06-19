#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./scripts/utils.sh

echo_info "Setting Node.js and npm packages..."

# Load nvm in this non-interactive shell (nvm is a shell function, not a binary)
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install node lts version and set it as the default
nvm install --lts
nvm alias default 'lts/*'
nvm use default

# Finish
echo_success "Finished Node.js and npm settings."
