#!/bin/bash  
swap() {
  if [ $# -ne 2 ]; then
    echo "Usage: swap file1 file2"
  else
    local TMPFILE=$(mktemp)
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
  fi
}
swap ~/.config/polybar/config ~/.config/polybar/config-nigth
swap ~/.config/kitty/kitty.conf ~/.config/kitty/kitty-dark.conf
~/.config/polybar/launch.sh &
