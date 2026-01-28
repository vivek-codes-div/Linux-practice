#!/bin/bash

#This script will help to the file permission

read -p "File name ? " file

ls -l "$file"
[ -x "$file" ] && echo "Excutable" || echo "Non-excutable"
