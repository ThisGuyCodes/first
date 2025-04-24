#!/bin/bash
set -euo pipefail

echo "Installing Lix..."
curl -sSf -L https://install.lix.systems/lix | sh -s -- install

echo "Lix installed"

echo "Installing developer tools..."
# Install XCode Command Line Tools.
xcode-select --install || true

# Wait until XCode Command Line Tools installation has finished.
until xcode-select --print-path &> /dev/null; do
  sleep 5;
done

echo "Cloning nix config repo..."
mkdir -p ~/.config
git clone https://github.com/ThisGuyCodes/nix-home ~/.config/nix-darwin

echo "First derive..."
/nix/var/nix/profiles/default/bin/nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/.config/nix-darwin

echo "Go!"
