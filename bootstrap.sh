#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
PACK_DIR="$HOME/.local/share/nvim/site/pack/plugins/start"

echo "==> Linking configs"
mkdir -p "$HOME/.config/nvim"
cp "$DOTFILES/init.lua"   "$HOME/.config/nvim/init.lua"
cp "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

echo "==> Installing Neovim plugins into $PACK_DIR"
mkdir -p "$PACK_DIR"

clone() {
  local repo="$1"
  local name
  name="$(basename "$repo")"
  if [ -d "$PACK_DIR/$name" ]; then
    echo "  - $name (exists, pulling)"
    git -C "$PACK_DIR/$name" pull --ff-only
  else
    echo "  - $name"
    git clone --depth 1 "https://github.com/$repo" "$PACK_DIR/$name"
  fi
}

# Telescope
clone nvim-lua/plenary.nvim
clone nvim-telescope/telescope.nvim

# Completion (nvim-cmp + LSP source + buffer/path sources)
clone hrsh7th/nvim-cmp
clone hrsh7th/cmp-nvim-lsp
clone hrsh7th/cmp-buffer
clone hrsh7th/cmp-path

# Multi-cursor
clone mg979/vim-visual-multi

echo "==> Installing TypeScript language server"
npm install -g typescript-language-server typescript

echo "==> Done"
