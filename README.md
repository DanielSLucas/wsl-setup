# WSL Debian/Ubuntu Dotfiles

This is a simple dotfiles and scripts to setup _Windows Subsystem for Linux (WSL)_ with _Debian and Ubuntu based Linux distributions_.

## Features

_Check linked files to more details._

### Installation files

- [apps.sh](scripts/apps.sh) - installs applications (includes `git`, `NVM`, `ripgrep`).
- [dotfiles.sh](scripts/dotfiles.sh) - installs _Oh My Zsh_, _.zshrc_ and _Git_ configs (personal + LFTM profiles).
- [npm.sh](scripts/npm.sh) - installs _Node.js_ LTS via _NVM_ and sets it as the default.
- [python.sh](scripts/python.sh) - installs _pyenv_, _Python 3.11.9_ (global) and _uv_ via pip.
- [dotnet.sh](scripts/dotnet.sh) - installs the _.NET SDK_ into `~/.dotnet` and the `dotnet-ef` global tool.
- [setup.sh](setup.sh) - main installer.
- [ssh.sh](scripts/ssh.sh) - installs the _SSH_ config and generates the personal key.
- [ssh_config](scripts/ssh_config) - _SSH_ host config (personal + professional GitHub hosts).
- [user.sh](scripts/user.sh) - user data to configuration of _Git_ and _SSH_.
- [utils.sh](scripts/utils.sh) - support functions for other installers.
- [.zshrc](scripts/.zshrc) - terminal configs with aliases, paths, plugins and theme (this file is permanent after installation).
- [.gitconfig-lftm](scripts/.gitconfig-lftm) - professional Git identity included automatically for LFTM remotes.

## Prerequisites

- Updated Windows 10 or later **(recommended is Windows 11)**
- WSL 2 with _Debian/Ubuntu_ based

## Installation

**Note:** I use the [Windows 11 Setup Script](https://github.com/samuelramox/windows-setup) script to configure `Windows`, install some apps and `WSL`. To use the script, just download and open it with `PowerShell`. If you use it, skip to step [Install dotfiles](#install-dotfiles).

### Install WSL

If you do not already have `WSL`, follow these steps to install. Open `Powershell` by searching for it in _Search_ and _right-clicking_ for a context menu and clicking _“Run as Administrator”_. Enter the following command:

```
wsl --install
```

After restarting, launch `Ubuntu.exe` from the _Start Menu_. You’ll be asked to enter a username and password (for sudo stuff).

### Install dotfiles

If you already have `Windows` and `WSL` installed, run these commands in `WSL`:

```
git clone https://github.com/DanielSLucas/wsl-setup.git
chmod 700 wsl-setup/ -R
cd wsl-setup
./setup.sh
```

## What gets installed

- **Applications** — Ubuntu WSL utils, build-essential, common CLI tools, `git`, `ripgrep` and `NVM`.
- **Node.js** — installed via `NVM` (latest LTS, set as the default). `NVM` is loaded in Zsh by the `zsh-nvm` plugin.
- **Python** — `pyenv` with `Python 3.11.9` set as global; `pip` is upgraded and `uv==0.11.7` is installed via pip into that Python.
- **.NET** — SDK `10.0.300` installed into `~/.dotnet` (pinned, non-interactive via `dotnet-install.sh`), with `DOTNET_ROOT`/`PATH` exported and the `dotnet-ef` `10.0.8` global tool.

## Git & SSH profiles

Two GitHub identities are configured:

- **Personal** (default) — `Daniel Lucas Santos` / `daniellucas-pms@hotmail.com`, using `~/.ssh/id_ed25519` on the `github.com` host.
- **Professional (LFTM)** — `Daniel Santos` / `daniel.santos@lftm.com.br`, applied automatically (via `includeIf hasconfig:remote.*.url`) for repos whose remote uses the `github-lftm` or `github-lftmtech` SSH hosts.

The SSH config defines three hosts (`github.com`, `github-lftm`, `github-lftmtech`), all pointing to `HostName github.com` with `IdentitiesOnly yes`. Clone professional repos with, e.g.:

```
git clone git@github-lftm:org/repo.git
git clone git@github-lftmtech:org/repo.git
```

> **Note:** `ssh.sh` only generates the **personal** key (`id_ed25519`) when missing. The professional keys (`id_ed25519_lftm`, `id_ed25519_lftmtech`) are **not** created or copied by this repo — provide them manually under `~/.ssh/` with `600` permissions.

## Remote - WSL

Install the [Remote - WSL](https://aka.ms/vscode-remote/download/wsl) extension in VSCode to get a better experience with `WSL`.

## Reference

- [Windows Subsystem for Linux Installation Guide for Windows](https://aka.ms/wslinstall)
- [WSL 2](https://aka.ms/wsl2)

## Utilities

- [Oh My Posh](https://ohmyposh.dev)
- [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
- [Winstall](https://winstall.app)
