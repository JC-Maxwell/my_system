#!/bin/bash

# PARAMETERS
PROJECT_NAME=${PWD##*/}		# to assign to a variable
SERVER_NAMES=("MI_4" "MI_6")
COMMIT=$1
PULL_OUTPUT=()

# SET CONFIG PARAMS
git config --global user.email "donmikebautista@gmail.com"
git config --global user.name "donmikeazul"

# # ADD
git add --all

# # COMMIT
COMMIT=$((git commit -m  "$COMMIT") 2>&1)

# PUSH
PUSH=$((git push https://donmikeazul:C4p1_T0rr4d0%@github.com/JC-Maxwell/my_system.git master) 2>&1)


# PULL
for i in "${SERVER_NAMES[@]}"
do
	PULL=$((ssh $i '
	cd my_system/
	git pull https://donmikeazul:C4p1_T0rr4d0%@github.com/JC-Maxwell/my_system.git master	
	') 2>&1)
	PULL_OUTPUT+=($PULL)
done

# STATUS
for j in "${PULL_OUTPUT[@]}"
do
	echo $j
done