read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
	yes ) echo "OK, installing the packages... This might take a while";
  sudo pacman --needed --noconfirm -S kde-applications;;
	no ) echo exiting...;;
	* ) echo invalid response;
		exit 1;;
esac

echo doing stuff...