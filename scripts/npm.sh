#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

source ./scripts/utils.sh

echo_info "Setting Node.js and npm packages..."

# Install node lts versin
nvm install --lts

# Finish
echo_success "Finished Node.js and npm settings."
