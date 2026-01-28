#!/bin/bash


read -p "Log file: " file

wc -l "$file"
grep -i ERROR "$file" | wc -l
grep -i ERROR "$file" | tail -n 3

