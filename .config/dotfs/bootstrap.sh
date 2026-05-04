#!/bin/bash
set -e

# stage updates
rpm-ostree upgrade

# add terra.pkg repo
curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo | sudo tee /etc/yum.repos.d/terra.repo
rpm-ostree install --idempotent terra-release

# stage packages from bootstrap list
packages=$(cat ~/.config/dotfs/packages.lst)
rpm-ostree install --idempotent $packages

# add AMDGPU kernel arg for overclocking
rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff

# install flatpaks from bootstrap list
flatpaks=$(cat ~/.config/dotfs/flatpaks.lst)
flatpak install --or-update $flatpaks

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install brew packages
packages=$(cat ~/.config/dotfs/brews.lst)
brew install $packages
