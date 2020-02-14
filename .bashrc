#
# ~/.bashrc
#
alias conv_music='beet convert -a'
alias dc='docker-compose'
alias diskmon='watch -n 1 iostat -xy --human 1 1'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ls='ls --color=auto'
alias mpc='MPD_HOST=valkyrie.local MPD_PORT=30060 mpc'
alias mpv='mpv --hwdec=auto'
alias pacrepo='sudo reflector --country Finland --country Germany --country Sweden --protocol https --protocol rsync --age 24 --sort rate --save /etc/pacman.d/mirrorlist'
alias streamlink='streamlink --player="mpv --hwdec=auto" --player-passthrough hls'
alias weechat='mosh hubbe.club -- /home/hubbe/scripts/weechat.sh'

export SOPS_PGP_FP="936E0D27CC44F2E780AD4397CC2FB121243FEF14"

PS1='[\u@\h \W]\$ '
