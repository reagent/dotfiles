function dotfiles-init() {
  # install homebrew and chezmoi if needed
  if (( ! $+commands[brew] )); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if (( ! $+commands[chezmoi])); then
    brew install chezmoi
  fi

  # get dotfiles and update dependencies
  chezmoi init reagent --apply
  brew bundle --file ~/Brewfile

  source ~/.zshrc
}
