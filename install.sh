#!/bin/bash
#
# This is an install script for envnx
# Please See https://github.com/bvandreunen/envnx
# for more information
#

cy="\033[33;33m"
cg="\033[33;32m"
cb="\033[33;34m"
cw="\033[33;37m"

hr="-----------"

echo "\nDownloading envnx...\c"

# Get the archive
curl -so envnx.zip -L https://github.com/bvandreunen/envnx/archive/master.zip

# Unzip
unzip -q envnx.zip -d archive

# Organize files
mv archive/envnx-master/* .
rm -rf archive
rm -f envnx.zip

echo "$cg\c"
echo "Done\n"
echo "$cw\c"

# Create www
echo "$hr\n"
echo "A folder named 'www' is needed to hold your websites/projects."
echo "This folder will be synced to the /var/www/ folder within the vagrant box"

echo "$cy"

echo "1. Create the www folder"
echo "2. Create a symlink to the Sites folder in your home directory"
echo "3. Create a symlink to another existing folder on your system"

echo "$cb\c"
echo "Please choose an option (1): \c"

read option

if [[ $option == 2 ]]; then
  ln -s "$HOME/Sites" "www"
elif [[ $option == 3 ]]; then
  echo "Enter the path to the existing folder: \c"
  read path
  ln -s "$path" "www"
else
  mkdir "www"
fi

# Install bindfs plugin
echo "$cw"
echo "envnx needs the vagrant-bindfs plugin. Would you like to install it now?"
echo "$cb\c"
echo "Type y+<enter> to install or press <enter> to skip: \c"

read install

if [[ $install == "y" ]]; then
  echo "$cg\c"
  vagrant plugin install vagrant-bindfs
fi

echo "$cw"

# Run vagrant up
echo "Your envnx installation is complete! Would you like to start up the envnx vagrant box now?"

echo "$cb\c"

echo "Type y to run vagrant up or press enter to skip: \c"

read up

if [[ $up == "y" ]]; then
  echo "$cw\c"
  echo "Starting up your vagrant box..."
  cd vagrant && vagrant up
fi

echo "$cg\c"

echo "\nCongratulations, envnx installation has been completed!"

if [[ $up != "y" ]]; then
  echo "Go into the vagrant folder and run 'vagrant up' when you are ready to start up your box"
fi

echo "Please see the URL below or the README file for further documentation."
echo "\nhttps://github.com/bvandreunen/envnx\n"
