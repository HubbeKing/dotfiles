#!/bin/bash
set -e

# stage updates
rpm-ostree upgrade

# remove firefox from base
rpm-ostree override remove firefox firefox-langpacks

# stage packages from bootstrap list
packages=$(cat ~/.config/dotfs/packages.lst)
rpm-ostree install --idempotent $packages

# enable steam nonfree repo
sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-steam.repo
# stage steam-devices package (needed for steam flatpak)
rpm-ostree refresh-md
rpm-ostree install --idempotent steam-devices

# add AMDGPU kernel arg for overclocking
rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff

# install flatpaks from bootstrap list
flatpaks=$(cat ~/.config/dotfs/flatpaks.lst)
flatpak install --or-update $flatpaks

# set up overrides for VSCodium
flatpak override --user com.vscodium.codium --filesystem=~/.var/app

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew packages
packages=$(cat ~/.config/dotfs/brews.lst)
brew install $packages
