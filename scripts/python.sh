#!/bin/bash
#
# Python setup for a clean Ubuntu WSL
# Installs pyenv build dependencies, pyenv, Python 3.11.9 (global),
# upgrades pip and installs uv==0.11.7 via pip in that Python.

source ./scripts/utils.sh

echo_info "Setting up Python (pyenv + uv)..."

# pyenv build dependencies (Ubuntu/Debian)
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev git

# Install pyenv (idempotent: pyenv.run skips if already present)
if [ ! -d "$HOME/.pyenv" ]; then
  curl -fsSL https://pyenv.run | bash
else
  echo_info "pyenv already installed, skipping clone."
fi

# Load pyenv into this non-interactive shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Install Python 3.11.9 and set it as global (-s skips if already built)
pyenv install -s 3.11.9
pyenv global 3.11.9

# Refresh shims so the new python/pip are on PATH
pyenv rehash

# Upgrade pip and install uv via pip into this Python
python -m pip install --upgrade pip
python -m pip install uv==0.11.7

pyenv rehash

# Finish
echo_success "Finished Python setup (Python 3.11.9 global, uv 0.11.7 via pip)."
