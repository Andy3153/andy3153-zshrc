#!/bin/zsh
#      _     _       _             _
#   __| | __| | __ _| |_ ___   ___| |__
#  / _` |/ _` |/ _` | __/ _ \ / __| '_ \
# | (_| | (_| | (_| | ||  __/_\__ \ | | |
#  \__,_|\__,_|\__,_|\__\___(_)___/_| |_|
#                             by Andy3153
#
# A script that makes ddate look nicer
#

# Setting some variables
  # For the folders
    _progs=$HOME/.zsh/progs/

  # This one actually helps us with something
    _beginning=$(echo "~*. $(ddate) .*~")

# Actual centering of output
  echo
  printf "%*s\n" $(((${#_beginning}+$COLUMNS)/2)) "$_beginning" | $_progs/lolcat/bin/lolcat -t
  echo


# End of file.
