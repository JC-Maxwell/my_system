#!/bin/bash

# ███╗   ███╗██╗    ██████╗ ██████╗  ██████╗ ██████╗ ██╗     ███████╗███╗   ███╗ █████╗ 
# ████╗ ████║██║    ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██║     ██╔════╝████╗ ████║██╔══██╗
# ██╔████╔██║██║    ██████╔╝██████╔╝██║   ██║██████╔╝██║     █████╗  ██╔████╔██║███████║
# ██║╚██╔╝██║██║    ██╔═══╝ ██╔══██╗██║   ██║██╔══██╗██║     ██╔══╝  ██║╚██╔╝██║██╔══██║
# ██║ ╚═╝ ██║██║    ██║     ██║  ██║╚██████╔╝██████╔╝███████╗███████╗██║ ╚═╝ ██║██║  ██║
# ╚═╝     ╚═╝╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
                                                                                      
function delay()
{
    sleep 0.2;
}

#
# Description : print out executing progress
# 
CURRENT_PROGRESS=0
function progress()
{
    PARAM_PROGRESS=$1;
    PARAM_PHASE=$2;

    if [ $CURRENT_PROGRESS -le 0 -a $PARAM_PROGRESS -ge 0 ]  ; then echo -ne "[..........................] (0%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 5 -a $PARAM_PROGRESS -ge 5 ]  ; then echo -ne "[#.........................] (5%)  $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 10 -a $PARAM_PROGRESS -ge 10 ]; then echo -ne "[##........................] (10%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 15 -a $PARAM_PROGRESS -ge 15 ]; then echo -ne "[###.......................] (15%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 20 -a $PARAM_PROGRESS -ge 20 ]; then echo -ne "[####......................] (20%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 25 -a $PARAM_PROGRESS -ge 25 ]; then echo -ne "[#####.....................] (25%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 30 -a $PARAM_PROGRESS -ge 30 ]; then echo -ne "[######....................] (30%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 35 -a $PARAM_PROGRESS -ge 35 ]; then echo -ne "[#######...................] (35%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 40 -a $PARAM_PROGRESS -ge 40 ]; then echo -ne "[########..................] (40%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 45 -a $PARAM_PROGRESS -ge 45 ]; then echo -ne "[#########.................] (45%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 50 -a $PARAM_PROGRESS -ge 50 ]; then echo -ne "[##########................] (50%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 55 -a $PARAM_PROGRESS -ge 55 ]; then echo -ne "[###########...............] (55%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 60 -a $PARAM_PROGRESS -ge 60 ]; then echo -ne "[############..............] (60%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 65 -a $PARAM_PROGRESS -ge 65 ]; then echo -ne "[#############.............] (65%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 70 -a $PARAM_PROGRESS -ge 70 ]; then echo -ne "[###############...........] (70%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 75 -a $PARAM_PROGRESS -ge 75 ]; then echo -ne "[#################.........] (75%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 80 -a $PARAM_PROGRESS -ge 80 ]; then echo -ne "[####################......] (80%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 85 -a $PARAM_PROGRESS -ge 85 ]; then echo -ne "[#######################...] (90%) $PARAM_PHASE \r"  ; delay; fi;
    if [ $CURRENT_PROGRESS -le 90 -a $PARAM_PROGRESS -ge 90 ]; then echo -ne "[##########################] (100%) $PARAM_PHASE \r" ; delay; fi;
    if [ $CURRENT_PROGRESS -le 100 -a $PARAM_PROGRESS -ge 100 ];then echo -ne '\o/                                              \n' ; delay; fi;

    CURRENT_PROGRESS=$PARAM_PROGRESS;

}

############################---Description---###################################
#                                                                              #
# 									GIT					   	                   #
#                                                                              #
################################################################################
# PARAMETERS
PROJECT_NAME=${PWD##*/}		# to assign to a variable
SERVER_NAMES=("MI_4" "MI_6")
COMMIT=$1
PULL_OUTPUT=()
PROGRESS=0

# SET CONFIG PARAMS
git config --global user.email "linustorvaldsunam@gmail.com"
git config --global user.name "linustorvaldsunam"

# # ADD
PROGRESS=$((PROGRESS+5))
progress $PROGRESS "Executing add all        "
git add --all

# # COMMIT
PROGRESS=$((PROGRESS+5))
progress $PROGRESS "Executing commit         "
COMMIT=$((git commit -m  "$COMMIT") 2>&1)

# PUSH
PROGRESS=$((PROGRESS+5))
progress $PROGRESS "Executing push           "
PUSH=$((git push https://linustorvaldsunam:linustorvalds1@github.com/JC-Maxwell/my_system.git master) 2>&1)

# PULL
for i in "${SERVER_NAMES[@]}"
do	
	PROGRESS=$((PROGRESS+5))
	progress $PROGRESS "Executing pull in $i 		"
	PULL=$((ssh -t $i '
	cd my_system/
	git pull https://linustorvaldsunam:linustorvalds1@github.com/JC-Maxwell/my_system.git master
	sudo /etc/init.d/supervisord restart	
	') 2>&1)
	PULL_OUTPUT+=($PULL)
	PROGRESS=$((PROGRESS+5))
done

progress 90 "RESTARTING              "
progress 100 "\o/              "

# STATUS
# for j in "${PULL_OUTPUT[@]}"
# do
# 	echo $j
# done