set -e

if which plasma-systemmonitor && which dnf; then
  echo "Detected Fedora"
else
  echo "ur on the wrong distro dumbass"
  exit 1
fi

echo "Updating the system..."
#sudo dnf update -y

echo "Installing dependencies..."
sudo dnf install konsole neofetch fish exa git make cmake cpp starship -y

echo "Installing fonts..."
cd fonts
sudo mkdir -p /usr/share/fonts/firacode
sudo cp -v *.otf /usr/share/fonts/firacode/
cd ..

echo "Cloning shell-color-scripts..."
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts

echo "Compiling and installing shell-color-scripts..."
sudo make install

echo "removing the repository "
cd ..
rm -rf shell-color-scripts

echo "Downloading and moving the Konsole color theme..."
wget -v https://raw.githubusercontent.com/projekt0n/github-nvim-theme/main/terminal/konsole/github_dark.colorscheme
mv -v ./github_dark.colorscheme ~/.local/share/konsole/dark.colorscheme

echo "Copying the fish config file..."
touch ~/.config/fish/config.fish
cp -v ./config/config.fish ~/.config/fish/config.fish

echo "Copying the starship config file..."
touch ~/.config/starship.toml
cp -v ./config/starship.toml ~/.config/starship.toml

echo "Copying the Konsole config file..."
touch ~/.local/share/konsole/Fish.profile
cp -v ./config/Fish.profile ~/.local/share/konsole/Fish.profile

neofetch

echo "Please set the fish profile as the default profile in the Konsole settings!"
