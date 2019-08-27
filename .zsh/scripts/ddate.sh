#!/bin/zsh

# ddate.sh by Andy3153
# A script that makes ddate look nicer
# I got the idea to do this when I used a "Linux on a floppy" operating system called TOMSRTBT on a Pentium 2 and I saw when you logged in it would start ddate and the date format seemed funny, and I just wanted it on my terminals
# So, I decided to make it better!

  # Setting a variable so it is all cleaner
  beginning=$(echo "~*. $($HOME/.zsh/programs/ddate/ddate) .*~")

  # Putting some vertical spaces
  echo

  # Making it centered
  printf "%*s\n" $(((${#beginning}+$COLUMNS)/2)) "$beginning" | lolcat -t

  # Another vertical space
    echo

# Also note that if there is a celebration it will work only partially, it will center the part where it says "Today is...", but the "Celebrate..." part will show up normally, witout being centered, and it will also take the small character decoration I put with it
# I'm a begginer at scripting, I don't know how to center the "Celebrate..." part thing too. ._. I mean, I took the part where it centers your output off of the internet

# End of file 
