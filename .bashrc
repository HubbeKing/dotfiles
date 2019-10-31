#
# ~/.bashrc
#
alias ls='ls --color=auto'
alias pacrepo='sudo reflector --country Finland --country Germany --country Sweden --age 24 --protocol https --protocol ftp --sort rate --save /etc/pacman.d/mirrorlist'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias dc='docker-compose'
alias diskmon='watch -n 1 iostat -xy --human 1 1'
alias conv_music='beet convert -a'

PS1='[\u@\h \W]\$ '
