#!/usr/bin/env bash

YEAR=$(date +"%Y") 
MONTH=$(date +"%b")
DAY=$(date +"%d")
TIME=$(date +"%H:%M:%S") 
if [ ! -e ~/Pictures/Screenshots/$YEAR ]; then
	mkdir ~/Pictures/Screenshots/$YEAR
fi
if [ ! -e ~/Pictures/Screenshots/$YEAR/$MONTH ]; then
    mkdir ~/Pictures/Screenshots/$YEAR/$MONTH
fi
if [ ! -e ~/Pictures/Screenshots/$YEAR/$MONTH/$DAY ]; then
    mkdir ~/Pictures/Screenshots/$YEAR/$MONTH/$DAY
fi
scrot -F ~/Pictures/Screenshots/$YEAR/$MONTH/$DAY/$TIME.png
