# AJ's Dotfiles

Uses [chezmoi](https://github.com/twpayne/chezmoi) to manage updates between machines

## Getting Started

If this is a new machine, install Chezmoi and apply the dotfiles with
```bash
sudo apt install curl git fish
chsh -s $(which fish)
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply ajc133
```
