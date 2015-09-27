# ShellScript Guide

## Extract filename and extension in Bash (from [here](http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash))

```bash
filename=${basename "$fullfile"}
extension="${filename##*.}"
without_extension="${filename%.*}"
rootname="${fullfile##*/}"
```
