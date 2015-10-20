# Contributing Guide

## Shell Script

### Find out which directory the script file resides.

just like this:

```bash
script_dir=$(dirname $0)
abs_script_dir=$(cd $script_dir && pwd)
```

### Extract filename and extension in Bash (from [here](http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash))

```bash
filename=${basename "$fullfile"}
extension="${filename##*.}"
without_extension="${filename%.*}"
rootname="${fullfile##*/}"
```
