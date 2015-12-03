#!/bin/bash

# PARAMETERS
PROJECT_NAME=${PWD##*/}		# to assign to a variable
SERVER_NAMES=("MI_4" "MI_6")
COMMIT=$1

# SET CONFIG PARAMS
git config --global user.email "donmikebautista@gmail.com"
git config --global user.name "donmikeazul"

# ADD
git add --all

# COMMIT
git commit -m  "$COMMIT"

# PUSH
git push https://donmikeazul:C4p1_T0rr4d0%@github.com/JC-Maxwell/my_system.git master

# PULL
for i in "${SERVER_NAMES[@]}"
do
	echo "================================"
	echo $i
	echo "================================"
	ssh $i '
	cd my_system/
	git pull https://donmikeazul:C4p1_T0rr4d0%@github.com/JC-Maxwell/my_system.git master
	'
done
