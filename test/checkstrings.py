#!/usr/bin/env python3
from time import sleep
from threading import Timer
from pynput.keyboard import Key, Controller

prompt = "\033[1m[ \033[1;33mgrindcoinsv2.py\033[0m ]\033[0m : "

def typestr(string):
  Controller().press(Key.enter)
  Controller().release(Key.enter)
  Controller().type(string)
  Controller().press(Key.enter)
  Controller().release(Key.enter)

def _40secs():
  Timer(40.1, _40secs).start()
  typestr("pls beg")
  print(prompt, "Begged.")

  sleep(2)
  typestr("pls fish")
  print(prompt, "Fished.")

  sleep(33)
  print(prompt, "Begging in 5 seconds...")

_40secs()
