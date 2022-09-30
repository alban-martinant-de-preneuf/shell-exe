#!/bin/bash

file="number_connection-"
date="$(date +%d-%m-%Y-%H:%M)"

last | grep alban | wc -l > $file

mkdir -p /home/alban/bin/Backup

tar -cf /home/alban/bin/Backup/$file.tar $file
mv /home/alban/bin/Backup/$file.tar /home/alban/bin/Backup/$file$date.tar

rm /home/alban/bin/$file