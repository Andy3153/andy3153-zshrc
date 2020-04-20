#!/bin/zsh
#                                  _  __      _
#  _ __ ___   __ _ _ __  _ __   __| |/ _| ___| |__
# | '_ ` _ \ / _` | '_ \| '_ \ / _` | |_ / __| '_ \
# | | | | | | (_| | | | | |_) | (_| |  _|\__ \ | | |
# |_| |_| |_|\__,_|_| |_| .__/ \__,_|_|(_)___/_| |_|
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
    manfolder="/tmp/manpdf.sh/$USER/"

# Making the folder the manpage will be stored in
  if [ -e $manfolder ]
     then echo -e "\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m : Directory already exists, skipping..."
     else mkdir -p -m 777 $manfolder
  fi

# Making folder globally readable
  chmod a+rwx $manfolder

# Putting the contents for the manpage in it
  man -Tpdf $1 1> "$manfolder/$manname" 2> /dev/null

  if [ ! $(find $manfolder -empty -name $manname) ]
  then
       # Reads the manpage with the default PDF viewer
         echo -e "\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m : Opening PDF..."
         xdg-open "$manfolder/$manname" &

       # Exits script
         echo -e "\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m : Done! Exit script."
         exit
  else
       # Script errors out
         echo -e "\033[1m[ \033[1;33mmanpdf.sh\033[0m ]\033[0m :\033[5m \033[1mERROR! \033[0m\033[0mmanpage doesn't exist! Exit script."
         exit
  fi


# End of file
