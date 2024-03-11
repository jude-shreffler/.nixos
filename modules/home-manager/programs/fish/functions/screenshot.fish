#!/usr/bin/env fish

set -l year $(date +"%Y") 
set -l month $(date +"%b")
set -l day $(date +"%d")
set -l time $(date +"%H:%M:%S")

if ! test -f ~/Pictures/Screenshots/$year
	mkdir ~/Pictures/Screenshots/$year
end
if ! test -f ~/Pictures/Screenshots/$year/$month
    mkdir ~/Pictures/Screenshots/$year/$month
end
if ! test -f ~/Pictures/Screenshots/$year/$month/$day
    mkdir ~/Pictures/Screenshots/$year/$month/$day
end
scrot -F ~/Pictures/Screenshots/$year/$month/$day/$time.png
