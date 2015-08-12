#!/bin/bash

# Get the archive
curl -o envnx.zip -L https://github.com/bvandreunen/envnx/archive/master.zip

# Unzip
unzip -q envnx.zip -d archive
mv archive/envnx-master/* .
rm -rf archive
rm -f envnx.zip

echo "envnx has been downloaded succesfully!"

echo "--------------------"

echo "Install vagrant-bindfs plugin?\n"

echo "envnx needs the vagrant-bindfs plugin. Would you like to install it now?"

echo -n "Type y to install or press enter to skip: "

read install

if [ $install = "y" ]
  vagrant plugin install vagrant-bindfs
else
  echo "Skipping vagrant-bindfs installation.."

echo -n "Would you like to start up the envnx vagrant now?"

read up

if [ $up = "y" ]
  vagrant up

echo "env Installing complete"


