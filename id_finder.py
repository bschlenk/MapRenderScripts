#!/usr/bin/python

infile = "output.txt"
id_set = set()

with open(infile, 'r') as f:
	for line in f:
		pieces = line.split()
		if len(pieces) < 2:
			continue
		if pieces[0] == 'id':
			id_set.add(pieces[1])

for x in id_set:
	print x
	
