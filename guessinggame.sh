#!/usr/bin/env bash
# File: guessinggame.sh


function fileguess {
	echo "How many files are in the current directory?"
	echo "What is your guess?: "
	read guess
}

filecount=$( ls -al | egrep "^-.*" | wc -l)

while true
do

	fileguess

	if [[ $guess =~ [^0-9] ]]
	then
		echo "You entered: $guess. Your answer is not a valid number. Please try again"
		continue
	elif [[ $guess -gt $filecount ]]
	then
		echo "You entered: $guess. Your guess is too high. Please try again."
		continue
	elif [[ $guess -lt $filecount ]]
	then
		echo "You entered: $guess. Your guess is too low. Please try again."
		continue
	else
		if [[ $guess -eq $filecount ]]
		then
			echo "You entered: $guess. Your answer is correct! Congratulations!"
			exit
		fi
	fi
done
