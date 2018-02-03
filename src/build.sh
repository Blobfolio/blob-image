#!/bin/bash
#
# blob-image: Build Script
#
# Compile the deb package.
#
# Copyright © 2018 Blobfolio, LLC <https://blobfolio.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2.



START=`date +"%s.%N"`
SRC_DIR="$( cd "$( dirname $(readlink -f $0) )" && pwd )/"
BASE_DIR="$(dirname "$SRC_DIR")/"
RELEASE_DIR="${BASE_DIR}deb/"
WORKING_DIR="${RELEASE_DIR}blob-image_latest/"
PKGNAME="blob-image"
PKGVER="$(grep "# version:" "${BASE_DIR}blob-image" | cut -d' ' -f3-)"



echo -e "\e[90m-----------------------------------\e[0m"
echo -e "\e[34mblob-image $PKGVER\e[0m"
echo -e "\e[90m-----------------------------------\e[0m"



# Delete existing directories, if applicable.
echo -e "   \e[90m++\e[0m Pre-cleaning."

# Clear and remake the dist directory.
if [ -e "${WORKING_DIR}" ]; then
	sudo rm -rf "${WORKING_DIR}"
fi
mkdir "${WORKING_DIR}"
mkdir "${WORKING_DIR}DEBIAN"
mkdir "${WORKING_DIR}usr"
mkdir "${WORKING_DIR}usr/bin"



# Copy what needs copying.
echo -e "   \e[90m++\e[0m Build deb."
sudo rm -rf "${RELEASE_DIR}*.deb"
sudo cp -a "${BASE_DIR}blob-image" "${WORKING_DIR}usr/bin/blob-image"
sudo cp -a "${SRC_DIR}control" "${WORKING_DIR}DEBIAN/control"
sudo sed -i "s/%VERSION%/${PKGVER}/g" "${WORKING_DIR}DEBIAN/control"
PKGSIZE="$(wc -c < "${WORKING_DIR}usr/bin/blob-image")"
sudo sed -i "s/%SIZE%/${PKGSIZE}/g" "${WORKING_DIR}DEBIAN/control"
sudo chown -R root:root "$WORKING_DIR"
dpkg-deb --build "${WORKING_DIR}"



echo -e "   \e[90m++\e[0m Post-cleaning."
sudo rm -rf "${WORKING_DIR}"



END=`date +"%s.%N"`
ELAPSED=`awk "BEGIN {printf \"%.2f\n\", $END-$START}"`
echo -e "   \e[90m++\e[0m Finished in $ELAPSED seconds."
exit 0
