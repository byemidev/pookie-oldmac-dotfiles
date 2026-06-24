# pookie-dotfiles (Alacritty Edition - old macbook)

Personal configuration files for neovim, tmux, alacritty, zsh.
Managed with GNU Stow.

Migrated from Ghostty to Alacritty for better performance on older Mac hardware
(MacBook Pro 2015, macOS Monterey, Intel i5, 8GB RAM).

## Structure

```
dotfiles/
├── alacritty/.config/alacritty/alacritty.toml
├── tmux/.tmux.conf
└── zshrc/.zshrc
```

## Requirements

zsh is installed on your macbook by default.
i used Oh-my-zsh (requires zsh installed).

```bash
brew install stow
brew install --cask alacritty
brew install tmux
```

## Installation

```bash
git clone https://github.com/byemidev/pookie-oldmac-dotfiles.git ~/dotfiles
cd ~/dotfiles
stow alacritty
stow tmux
stow zshrc
```

This creates symlinks from the expected config locations to the files in this repo.

## Adding a new config

1. Move the config file/folder into the dotfiles repo, mirroring the home directory structure
2. Run `stow <package>` to create the symlink
3. Commit and push

## Theme: guts

Custom dark theme with muted colors:
- Background: #101113
- Foreground: #9f9e99
- Accent: #a7d8b0 (green)

## Keybindings

You can see all keybindings including a comprehensive workflow usage on [guide.md](./guide.md).

## Credits

Original config by [vossenwout](https://github.com/vossenwout).
Migrated from Ghostty to Alacritty.
