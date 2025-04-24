#!/bin/bash

# stage updates
rpm-ostree upgrade

# stage packages from bootstrap list
packages=$(cat ~/.config/bootstrap/packages.lst)
rpm-ostree install $packages

# enable steam nonfree repo
sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-steam.repo
# stage steam-devices package (needed for steam flatpak)
rpm-ostree refresh-md
rpm-ostree install steam-packages

# set up rpmfusion repos
# https://rpmfusion.org/Howto/OSTree
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# set up vscodium repo
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
# stage vscodium package
rpm-ostree install codium

# set up k9s copr repo
wget https://copr.fedorainfracloud.org/coprs/luminoso/k9s/repo/fedora-42/luminoso-k9s-fedora-42.repo
sudo mv luminoso-k9s-fedora-42.repo /etc/yum.repos.d/
# stage k9s package
rpm-ostree install k9s

# set up lact copr repo
wget https://copr.fedorainfracloud.org/coprs/ilyaz/LACT/repo/fedora-42/ilyaz-LACT-fedora-42.repo
sudo mv ilyaz-LACT-fedora-42.repo /etc/yum.repos.d/
# stage lact package
rpm-ostree install lact
# add AMDGPU kernel arg for overclocking
rpm-ostree kargs --append=amdgpu.ppfeaturemask=0xffffffff

# install flatpaks from bootstrap list
flatpaks=$(cat ~/.config/bootstrap/flatpaks.lst)
flatpak install $flatpaks

# install OrcaSlicer
wget https://github.com/SoftFever/OrcaSlicer/releases/download/v2.3.0/OrcaSlicer-Linux-flatpak_V2.3.0_x86_64.flatpak
flatpak install ./OrcaSlicer-Linux-flatpak_V2.3.0_x86_64.flatpak

echo "Bootstrap complete - Please reboot system, and then run .config/dotfs/post-reboot.sh"
