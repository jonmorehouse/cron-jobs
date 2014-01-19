#!/usr/local/bin/zsh

# bootstrap environment so we can grab our brew
. $HOME/.zshrc
. $HOME/.ssh/environment 

# set up current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run brew doctor once per day and ensure that all is working eelle 
output=`brew doctor 2>&1`
brew_doctor_output=`cat $DIR/config/expected_brew_doctor_output`

# verify the output to our desktop flag 
if [[ "$output" != "$brew_doctor_output" ]]
then
	echo $output > $HOME/Desktop/unhealthy

else
	# system is healthy
	echo "healthy" >> $HOME/Desktop/healthy

	# now lets output the update output to our machines as needed
	output=`brew update 2>&1`

	# grab the expected output
	expected_output=`cat $DIR/config/expected_brew_update_output`

	if [[ "$output" != "$expected_output" ]]
	then
		echo $output >> $HOME/Desktop/log
	fi
fi

