#!/usr/bin/env python3
#             _           _           _                 ____
#   __ _ _ __(_)_ __   __| | ___ ___ (_)_ __  _____   _|___ \   _ __  _   _
#  / _` | '__| | '_ \ / _` |/ __/ _ \| | '_ \/ __\ \ / / __) | | '_ \| | | |
# | (_| | |  | | | | | (_| | (_| (_) | | | | \__ \\ V / / __/ _| |_) | |_| |
#  \__, |_|  |_|_| |_|\__,_|\___\___/|_|_| |_|___/ \_/ |_____(_) .__/ \__, |
#  |___/                                                       |_|    |___/
#                                 by Andy3153, slightly modified by ikeaggge
#
# Second version of Dank Memer Discord bot coin grinder.
# Made better.
# Added Windows and Mac support.
#

from os import name
from threading import Timer
from time import sleep

#
# Checks if OS is a POSIX-compliant OS (Linux/BSD) and makes
# the correct functions for typing on the screeen. Even though
# keyboard works on every OS, I went with pynput for the
# POSIX-compliant ones since keyboard requires root priviledges
# on them.
#

if name == 'posix':
  from pynput.keyboard import Key, Controller
  def typestr(string):
    Controller().press(Key.enter)
    Controller().release(Key.enter)
    Controller().type(string)
    Controller().press(Key.enter)
    Controller().release(Key.enter)

else:
  import keyboard
  def typestr(string):
    keyboard.press_and_release('return')
    keyboard.write(string)
    keyboard.press_and_release('return')

# Variables
prompt = "\033[1m[ \033[1;33mgrindcoinsv2.py\033[0m ]\033[0m : "
errprompt = "\033[1m[ \033[0;31mgrindcoinsv2.py\033[0m ]\033[0m : \033[5m \033[1mERROR! \033[0m\033[0"

# Functions
def welcome():
  print(prompt, "Welcome! Make sure you're focusing the Discord window.")
  print(prompt, "Press ENTER to continue.")

  # Waits until you press enter
  input()

  # Countdown
  print(prompt, "Starting in tres... ", end="", flush=True)
  sleep(1)
  print("dos... ", end="", flush=True)
  sleep(1)
  print("uno... ", end="", flush=True)
  sleep(1)
  print("\033[1mGO!\033[0m")

  # Warns the other people
  typestr('#### Dank Memer Coin Grinder starts ***NOW***! *TIME TO GET THOSE COINS UWU*,,,,,,,,,,,, ####')
  sleep(2)

  # Activates passive mode
  typestr("pls settings passive enable")
  print(prompt, "Activated passive mode.. though passive is for pussies.. Apologizing...")
  sleep(2)
  
  # Apologizes for setting on passive
  typestr("scz ca m-am dat pe passive asa face botul nu sunt pussy jur")
  print(prompt, "Apologized.")
  sleep(2)


# Function that executes every 60 seconds/1 minute (postmeme (dank meme))
def _60secs():
  Timer(62, _60secs).start()
  typestr("pls beg")
  print(prompt, "Begged.")

  sleep(2)
  typestr("pls fish")
  print(prompt, "Fished.")

  sleep(2)
  typestr("pls postmeme")
  print(prompt, "Posting a dank meme...")

  sleep(2)
  typestr("d")
  print(prompt, "Posted!")


# Function that executes every 600 seconds/10 minutes (deposit,
# balance, use candy, postmeme(dank meme))
def _600secs():
  Timer(600.0, _600secs).start()

  sleep(2)
  typestr("pls deposit max")
  print(prompt, "Deposited all money.")

  sleep(3)
  typestr("pls balance")
  print(prompt, "Checked balance.")

  sleep(3)
  typestr("pls use candy")
  print(prompt, "Used a candy.")


# Function that executes every 1800 seconds/30 minutes (pet pat,
# pet feed)
def _1800secs():
  Timer(1800.0, _1800secs).start()

  sleep(2)
  typestr("pls pet pat")
  print(prompt, "Patted the pet.")

  sleep(2)
  typestr("pls pet feed")
  print(prompt, "Fed the pet.")


# Function that executes every 3600 secs/1 hr (sell fish,
# sell rarefish, sell alcohol, use banknote)
# also added the ability to sell bread, pills and cookies,, you forgot that, dog
# also also deleted the ability to sell alcohol, i actually use that lol
def _3600secs():
  Timer(3600.0, _3600secs).start()

  sleep(2)
  typestr("pls sell fish 5")
  print(prompt, "Sold 5 fishes.")

  sleep(3)
  typestr("pls sell rarefish")
  print(prompt, "Sold a rare fish.")

  sleep(3)
  typestr("pls use banknote")
  print(prompt, "Used a banknote.")

  sleep(3)
  typestr("pls sell bread 5")
  print(prompt, "Sold 5 loaves of bread.")

  sleep(3)
  typestr("pls sell chill 5")
  print(prompt, "Sold 5 chill pills")

  sleep(3)
  typestr("pls sell cookie 5")
  print(prompt, "Sold 5 cookies. fuck cookiz")


# Executes actual code:
try:
  welcome()
  _60secs()
  _600secs()
  _1800secs()
  _3600secs()

except (KeyboardInterrupt, SystemExit):
  print("\n", errprompt, "KKeyboardInterrupt (Ctrl + C) received! Exiting...")
  raise
