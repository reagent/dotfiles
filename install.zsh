#!/usr/bin/env zsh

# Check if we have homebrew and install
if (( ! $+commands[brew] )); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if (( ! $+commands[chezmoi])); then
  brew install chezmoi
fi

# Get dotfiles and update dependencies
chezmoi init reagent --apply
brew bundle --file ~/Brewfile

source ~/.zshrc

