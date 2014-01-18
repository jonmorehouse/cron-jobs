#!/bin/bash

# remove certain files from folders across machine
files=(
	.DS_Store
	.pyc
)

folders=(

	$HOME/Documents
	$HOME/Desktop
	$HOME/Movies
	$HOME/Pictures
)

for folder in ${folders[@]}
do
	for file in ${files[@]}
	do
		find $folder -type f -name "*$file" | xargs -I '{}' mv "{}" $HOME/.Trash
	done
done
