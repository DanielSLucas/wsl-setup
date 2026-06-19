# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# --------------------------- Theme ------------------------------------
# ZSH theme
ZSH_THEME="robbyrussell"

# --------------------------- Paths ------------------------------------
# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# Support 256 colors path
export TERM="xterm-256color"

# --------------------------- Plugins ----------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ssh-agent
  colored-man-pages
  extract
  F-Sy-H
  zsh-autosuggestions
  zsh-completions
  zsh-nvm
)

# ssh-agent: load the personal and professional identities
zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_lftm id_ed25519_lftmtech

source $ZSH/oh-my-zsh.sh

# --------------------------- Aliases ----------------------------------
# Copy SSH
alias copyssh="cat < ~/.ssh/id_ed25519.pub | clip.exe | echo '=> Public SSH key copied.'"

# Open developer directory
alias dev="${HOME}/Dev"

# Open Explorer in current folder
alias explorer="explorer.exe ."

# Open .gitconfig in VSCode
alias gitcfg="code ~/.gitconfig"

# List outdated npm packages installed globally
alias npmcheck="npm outdated -g --depth=0"

# List npm packages installed globally
alias npmlist="npm list -g --depth=0"

# Update npm packages installed globally
alias npmupdate="npm update -g"

# Open Windows user directory
alias winhome="/mnt/c/Users/$(echo $USER)"

# Open .zshrc in VSCode
alias zshcfg="code ~/.zshrc"

# -------------- ZSH_HISTORY CONFIG --------------
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# -------------- NVM CONFIG --------------
# NVM is loaded by the zsh-nvm plugin (declared in plugins above).
# Do NOT source nvm again here to avoid duplicate loading.

# -------------- PYENV CONFIG --------------
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# -------------- .NET ---------------
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

# -------------- LOCAL BIN --------------
export PATH="$HOME/.local/bin:$PATH"

# -------------- XSERVER CONFIG --------------

# set DISPLAY variable to the IP automatically assigned to WSL2
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# dbus start
#sudo /etc/init.d/dbus start &> /dev/null
