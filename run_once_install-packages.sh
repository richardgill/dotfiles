#!/bin/sh
brew bundle install --file=~/.config/Brewfile

# bat needs a rebuild to pick up themes
bat cache --build



