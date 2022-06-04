#!/usr/bin/env bash

set -e

if ! [ -x "$(command -v yay)" ]; then
  echo 'ERROR: yay is not installed.'
  echo 'Installing yay...'
  sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && rm -rf yay
fi

echo -e "\nUpdating the system..."
sudo pacman -Syu

echo -e "\nInstalling dependencies..."
sudo pacman --needed --noconfirm -S -q konsole fish cmake

echo -e "\nInstalling software"
yay --noconfirm --needed -S ruby-colorls noto-fonts-emoji-apple vscodium-bin jetbrains-toolbox

echo -e "\nInstalling fonts..."
cd fonts
sudo mkdir -p /usr/share/fonts/firamono
sudo cp ./*.otf /usr/share/fonts/firamono/
cd ..

echo -e "\nCloning shell-color-scripts..."
git clone https://gitlab.com/dwt1/shell-color-scripts.git -q
cd shell-color-scripts

echo -e "\nCompiling and installing shell-color-scripts..."
sudo make -s install

echo -e "\nremoving the repository "
cd ..
rm -rf shell-color-scripts

echo -e "\nInstalling the Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y > /dev/null

echo -e "\nInitializing the fish config..."
fish -c exit > /dev/null

echo -e "\nAdding asteriks to the sudo prompt..."
# This appends "Defaults   pwfeedback" to the sudoers file so cool asteriks are displayed when typing your password
echo -e "\nDefaults   pwfeedback" | sudo tee -a /etc/sudoers > /dev/null

echo -e "\nInitializing and copying the new fish config file..."
touch ~/.config/fish/config.fish
cp ./config/config.fish ~/.config/fish/config.fish

echo -e "\nInitializing and copying the new starship config file..."
touch ~/.config/starship.toml
cp ./config/starship.toml ~/.config/starship.toml

echo -e "\nInitializing and copying the new Konsole config file..."
mkdir -p ~/.local/share/konsole/
touch ~/.local/share/konsole/Fish.profile
cp ./config/Fish.profile ~/.local/share/konsole/Fish.profile

read -p "Do you want to install the KDE base packages? (yes/no) " yn

case $yn in 
	yes ) echo "OK, installing the packages... This might take a while";
  sudo pacman --needed --noconfirm -S kde-applications;;
	no ) echo exiting...;;
	* ) echo invalid response;;
esac

echo -e "\nPlease restart Konsole and set the fish profile as the default profile in the Konsole settings!"
