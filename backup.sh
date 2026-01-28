#!/bin/bash

#if user has passed the areguments or not
if [ -z "$1" ]; then
	echo "usage: $0 <Directory>"
	exit 1
fi

src="$1"

#checking if src exixts or not
if [ ! -d "$src" ]; then
	echo "Source does not exist"
	exit 1
fi


# If source exists

cd "$src" || exit 1
timestamp=$(date +%F_%H-%M-%S)
backup_dir="backup_$timestamp"

mkdir "$backup_dir"
zip -r "$backup_dir/data.zip" ./*

#Removing old backup

backup=$(ls -dt backup_* 2>/dev/null)
count=$(echo "$backup" | wc -l)
if [ $count -gt 3 ];
then
	echo "$backup" | tail -n +4 | xargs rm -rf
fi

echo "Backup completed sucessfully"

