#!/bin/bash

<<Help

This script will help to find files

Help

read -p "What is your file name ?" file

if [ -f "$file" ];
then
	echo "File exists"
else
	echo "File does not exist"
fi
