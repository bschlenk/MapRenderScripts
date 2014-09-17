#!/usr/bin/env python

"""
The setup file
"""

import os, sys
import subprocess

__dirname__ = os.path.dirname(os.path.realpath(__file__))
CRONJOB_CONFIG = os.path.join(__dirname__, 'cronjobs')

if not 'EMAIL_ADDRESS' in os.environ:
	os.environ['EMAIL_ADDRESS'] = ''

if not 'LIB_DIR' in os.environ:
	os.environ['LIB_DIR'] = os.path.join(__dirname__, 'lib')

if not 'LOG_DIR' in os.environ:
	os.environ['LOG_DIR'] = os.path.join(__dirname__, 'log')

if not 'CONFIG_FILE' in os.environ:
	os.environ['CONFIG_FILE'] = os.path.join(__dirname__, 'config')

os.environ['PROG'] = sys.argv[0]


def install_cronjobs():
	with open(CRONJOB_CONFIG) as f:
		data = f.read()
	data = data.format(**os.environ)
	print data
	proc = subprocess.Popen(['crontab'], stdin=subprocess.PIPE)
	proc.communicate(data)
	return proc.returncode


def main():
	install_cronjobs()

if __name__ == '__main__':
	main()
