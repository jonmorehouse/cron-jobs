#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/config/config.sh

if [ ! -f $history_file ]
then
	echo "Invalid history file path"
fi

for keyword  in ${history_keywords[@]}
do
	# remove all lines that have this word on them
	grep -n "$keyword" $history_file | awk '{ split($0,a,"::"); print a[1] }' | awk -v history_file=$history_file '{ print "gsed -i \"" $1 "d\" " history_file }' | xargs -I '{}' -t sh -c "eval {}"
done

