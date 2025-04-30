#!/bin/bash
set -e

# stage updates
rpm-ostree upgrade

# stage packages from bootstrap list
packages=$(cat ~/.config/dotfs/packages.lst)
rpm-ostree install --idempotent $packages

# enable steam nonfree repo
sudo sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-steam.repo
# stage steam-devices package (needed for steam flatpak)
rpm-ostree refresh-md
rpm-ostree install --idempotent steam-devices

# set up k9s copr repo
wget https://copr.fedorainfracloud.org/coprs/luminoso/k9s/repo/fedora-42/luminoso-k9s-fedora-42.repo
sudo mv luminoso-k9s-fedora-42.repo /etc/yum.repos.d/
# stage k9s package
rpm-ostree install --idempotent k9s

# set up lact copr repo
wget https://copr.fedorainfracloud.org/coprs/ilyaz/LACT/repo/fedora-42/ilyaz-LACT-fedora-42.repo
sudo mv ilyaz-LACT-fedora-42.repo /etc/yum.repos.d/
# stage lact package
rpm-ostree install --idempotent lact
# add AMDGPU kernel arg for overclocking
rpm-ostree kargs --append-if-missing=amdgpu.ppfeaturemask=0xffffffff

# install flatpaks from bootstrap list
flatpaks=$(cat ~/.config/dotfs/flatpaks.lst)
flatpak install --or-update $flatpaks

# set up overrides for VSCodium
flatpak override --user com.vscodium.codium --filesystem=~/.var/app

# install OrcaSlicer
wget https://github.com/SoftFever/OrcaSlicer/releases/download/v2.3.0/OrcaSlicer-Linux-flatpak_V2.3.0_x86_64.flatpak
flatpak install --or-update ./OrcaSlicer-Linux-flatpak_V2.3.0_x86_64.flatpak

# set up rpmfusion repos
# this needs to be done last, before reboot, because it breaks the md-refresh steps of rpm-ostree
# https://rpmfusion.org/Howto/OSTree
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Bootstrap complete - Please reboot system, and then run .config/dotfs/post-reboot.sh"
