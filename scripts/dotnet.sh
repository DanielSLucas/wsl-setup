#!/bin/bash
#
# .NET setup
# Installs the .NET SDK into $HOME/.dotnet in a non-interactive, reproducible
# way (pinned SDK version via dotnet-install.sh), exposes DOTNET_ROOT/PATH and
# installs dotnet-ef as a global tool.

source ./scripts/utils.sh

echo_info "Setting up .NET SDK..."

DOTNET_VERSION="10.0.300"
DOTNET_EF_VERSION="10.0.8"

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

# Download the official installer and pin the SDK version (reproducible)
DOTNET_INSTALL="$(mktemp)"
curl -fsSL https://dot.net/v1/dotnet-install.sh -o "$DOTNET_INSTALL"
chmod +x "$DOTNET_INSTALL"

# Non-interactive install into $HOME/.dotnet
"$DOTNET_INSTALL" --version "$DOTNET_VERSION" --install-dir "$DOTNET_ROOT" --no-path
rm -f "$DOTNET_INSTALL"

# Install dotnet-ef global tool (pinned). Update if already present.
if dotnet tool list --global | grep -q "dotnet-ef"; then
  dotnet tool update --global dotnet-ef --version "$DOTNET_EF_VERSION"
else
  dotnet tool install --global dotnet-ef --version "$DOTNET_EF_VERSION"
fi

# Finish
echo_success "Finished .NET setup (SDK ${DOTNET_VERSION}, dotnet-ef ${DOTNET_EF_VERSION})."
