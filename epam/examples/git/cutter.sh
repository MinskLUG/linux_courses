#!/bin/bash 

# Script for git exercises
# 

OUT=text.txt

CUT=$((RANDOM % 100))
CNT=0
CRAPFLAG=0
NUM=0

echo " __________________________________________________________"
echo "|                                                          |"
echo "|      !!! ATTENTION !!!                                   |"
echo "|                                                          |"
echo "|  DO NOT FORGET INITIALIZE: git config --global user.name |"
echo "|                                                          |"
echo " ---------------------------------------------------------" 

git init
touch $OUT
git add $OUT

git commit $OUT -m "Initial commit" &>/dev/null

exec > $OUT
while read string
do
	if [ $CNT == $CUT ]
	then
		git commit -a -m "$NUM part added" &>/dev/null
		CUT=$((RANDOM % 100))
		((NUM++))
		CNT=0
	fi
	((CNT++))
	echo "$string"

	if [ $CRAPFLAG != 1 -a $((RANDOM % 1000)) == 0 -a $NUM -gt 3 ]
	then
		CRAPFLAG=1
		echo "Some anonymous crap from nobody :-E~~~"
	fi

done

git commit -a -m "Last commit" &>/dev/null

