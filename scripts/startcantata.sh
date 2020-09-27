#!/usr/bin/env/zsh
# startcantata.sh
# by Andy3153
# on 08/09/20 ~ 12:55:58

systemctl --user start mpd.service && \
#notify-send 'Music Player Init' 'MPD Daemon started!' --icon=dialog-notification && \
/home/andy3153/.local/bin/mpd-discord-rpc & #&& \
#notify-send 'Music Player Init' 'mpd-discord-rpc started!' --icon=dialog-notification & \
cantata

killall /home/andy3153/.local/bin/mpd-discord-rpc #&& \
#notify-send 'Music Player Init' 'mpd-discord-rpc stopped!' --icon=dialog-notification
systemctl --user stop mpd.service #&& \
#notify-send 'Music Player Init' 'MPD Daemon stopped!' --icon=dialog-notification
