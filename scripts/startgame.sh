#!/usr/bin/env bash
#
# startgame.sh; Andy3153
# 08/06/20 ~ 12:41:59
#

while [ $1 ]; do
  case $1 in
    '--launch' | '-l' )
    killall latte-dock cava tilda kdeconnectd
    exit
    ;;

    '--exit' | '-e' )
    latte-dock
    tilda -c cava
    kdeconnect-indicator
    disown
    exit
    ;;
  esac
  shift
done

echo "No argument. Exiting..."
return 1
exit
