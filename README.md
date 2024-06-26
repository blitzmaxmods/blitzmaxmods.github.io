# PPA Repository for blitzmaxmods

THIS IS UNDER CONSTRUCTION AND TESTING - PLEASE DO NOT USE YET

## Installing this repository
```
curl -s --compressed "https://blitzmaxmods.github.io/ppa/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/blitzmaxmods.gpg >/dev/null

sudo curl -s --compressed -o /etc/apt/sources.list.d/blitzmaxmods.list "https://blitzmaxmods.github.io/ppa/blitzmaxmods.list"

sudo apt update
```
## Modules 

* **Blitzmax Installer**
EXPERIMENTAL
```
sudo apt update
sudo apt install bmax
```
# How to create a PPA Repository in github pages:

* Create a ppa repository in your github account:
    * Names the repository <USERNAME>.github.io
    * Make sure you create a README.md
* Clone the ppa repository to your local system
    * Edit README.md and update as necessary
    * Create a folder called ppa
    * Publish to your repository
    * Copy the build.sh file from this repo and edit it
        * Change GITUSERNAME in the script and save

## Create keys
You only need to do this once
```
sudo apt install gnupg
gpg --full-gen-key
```
* Choose RSA with 4096 bits, never expire and provide your name and email address.

## Creating a Package
* Create a container
```
mkdir helloworld
mkdir helloworld/DEBIAN
cd helloworld
```
* Create file "control" in the DEBIAN folder containing application information:
```
Package: helloworld
Version: 1.0
Maintainer: Scaremonger
Architecture: all
Description: Hello World Example
```
* Adding files to your package
Any files you add to the package will be copied using the same relative paths.
```
mkdir helloworld/usr/local/bin
cp /usr/local/bin/helloworld.sh helloworld/usr/local/bin/
```
* Build the package
```
dpkg-deb --build helloworld
```
* You can test installation using the following:
```
dpkg -i helloworld.deb
```
## Adding maintainer scripts
You can add scripts into the DEBIAN folder called: preinst, postinst, prerm and postrm, which will be executed at the appropriate time during installation. Make sure you add a shebang to the file.

## Publishing a Package
* Copy your *.deb package to the ppa folder
* Open a terminal to the repository and run the ./build.sh script using your gpg email address as an argumment; the script will do the rest.
* Publish your repository to Github

# References
* https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html
* https://www.iodigital.com/en/history/intracto/creating-debianubuntu-deb-packages


