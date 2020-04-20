#!/bin/zsh
#           _     __                            _         _     
# _ __ ___ | | __/ _| ___  _ __ _ __ ___   __ _| |_   ___| |__  
#| '_ ` _ \| |/ / |_ / _ \| '__| '_ ` _ \ / _` | __| / __| '_ \ 
#| | | | | |   <|  _| (_) | |  | | | | | | (_| | |_ _\__ \ | | |
#|_| |_| |_|_|\_\_|  \___/|_|  |_| |_| |_|\__,_|\__(_)___/_| |_|
#                                                    by Andy3153
#
# Uses the format script to give you formatted text you can put in your script.
# Also, you can take this as an example on how to use the format script.
#

# Sourcing the format script
  echo -e "\033[1m[ \033[1;33mmkformat.sh\033[0m ]\033[0m : Sourcing format.sh ..."
  
  if [ $(echo sdf) ]
  then echo -e "\033[1m[ \033[1;33mmkformat.sh\033[0m ]\033[0m : Script sourced succesfully."
  else echo -e "\033[1m[ \033[1;33mmkformat.sh\033[0m ]\033[0m :\033[5m \033[1mERROR! \033[0m\033[0mformat.sh not found! Exit script."
  fi

  echo
  
# Read from stdin the string
  echo -e "\033[1m[ \033[1;33mmkformat.sh\033[0m ]\033[0m : Type your string."
  echo -n "\033[0;36m>\033[0m "
  read str
  
  echo $str
  

