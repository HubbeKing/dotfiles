#
# ~/.bashrc
#
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias flash='sudo dd bs=4M conv=fsync oflag=direct status=progress'
alias jdmesg='journalctl --dmesg --output=short-monotonic --no-hostname --pager-end'
alias ls='ls --color=auto'
alias mpc='mpc --host=192.168.1.7'
alias pacdiff='sudo DIFFPROG=meld pacdiff'
alias pacrepo='sudo reflector --verbose --country Finland --country Germany --country Sweden --protocol https --age 24 --sort rate --latest 10 --download-timeout 5 --save /etc/pacman.d/mirrorlist'
alias units='units --verbose'
alias virsh='virsh -c qemu:///system'
alias weechat='kubectl exec -it deployments/weechat -c weechat -- ./attach.sh'

export SOPS_AGE_RECIPIENTS="age1j80wssnp7v6kxuga65pua3utmza4y50w243sntfyncynhp6fwpuqxkx7lc"

PS1='[\u@\h \W]\$ '

# source nvm if nvm installed
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi

# source completions
source ~/.config/bash_completion/*

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
