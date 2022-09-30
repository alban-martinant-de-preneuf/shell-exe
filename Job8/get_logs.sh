#!/bin/bash

file=("number_connection-$(date +%d-%m-%Y-%H:%M)")

last | grep alban | wc -l > $file

mkdir -p /home/alban/Documents/Development/shell-exe/Job8/Backup

tar -cf /home/alban/Documents/Development/shell-exe/Job8/Backup/$file.tar $file

rm $file 