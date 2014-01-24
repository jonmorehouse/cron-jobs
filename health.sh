#!/usr/local/bin/zsh

# bootstrap environment so we can grab our brew
. $HOME/.zshrc
. $HOME/.ssh/environment 

# set up current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run brew doctor once per day and ensure that all is working eelle 
brew doctor 2>>$HOME/Desktop/unhealthy
brew update 2>>$HOME/Desktop/unhealthy

