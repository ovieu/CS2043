#!/usr/bin/python

import sys
import os
import hashlib
import itertools

#take input from command line
numlines = 40
textfile = sys.argv[1]
if (len(sys.argv) > 2):
	numlines = int(sys.argv[2])
	textfile = sys.argv[3]

def readme(text):
	with open(text, 'r') as file:
		for line in itertools.islice(file, firstl, lastl):
			print line	

#hash and save for next time
def updatehash():
	m = hashlib.md5()
	m.update(textfile)
	hex = m.hexdigest()
	if (os.path.exists('.reader_rc')):
		with open('.reader_rc', 'r+') as f:
			for line in f:
				newline = line #consider split here		
		#	f.write(str(hex) + ', ' + str(firstnew)+ '    ')
	else:
		with open('.reader_rc', 'w') as f:
			f.write(str(hex) + ', ' + str(firstl))
			newline = str(hex) + ', ' + str(firstl)
	return newline

def updateline():
	with open('.reader_rc', 'w') as f:
		f.write(str(hex) + ', ' + str(firstl))

#user reads file
firstl = 0
lastl = numlines
process = updatehash()
line = process.split()
firstl = int(line[3])
lastl = firstl + numlines
readme(textfile)
instr = raw_input()
while (instr != 'q'):
	if(instr == 'n' or instr == 'p'):
		if (instr == 'n'):
			firstl = firstl + numlines
			lastl = lastl + numlines
			updateline()
		if (instr == 'p'):
			firstl = firstl - numlines
			lastl = lastl - numlines
			if (lastl < numlines):
				firstl = 0
				lastl = numlines
			updateline()
		readme(textfile)
		instr = raw_input()		
		f = open('.reader_rc', 'r')
		for line in f:
			print line
