#!/usr/bin/env python3
#             _           _           _
#   __ _ _ __(_)_ __   __| | ___ ___ (_)_ __  ___   _ __  _   _
#  / _` | '__| | '_ \ / _` |/ __/ _ \| | '_ \/ __| | '_ \| | | |
# | (_| | |  | | | | | (_| | (_| (_) | | | | \__ \_| |_) | |_| |
#  \__, |_|  |_|_| |_|\__,_|\___\___/|_|_| |_|___(_) .__/ \__, |
#  |___/                                           |_|    |___/
#                                                    by Andy3153
#
# This Python script types by itself the Dank Memer command
# 'pls beg' every 40 seconds. It also checks balance and
# deposits coins in the bank every 10 minutes, and it also activates
# pacifist mode at start. Basically it grinds Dank Memer coins
#
# Also it is kinda my first useful Python script.
#

import time
from pynput.keyboard import Key, Controller

# Function for typing, and also pressing Enter key
def typestr(string):
  Controller().press(Key.enter)
  Controller().release(Key.enter)
  Controller().type(string)
  Controller().press(Key.enter)
  Controller().release(Key.enter)
  return

# Function for the keypresses
def run():
  typestr('pls beg')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Begging done.")
  time.sleep(3)

  typestr('pls fish')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Fishing done.")
  time.sleep(3)

  typestr('pls use candy')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Used a candy.")
  time.sleep(3)

  typestr('pls sell fish 3')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Sold a fish.")
  time.sleep(3)

  typestr('pls sell rarefish')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Sold a rare fish.")
  time.sleep(3)

  typestr('pls deposit max')
  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Depositing done.")
  time.sleep(3)

  #typestr('pls bal')
  #print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Checking balance...\n")
  #time.sleep(25)
  time.sleep(17)

  print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Begging in 5 seconds...\n")
  time.sleep(5)


# Prints startup message
print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Welcome! Make sure you're focusing the Discord window.")
print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Waiting 5 seconds...\n")
time.sleep(5)

# Warning for others idk
typestr('#### Dank Memer Coin Grinder starts ***NOW*** ####')
time.sleep(2)

# Activates passive mode
print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : Activating passive mode...")
typestr('pls settings passive enable')
time.sleep(3)

# Starts the h e l l.
print("\033[1m[ \033[1;33 grindcoins.py\033[0m ]\033[0m : START!\n")
time.sleep(1)
while True:
  run()
