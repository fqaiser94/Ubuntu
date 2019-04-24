#sudo apt-get install libxss1 libappindicator1 libindicator7


# This installs a needed library for Google Chrome
sudo apt-get install -f

# download latest stable version of chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install chrome
sudo dpkg -i google-chrome*.deb

# launch to test if installation was successful
google-chrome

# delete chrome installer
rm google-chrome*.deb
