#!/bin/bash

set -e

if ! [ -x "$(command -v dnf)" ]; then
  echo 'Error: not using fedora.' >&2
  exit 1
fi

echo -e "\nUpdating the system..."
#temporarily disabled because german wifi is dogshit and i am too lazy to update my laptop
#sudo dnf update -y
sleep 2

echo -e "\nInstalling dependencies..."
sudo dnf install konsole fish exa git make cmake cpp -y
sleep 2

echo -e "\nInstalling fonts..."
cd fonts
sudo mkdir -p /usr/share/fonts/firamono
sudo cp ./*.otf /usr/share/fonts/firamono/
cd ..
sleep 2

echo -e "\nCloning shell-color-scripts..."
git clone https://gitlab.com/dwt1/shell-color-scripts.git -q
cd shell-color-scripts
sleep 2

echo -e "\nCompiling and installing shell-color-scripts..."
sudo make -s install
sleep 2

echo -e "\nremoving the repository "
cd ..
rm -rf shell-color-scripts
sleep 2


echo -e "\nInstalling the Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y > /dev/null
sleep 2

echo -e "\nInitializing the fish config..."
fish -c exit > /dev/null
sleep 2

echo -e "\nAdding asteriks to the sudo prompt..."
# This appends "Defaults   pwfeedback" to the sudoers file so cool asteriks are displayed when typing your password
echo -e "\nDefaults   pwfeedback" | sudo tee -a /etc/sudoers > /dev/null
sleep 2

echo -e "\nMaking DNF faster..."
echo -e "\nfastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
sleep 2


echo -e "\nCopying the fish config file..."
touch ~/.config/fish/config.fish
cp ./config/config.fish ~/.config/fish/config.fish
sleep 2

echo -e "\nCopying the starship config file..."
touch ~/.config/starship.toml
cp ./config/starship.toml ~/.config/starship.toml
sleep 2

echo -e "\nCopying the Konsole config file..."
touch ~/.local/share/konsole/Fish.profile
cp ./config/Fish.profile ~/.local/share/konsole/Fish.profile
sleep 2

echo -e "\nPlease restart Konsole and set the fish profile as the default profile in the Konsole settings!"
