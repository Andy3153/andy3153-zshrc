#!/usr/bin/env zsh
##
## ddate.sh by Andy3153
## created too_lazy_to_check_might_do_later
## remade  26/10/20 ~ 23:28:43
##

# Variables
  _ddateshPrintedText=$(printf "~*. $(ddate) .*~")

# Centering the text
  printf "\n"
  printf  "%*s\n" $(((${#_ddateshPrintedText}+$COLUMNS)/2)) "$_ddateshPrintedText" \n | lolcat -t


## End of file.
