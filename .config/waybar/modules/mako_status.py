#!/usr/bin/env python3
import sys
import json
import os.path 

def write_output(status):
    if status == True:
        text = 'activated'
    else:
        text = 'deactivated'

    output = {'text': text,
              'class': 'custom-do-not-disturb',
              'alt': 'do-not-disturb'}

    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()

def check_status():
    # I use a crappy solution, a temp file in the home dir since mako 
    # doesn't keep track of it's status.
    # If the file is there dnd is on, if it's missing dnd is off.
    return os.path.exists(os.path.join(os.path.expanduser('~'), '.mako_dnd_toggle'))

def main():
    status = check_status()
    write_output(status)

if __name__ == '__main__':
    main()

