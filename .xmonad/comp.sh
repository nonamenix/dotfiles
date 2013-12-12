#!/bin/bash
#
# Start a composition manager.
# (xcompmgr in this case)
 
function comphelp () {
  echo "Composition Manager:"
  echo "   (re)start: COMP"
  echo "   stop:      COMP -s"
  echo "   query:     COMP -q"
  echo "              returns 1 if composition manager is running, else 0"
  exit
}
 
function checkcomp () {
  ( ps nc -C xcompmgr &>/dev/null ) && exit 1
  exit 0
}
 
function stopcomp () {
  ( ps nc -C xcompmgr &>/dev/null ) && killall xcompmgr
}
 
function startcomp () {
  stopcomp
  xcompmgr -f -D5 -n
  exit
}
 
case "$1x" in
    "x") startcomp;;
  "-qx") checkcomp;;
  "-sx") stopcomp; exit;;
      *) comphelp;;
esac