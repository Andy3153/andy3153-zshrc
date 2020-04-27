#!/usr/bin/env python3
#             _           _           _                 ____
#   __ _ _ __(_)_ __   __| | ___ ___ (_)_ __  _____   _|___ \   _ __  _   _
#  / _` | '__| | '_ \ / _` |/ __/ _ \| | '_ \/ __\ \ / / __) | | '_ \| | | |
# | (_| | |  | | | | | (_| | (_| (_) | | | | \__ \\ V / / __/ _| |_) | |_| |
#  \__, |_|  |_|_| |_|\__,_|\___\___/|_|_| |_|___/ \_/ |_____(_) .__/ \__, |
#  |___/                                                       |_|    |___/
#                                                                by Andy3153
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
  print(prompt, "Starting in 3... ", end="", flush=True)
  sleep(1)
  print("2... ", end="", flush=True)
  sleep(1)
  print("1... ", end="", flush=True)
  sleep(1)
  print("\033[1mGO!\033[0m")

  # Warns the other people
  typestr('#### Dank Memer Coin Grinder starts ***NOW!*** ####')
  sleep(2)

  # Activates passive mode
  typestr("pls settings passive enable")
  print(prompt, "Activated passive mode.")
  sleep(2)


# Function that executes every 40 seconds (beg, fish)
def _40secs():
  Timer(40.1, _40secs).start()
  typestr("pls beg")
  print(prompt, "Begged.")

  sleep(2)
  typestr("pls fish")
  print(prompt, "Fished.")


# Function that executes every 600 seconds/10 minutes (deposit,
# balance, use candy)
def _600secs():
  Timer(600.0, _600secs).start()

  sleep(2)
  typestr("pls deposit max")
  print(prompt, "Deposited all money.")

  sleep(2)
  typestr("pls balance")
  print(prompt, "Checked balance.")

  sleep(2)
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
def _3600secs():
  Timer(3600.0, _3600secs).start()

  sleep(2)
  typestr("pls sell fish 15")
  print(prompt, "Sold 15 fishes.")

  sleep(2)
  typestr("pls sell rarefish")
  print(prompt, "Sold a rare fish.")

  sleep(2)
  typestr("pls sell alcohol")
  print(prompt, "Sold an alcohol bottle.")

  sleep(2)
  typestr("pls use banknote")
  print(prompt, "Used a banknote.")



# Executes actual code:
try:
  welcome()

  _40secs()
  
  sleep(600)
  _600secs()

  sleep(1200)
  _1800secs()

  sleep(1800)
  _3600secs()

except (KeyboardInterrupt, SystemExit):
  print("\n", errprompt, "KKeyboardInterrupt (Ctrl + C) received! Exiting...")
  raise
