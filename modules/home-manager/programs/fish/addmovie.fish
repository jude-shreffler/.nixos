#!/usr/bin/env fish

if test (count $argv) -eq 2
  set -g input $argv[1]
  set -x output $argv[2]
  echo debug: run
  if transmission-remote -a $argv[1] | grep success > /dev/null
    set -g linenum (math (transmission-remote -l | count) - 1)
    set -g info (transmission-remote -l | sed "$linenum!d")
    set -x id (string sub -l 6 $info)
    set -x name (string sub -s 73 $info)
    /home/js/.config/fish/wrapup $name $output $id &

  else
    echo "Error adding torrent to transmission. Exiting."
    exit 1
  end
else
  echo debug: help
end
