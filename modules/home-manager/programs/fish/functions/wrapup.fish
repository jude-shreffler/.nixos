#!/usr/bin/env fish
# THIS SCRIPT IS NOT MEANT TO BE INVOKED MANUALLY
# IT HAS NO PROTECTIONS FOR IMPROPER USE

set -g name $argv[1]
set -g output $argv[2]
set -g id $argv[3]
echo "Wrapup debug:\nName: $name\nOutput: $output\nID: $id\n"
set -g run "true"
while test $run = "true"
  echo "Sleeping... run = $run"
  sleep 10 &
  wait $last_pid
  if test (transmission-remote -l | grep $name | string sub -s 27 -l 4) = "Done"
    set -g run "false"
    echo "Transmission Done! run = $false"
  end
end

chmod 644 /home/js/torrents/$name/*.mp4
chown jellyfin:jellyfin /home/js/torrents/$name/*.mp4
mv /home/js/torrents/$name/*.mp4 /home/js/movies/$output
echo "Moved to movies"

if transmission-remote -t $id -rad | grep success > /dev/null
else
  echo "Error removing torrent. Exiting."
  exit 2
end
echo "Removed torrent and directory"