import os, glob

tmp_dir = "tmp_msvcr90"
dll_name = "msvcr90.dll"
os.chdir(os.path.dirname(os.path.realpath(__file__)))

def restore():
    """TODO: Docstring for restore.
    :returns: TODO

    """
    for root, dirs, files in os.walk(tmp_dir):
        for file in files:
            if file == dll_name:
                path = os.path.join(root, file)
                dest = "C:\\" + path[(len(tmp_dir) + 1):]
                os.rename(path, dest)

restore()
