# Dotfiles

Setup script for a new MacBook.

## Install

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install neovim tmux git ripgrep

# Clone this repo and run bootstrap
git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles
bash ~/dotfiles/bootstrap.sh

# Add nvim alias (open with "n")
echo 'alias n="nvim"' >> ~/.zshrc
source ~/.zshrc
```

`bootstrap.sh` copies configs, installs all Neovim plugins (Telescope, nvim-cmp,
vim-visual-multi), and installs the TypeScript language server.

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

**Autocomplete (nvim-cmp)**

Popup appears as you type in any LSP-attached buffer. For TS/JS, accepting a
completion for an unimported symbol auto-inserts the `import` line.

| Key | Action |
|-----|--------|
| `Ctrl+Space` | Trigger completion |
| `Tab` / `Shift+Tab` | Cycle items |
| `Enter` | Accept (applies auto-import) |

## One-liner

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install neovim tmux git ripgrep && git clone https://github.com/chanh-t/dotfiles.git ~/dotfiles && bash ~/dotfiles/bootstrap.sh && echo 'alias n="nvim"' >> ~/.zshrc && source ~/.zshrc
```
