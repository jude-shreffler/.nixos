set -x EDITOR nvim
set -x SHELL fish
set -x XDG_CONFIG_HOME /home/js/.config

alias rebuild="~/.config/leftwm/rebuild.sh"
alias screenshot="~/.config/leftwm/screenshot.sh"

if status is-interactive
  pfetch
end
