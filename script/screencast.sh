#!/bin/sh
mkv_out=/tmp/screencast.mkv
gif_out=/tmp/screencast.gif
pal_out=/tmp/screenpal.png
pkill ffmpeg && exit 0
sleep 1
xrectsel |\
awk '{split($0,x,"+");print x[1],x[2],x[3]}' |\
xargs -n3 sh -c 'ffmpeg -y -f x11grab -s $0 -framerate 25 -i $DISPLAY+$1,$2 '$mkv_out\
';notify-send "Screencast complete!" "Converting to gif ..."'\
';ffmpeg -y -i '$mkv_out' -vf fps=25,palettegen '$pal_out\
';ffmpeg -y -i '$mkv_out'  -i '$pal_out' -filter_complex "fps=15,paletteuse" '$gif_out
notify-send "GIF created!" "$gif_out"
