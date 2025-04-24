#!/bin/bash
set -euo pipefail

echo "Installing Lix..."
curl -sSf -L https://install.lix.systems/lix | sh -s -- install

echo "Lix installed"

echo "Installing developer tools..."
xcode-select --install || true

echo "Cloning nix config repo..."
mkdir -p ~/.config
git clone https://github.com/ThisGuyCodes/nix-home ~/.config/nix-darwin

echo "Installing darwin-rebuild..."
nix run nix-darwin/master#darwin-rebuild -- switch

echo "Go!"
darwin-rebuild switch --flake ~/.config/nix-darwi
