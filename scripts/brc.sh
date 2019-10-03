#!/bin/zsh
#
#  _                    _     
# | |__  _ __ ___   ___| |__  
# | '_ \| '__/ __| / __| '_ \ 
# | |_) | | | (__ _\__ \ | | |
# |_.__/|_|  \___(_)___/_| |_|
#                  by Andy3153
#
# Ok, this is an old one I made, it's the first script I
# made that I actually used for something
#
# I used to put it in my shell's rc, most likely piped to
# lolcat, and have it start everytime I opened a new
# terminal or used "clear".
#
# You can do that by adding to your existing rc a command
# that will execute this script (for example, if you have
# it in your home directory $HOME/brc.sh) and by doing an
# alias to clear (again, if you have it in your home
# directory, use alias clear="clear && $HOME/brc.sh")
#


 # Doing a small welcoming thing
   echo "Welcome back, user $USER!"
   echo "Current date and time: $(date)"
   echo "Some info about your system ($(hostname)):"


 # Some vertical space to make it look nicer
   echo


 # Starting neofetch
   neofetch


# End of file
