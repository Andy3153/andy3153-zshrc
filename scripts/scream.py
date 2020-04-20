#!/usr/bin/env python3
#  ___  ___ _ __ ___  __ _ _ __ ___    _ __  _   _
# / __|/ __| '__/ _ \/ _` | '_ ` _ \  | '_ \| | | |
# \__ \ (__| | |  __/ (_| | | | | | |_| |_) | |_| |
# |___/\___|_|  \___|\__,_|_| |_| |_(_) .__/ \__, |
#                                     |_|    |___/
#                                       by Andy3153
#
# Spams shit. Right now it spams to play the
# screaming effect on Discord
#

import time
from pynput.keyboard import Key, Controller

# Function for typing, and also pressing Enter key
def typestr(string):
  Controller().type(string)
  Controller().press(Key.enter)
  Controller().release(Key.enter)
  return

def run():
  typestr('!play Man Screaming Sound Effect (CEEDAY)')
  print("\033[1m[ \033[1;33 scream.py\033[0m ]\033[0m : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
  time.sleep(2.5)
  return

# Prints startup message
print("\033[1m[ \033[1;33 scream.py\033[0m ]\033[0m : Welcome! Make sure you're focusing the Discord window.")
print("\033[1m[ \033[1;33 scream.py\033[0m ]\033[0m : Waiting 5 seconds...\n")
time.sleep(5)

# Warning for others idk
typestr('#### PREPARE TO SCREAM ####')

# Starts the h e l l.
print("\033[1m[ \033[1;33 scream.py\033[0m ]\033[0m : START!\n")

while True:
  run()
