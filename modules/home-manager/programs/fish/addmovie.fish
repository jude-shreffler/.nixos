#!/usr/bin/env fish

function wrapup -S
	echo debug: wrapup
	set -g run "true"
  while test $run = "true"
    sleep 30
    if test (transmission-remote -l | grep $name | string sub -s 27 -l 4) = "Done"
      set -g run "false"
    end
  end

  chmod 644 ~/torrents/$name/*.mp4
  chown jellyfin:jellyfin ~/torrents/$name/*.mp4
  mv ~/torrents/$name/*.mp4 ~/movies/$output

  if transmission-remote -t $id -rad | grep success > /dev/null
  else
    echo "Error removing torrent. Exiting."
    exit 2
  end
end

if test (count $argv) -eq 2
  set -g input $argv[1]
  set -x output $argv[2]
  echo debug: run
  if transmission-remote -a $argv[1] | grep success > /dev/null
    set -g linenum (math (transmission-remote -l | count) - 1)
    set -g info (transmission-remote -l | sed "$linenum!d")
    set -x id (string sub -l 6 $info)
    set -x name (string sub -s 73 $info)
    wrapup &

  else
    echo "Error adding torrent to transmission. Exiting."
    exit 1
  end
else
  echo debug: help
end
