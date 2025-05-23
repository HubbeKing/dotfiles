#!/bin/bash
set -e

# swap versioned rpmfusion packages for in-repository ones for easier upgrades
sudo rpm-ostree update --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release --install rpmfusion-free-release --install rpmfusion-nonfree-release

# set up codecs and install full ffmpeg
rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld
rpm-ostree install gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi
rpm-ostree override remove libavcodec-free libavdevice-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free ffmpeg-free --install ffmpeg
