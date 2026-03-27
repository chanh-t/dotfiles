# Dotfiles

Setup script for a new MacBook.

## Install

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install neovim tmux git ripgrep

# Clone this repo
git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles

# Set up Neovim config
mkdir -p ~/.config/nvim
cp ~/dotfiles/init.lua ~/.config/nvim/init.lua

# Set up tmux config
cp ~/dotfiles/.tmux.conf ~/.tmux.conf

# Install Neovim plugins (Telescope + plenary)
git clone --depth 1 https://github.com/nvim-lua/plenary.nvim ~/.local/share/nvim/site/pack/plugins/start/plenary.nvim
git clone --depth 1 https://github.com/nvim-telescope/telescope.nvim ~/.local/share/nvim/site/pack/plugins/start/telescope.nvim

# Install TypeScript LSP
npm install -g typescript-language-server typescript

# Add nvim alias (open with "n")
echo 'alias n="nvim"' >> ~/.zshrc
source ~/.zshrc
```

## What's included

### Neovim

**Fuzzy search (Telescope)**
| Key | Action |
|-----|--------|
| `\ff` | Find files |
| `\fg` | Search text across files (requires ripgrep) |
| `\fb` | Switch buffers |

**TypeScript LSP**

Activates automatically when opening `.ts` / `.tsx` / `.js` / `.jsx` files.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `Shift+K` | Hover docs / type info |
| `\rn` | Rename symbol |
| `\ca` | Code actions (auto-import, fixes) |
| `gr` | Find references |

Errors and warnings appear inline automatically.

## One-liner

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install neovim tmux git ripgrep && git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles && mkdir -p ~/.config/nvim && cp ~/dotfiles/init.lua ~/.config/nvim/init.lua && cp ~/dotfiles/.tmux.conf ~/.tmux.conf && git clone --depth 1 https://github.com/nvim-lua/plenary.nvim ~/.local/share/nvim/site/pack/plugins/start/plenary.nvim && git clone --depth 1 https://github.com/nvim-telescope/telescope.nvim ~/.local/share/nvim/site/pack/plugins/start/telescope.nvim && npm install -g typescript-language-server typescript && echo 'alias n="nvim"' >> ~/.zshrc && source ~/.zshrc
```
