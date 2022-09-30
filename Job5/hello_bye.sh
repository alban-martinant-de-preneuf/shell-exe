#!/bin/bash

if [ $1 = "Hello" ]
then
	echo "bonjour ....."
elif [ $1 = "Bye" ]
then
	echo "Au revoir ....."
else
	echo "Paramêtre incorrecte !"
fi
