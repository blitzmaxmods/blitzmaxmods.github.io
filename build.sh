#!/bin/bash

GITUSERNAME=blitzmaxmods

if [ $# -eq 0 ]
  then
    echo you need to provide your email address
    exit
fi

# Create KEY.gpg
gpg --armor --export "${1}" > ppa/KEY.gpg

# Create Packages and Packages.gz
dpkg-scanpackages --multiversion . > ppa/Packages
gzip -k -f ppa/Packages

# Create release files
apt-ftparchive release . > ppa/Release
gpg --default-key "${1}" -abs -o - ppa/Release > ppa/Release.gpg
gpg --default-key "${1}" --clearsign -o - ppa/Release > ppa/InRelease

# Create PPA
echo "deb [signed-by=/etc/apt/trusted.gpg.d/${GITUSERNAME}.gpg] https://${GITUSERNAME}.github.io/ppa ./" > ppa/${GITUSERNAME}.list


