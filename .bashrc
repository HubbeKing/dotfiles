#
# ~/.bashrc
#
alias conv_music='beet convert -a'
alias dc='docker-compose'
alias diskmon='watch -n 1 iostat -xy --human 1 1'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ls='ls --color=auto'
alias mpv='mpv --hwdec=auto'
alias pacrepo='sudo reflector --country Finland --country Germany --country Sweden --age 24 --protocol https --protocol ftp --sort rate --save /etc/pacman.d/mirrorlist'
alias weechat='mosh hubbe.club -- /home/hubbe/scripts/weechat.sh'

PS1='[\u@\h \W]\$ '

