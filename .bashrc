#
# ~/.bashrc
#
alias bdf='sudo btrfs filesystem df /'
alias blist='sudo btrfs-list -s'
alias cp='cp --reflink=auto'
alias diskmon='watch -n 1 iostat -xy --human 1 1'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias flash='sudo dd bs=4M conv=fsync oflag=direct status=progress'
alias jdmesg='journalctl --dmesg --output=short-monotonic --no-hostname --pager-end'
alias ls='ls --color=auto'
alias mpc='mpc --host=192.168.1.7'
alias pacdiff='sudo DIFFPROG=meld pacdiff'
alias pacrepo='sudo reflector --country Finland --country Germany --country Sweden --protocol https --age 24 --sort rate --number 10 --save /etc/pacman.d/mirrorlist'
alias usage='sudo btrfs filesystem usage /'
alias virsh='virsh -c qemu:///system'
alias vpn='grep password ~/.samba|cut -d"=" -f2|sudo openconnect --config ~/.vpn.conf'
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
