# Dotfiles

Setup script for a new MacBook.

## Install

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install neovim tmux git

# Install a Nerd Font (for file icons in NvimTree)
brew install --cask font-jetbrains-mono-nerd-font

# Clone this repo
git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles

# Set up Neovim config
mkdir -p ~/.config/nvim
cp ~/dotfiles/init.lua ~/.config/nvim/init.lua

# Set up tmux config
cp ~/dotfiles/.tmux.conf ~/.tmux.conf

# Set up zsh config (optional — review before overwriting)
# cp ~/dotfiles/.zshrc ~/.zshrc

# Install NvimTree and devicons
git clone https://github.com/nvim-tree/nvim-tree.lua ~/.local/share/nvim/site/pack/plugins/start/nvim-tree.lua
git clone https://github.com/nvim-tree/nvim-web-devicons ~/.local/share/nvim/site/pack/plugins/start/nvim-web-devicons

# Install Telescope and plenary
git clone https://github.com/nvim-telescope/telescope.nvim ~/.local/share/nvim/site/pack/plugins/start/telescope.nvim
git clone https://github.com/nvim-lua/plenary.nvim ~/.local/share/nvim/site/pack/plugins/start/plenary.nvim
```

## One-liner

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install neovim tmux git && brew install --cask font-jetbrains-mono-nerd-font && git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles && mkdir -p ~/.config/nvim && cp ~/dotfiles/init.lua ~/.config/nvim/init.lua && cp ~/dotfiles/.tmux.conf ~/.tmux.conf && git clone https://github.com/nvim-tree/nvim-tree.lua ~/.local/share/nvim/site/pack/plugins/start/nvim-tree.lua && git clone https://github.com/nvim-tree/nvim-web-devicons ~/.local/share/nvim/site/pack/plugins/start/nvim-web-devicons && git clone https://github.com/nvim-telescope/telescope.nvim ~/.local/share/nvim/site/pack/plugins/start/telescope.nvim && git clone https://github.com/nvim-lua/plenary.nvim ~/.local/share/nvim/site/pack/plugins/start/plenary.nvim
```
