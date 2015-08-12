#!/bin/bash

# Get the archive
curl -o envnx.zip -L https://github.com/bvandreunen/envnx/archive/master.zip

# Unzip
unzip -q envnx.zip -d archive
mv archive/envnx-master/* .
rm -rf archive
rm -f envnx.zip

echo "Done."
