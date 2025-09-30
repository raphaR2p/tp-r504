#!/usr/bin/python3

import signal as sig
from time import sleep
import sys
import os

def signal_handler(s, frame):
		print("reception du signal \nfin du programme", sig.Signals(s).name )
		sys.exit(0)

def signal_handler2(s, frame):
		print(" reception du signal", sig.Signals(s).name )

sig.signal(sig.SIGINT, signal_handler)
sig.signal(sig.SIGQUIT, signal_handler2)

x=1
while True:
		print ("pid=", os.getpid(), x)
		sleep(.5)
		x +=1
