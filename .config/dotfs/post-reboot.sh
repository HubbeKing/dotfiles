#!/bin/bash
set -e

# set up software codecs
rpm-ostree install \
        gstreamer1-plugin-libav \
        gstreamer1-plugins-bad-free-extras \
        gstreamer1-plugins-bad-freeworld \
        gstreamer1-plugins-ugly \
        gstreamer1-vaapi \
        --allow-inactive

# install full proper ffmpeg with non-free codecs
rpm-ostree override remove \
             fdk-aac-free \
             libavcodec-free \
             libavdevice-free \
             libavfilter-free \
             libavformat-free \
             libavutil-free \
             libpostproc-free \
             libswresample-free \
             libswscale-free \
             ffmpeg-free \
             --install ffmpeg

# swap versioned rpmfusion packages for in-repository ones for easier upgrades
sudo rpm-ostree update --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release --install rpmfusion-free-release --install rpmfusion-nonfree-release
