#!/usr/bin/env python3
#  ___ _ __   __ _ _ __ ___    _ __  _   _
# / __| '_ \ / _` | '_ ` _ \  | '_ \| | | |
# \__ \ |_) | (_| | | | | | |_| |_) | |_| |
# |___/ .__/ \__,_|_| |_| |_(_) .__/ \__, |
#     |_|                     |_|    |___/
#                               by Andy3153
#
# Spams shit you make it spam.
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
prompt = "\033[1m[ \033[1;33mspam.py\033[0m ]\033[0m : "
errprompt = "\033[1m[ \033[0;31mspam.py\033[0m ]\033[0m : \033[5m \033[1mERROR! \033[0m\033[0"
spamtxt = "sampletextxd"
spaminterval = "2"

# Functions
def welcome():
  print(prompt, "Welcome!")
  print(prompt, "Please type what you want to spam: ", end="", flush=True)
  global spamtxt
  spamtxt = input()

  print(prompt, "Type once every how many seconds you want it to repeat: ", end="", flush=True)
  global spaminterval
  try:
    spaminterval = float(input())
  except ValueError:
    print(prompt, "Not a number!")

  #print("\n")
  print(prompt, "Now, make sure you're focusing the window you want to spam in.")
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
  #typestr('#### PREPARE FOR SPAM ####')
  sleep(2)

def spam():
  Timer(spaminterval, spam).start()
  typestr(spamtxt)
  print(prompt, "Spamming...")

try:
  welcome()
  spam()
except (KeyboardInterrupt, SystemExit):
  print("\n", errprompt, "KKeyboardInterrupt (Ctrl + C) received! Exiting...")
  raise
