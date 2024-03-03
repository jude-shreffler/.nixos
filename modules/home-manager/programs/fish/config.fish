if status is-interactive
  pfetch
end

set -x EDITOR nvim
set -x SHELL fish
set -x XDG_CONFIG_HOME /home/js/.config

function rebuild
  cd /home/js/.nixos
  git add *
  git commit
  sudo nixos-rebuild switch --flake ~/.nixos#(hostname)
end

function screenshot
  set year (date +"%Y")
  set month (date +"%b")
  set day (date +"%d")
  set time (date +"%H:%M:%S")

  if not test -e ~/Pictures/Screenshots/$year
    mkdir ~/Pictures/Screenshots/$year
  end
  if not test -e ~/Pictures/Screenshots/$year/$month
    mkdir ~/Pictures/Screenshots/$year/$month
  end
  if not test -e ~/Pictures/Screenshots/$year/$month/$day
    mkdir ~/Pictures/Screenshots/$year/$month/$day
  end

  scrot -F ~/Pictures/Screenshots/$year/$month/$day/$time.png
end
