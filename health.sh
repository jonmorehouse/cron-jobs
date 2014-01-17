#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run brew doctor once per day and ensure that all is working eelle 
output=`brew doctor`
brew_doctor_output=`cat $DIR/config/expected_brew_doctor_output`

# verify the output to our desktop flag 
if [[ "$output" != "$brew_doctor_output" ]]
then
	echo $output > $HOME/Desktop/unhealthy
else
	brew update > ~/Desktop/brew_log
fi


