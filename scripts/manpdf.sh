#!/bin/bash
#                                  _  __ 
#  _ __ ___   __ _ _ __  _ __   __| |/ _|
# | '_ ` _ \ / _` | '_ \| '_ \ / _` | |_ 
# | | | | | | (_| | | | | |_) | (_| |  _|
# |_| |_| |_|\__,_|_| |_| .__/ \__,_|_|  
#                       |_| 
#                             by Andy3153
#
# I made this so I can read manpages in a PDF reader. Not 
# really useful, was fun to make though, as most things
# in this repo.
#

# Defining variables
  # For the manpage name
    manname="manpage-$1-$(date +"%d.%m.%y~%H:%M:%S").pdf"

  # For the folder it will be placed on
    manfolder="/tmp/manpdf"

# Making the folder the manpage will be stored in
  if [ -e $manfolder ]
     then echo " Directory already exists, skipping..." 
     else mkdir $manfolder
  fi

# Putting the contents for the manpage in it
  man -Tpdf $1 > "$manfolder/$manname"

# Reading the manpage with a PDF reader
  evince "$manfolder/$manname" &

# Exit this script
  exit


# End of file
