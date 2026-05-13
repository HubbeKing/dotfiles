#!/bin/bash
set -e

# enable docker-ce repo
sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/docker-ce.repo
# enable vscode repo
sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/vscode.repo

# upgrade base OS
rpm-ostree upgrade

# overlay dev packages
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
