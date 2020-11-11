#
# ~/.bashrc
#
alias diskmon='watch -n 1 iostat -xy --human 1 1'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ls='ls --color=auto'
alias mpc='mpc --host=192.168.1.7'
alias pacrepo='sudo reflector --country Finland --country Germany --country Sweden --protocol https --age 48 --sort rate --save /etc/pacman.d/mirrorlist'
alias typepaste='sleep 2 && xdotool type --delay 100 "$(xclip -selection clipboard -o)"'
alias weechat='mosh hubbe.club -- /home/hubbe/scripts/weechat.sh'
alias workon='mv /home/hubbe/.ssh/work_config /home/hubbe/.ssh/config'
alias workoff='mv /home/hubbe/.ssh/config /home/hubbe/.ssh/work_config'

export SOPS_PGP_FP="74B91EB9898B2ADB9A9E488A7C60FBD151BFFC9E"

PS1='[\u@\h \W]\$ '
