#
# ~/.bashrc
#

alias dotfs='/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias flash='sudo dd bs=64k oflag=dsync status=progress'
alias jdmesg='journalctl --dmesg --output=short-monotonic --no-hostname --pager-end'
alias ls='ls --color=auto'
alias units='units --verbose'
alias virsh='virsh -c qemu:///system'
alias yt-dlp='yt-dlp --embed-subs'

export SOPS_AGE_RECIPIENTS="age1j80wssnp7v6kxuga65pua3utmza4y50w243sntfyncynhp6fwpuqxkx7lc"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/go/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
