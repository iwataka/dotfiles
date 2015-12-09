#!/usr/bin/env python

# This is used to remove all msvcr90.dll (Microsoft Visual C++ Runtime) in PATH
# and restore vice versa.

import os, glob, string, sys, platform
import subprocess as sub
from distutils.dir_util import mkpath

# This is for only Windows
if platform.system().lower() != "windows":
    raise Exception("""
        This script is for only WINDOWS!
    """)

# Requires one or more command-line arguments
if len(sys.argv) < 2:
    raise Exception("""
        Usage: msvcr90.py command [directory]
        The `command` is either `remove` or `restore`.
    """)

# First argument specifies the command to be executed
command = sys.argv[1]

# Second argument specifies the temporary directory you use
if len(sys.argv) > 2:
    tmp_dir = sys.argv[2]
else:
    home = os.environ['USERPROFILE']
    tmp_dir = os.path.join(home, ".tmp_msvcr90")

# Global variables
dll_name = "msvcr90.dll"
drive_name = "C:\\"

def mkdir_if_not_exists(dir):
    """Makes the specified directory if it doesn't exist.
    :dir: The directory name to be created.
    :returns: None
    """
    if not os.path.isdir(dir):
        mkpath(dir)

def remove():
    """Moves all msvcr90.dll in PATH into the temporary directory.
    :returns: None
    """
    mkdir_if_not_exists(tmp_dir)
    p = sub.Popen("where " + dll_name, stdout = sub.PIPE, stderr = sub.PIPE)
    output, err = p.communicate()
    for path in string.split(output, "\n"):
        path = path.strip()
        if path != "":
            dest = os.path.join(tmp_dir, path[len(drive_name):])
            dest_dir = os.path.dirname(dest)
            mkdir_if_not_exists(dest_dir)
            os.rename(path, dest)

def restore():
    """Restores all msvcr90.dll in the temporary directory.
    :returns: None
    """
    for root, dirs, files in os.walk(tmp_dir):
        for file in files:
            if file == dll_name:
                path = os.path.join(root, file)
                dest = drive_name + path[(len(tmp_dir) + 1):]
                os.rename(path, dest)

# Exeutes the command specified above.
if command == "remove":
    remove()
elif command == "restore":
    restore()
else:
    raise Exception("remove or restore is needed")
