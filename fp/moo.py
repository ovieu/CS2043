#! /usr/bin/env python

import sys
import os
import hashlib
import itertools
import socket
import SocketServer
from random import random

#   1. The computer selects four random digits (0 to 9).
#   2. The player attempts to guess these digits, in order.
#   3. The computer gives the player information as to the correctness
      of his guess.
#   a. For every digit guessed in order, a "Bull" is scored.
#   b. For every digit guessed out of order, a "Cow" is scored.
#   4. The player continues making guesses until four Bulls are scored
      indicating that he has guessed all four digits correctly.#

numbers = []
cows import random
 
digits = '123456789'
size = 4
chosen = ''.join(random.sample(digits,size))
#print chosen # Debug
print '''I have chosen a number from %s unique digits from 1 to 9 arranged in a random order.
You need to input a %i digit, unique digit number as a guess at what I have chosen''' % (size, size)
guesses = 0
while True:
    guesses += 1
    while True:
        # get a good guess
        guess = raw_input('\nNext guess [%i]: ' % guesses).strip()
        if len(guess) == size and \
           all(char in digits for char in guess) \
           and len(set(guess)) == size:
            break
        print "Problem, try again. You need to enter %i unique digits from 1 to 9" % size
    if guess == chosen:
        print '\nCongratulations you guessed correctly in',guesses,'attempts'
        break
    bulls = cows = 0
    for i in range(size):
        if guess[i] == chosen[i]:
            bulls += 1
        elif guess[i] in chosen:
            cows += 1
    print '  %i Bulls\n  %i Cows' % (bulls, cows)

# Echo server program
import socket
HOST = ’’      # Symbolic name meaning the local host
PORT = 424242  # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print ’Connected by’, addr
while 1:
    data = conn.recv(1024)
    if not data: break
    conn.send(data)
conn.close()

if guess==chosen
	x = 'WIN'
else
	x = '  %i Bulls\n  %i Cows'

# Echo client program
import socket
HOST = ’myhostname.domain’# The remote host
PORT = 424242      # The same port as used by the server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
s.send(x)
data = s.recv(1024)
s.close()
print ’Received’, repr(data)

