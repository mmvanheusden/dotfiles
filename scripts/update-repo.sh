#!/usr/bin/env bash

echo "Please run this script from the dotfiles dir or it will cause errors!"
parent_PWD=$(readlink -ve "/proc/$PPID/cwd")

cp ~/.config/starship.toml $parent_PWD/config/starship.toml
echo "Moved starship config"

cp ~/.config/fish/config.fish $parent_PWD/config/config.fish
echo "Moved fish config"