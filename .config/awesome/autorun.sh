#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
xsetroot -cursor_name left_ptr
xbacklight -set 24
run xautolock -time 10 -locker slock &

xinput set-prop 11 288 0, 0, 0, 0, 1, 3, 2
xinput set-prop 11 295 1

run compton
run clipit
