#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/config/config.sh

# generate today's date
today=`TZ=PST date +%m-%d-%y`

for folder in ${folders[@]}
do
	# make sure that we have a valid rsync element as needed here
	if [ ! -d $folder ] 
	then
		continue
	fi

	#generate the destination name	
	destination=`echo $folder | awk '{n=split($1, a, "/")} END{print a[n]}'`

	# make sure the destinatino exists
	if [ ! -d $HOME/Dropbox/$destination ]
	then

		mkdir $HOME/Dropbox/$destination
	fi

	# make sure we use the correct exclude file
	if [ -f $DIR/config/$destination-exclude ]
	then
		exclude_file=$DIR/config/$destination-exclude

	else
		exclude_file=$DIR/config/exclude

	fi

	# generate log-file destination
	log_file=$DIR/logs/$today-$destination.log

	# now go ahead and do a dry run for all the commands that need to be linked etc
	# this is my personal run script -- I would recommend running --list-only first!
	rsync -r --delete --exclude-from=$exclude_file --log-file=$log_file $folder/* $HOME/Dropbox/$destination
done
