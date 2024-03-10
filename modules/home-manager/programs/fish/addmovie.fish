#!/usr/bin/env fish

if test (count $argv) -eq 2
  set -g input $argv[1]
  set -g output $argv[2]
  echo debug: run
  if transmission-remote -a $input | grep success > /dev/null
    set -l linenum (math (transmission-remote -l | count) - 1)
    set -l info (transmission-remote -l | sed "$linenum!d")
    set -l id (string sub -l 6 $info)
    set -l name (string sub -s 73 $info)
    /home/js/.config/fish/wrapup.fish $name $output $id &

  else
    echo "Error adding torrent to transmission. Exiting."
    exit 1
  end
else
  echo debug: help
end
