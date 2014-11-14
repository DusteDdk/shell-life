#!/bin/bash

#
# v - because lazy
# Usage:
# v path/to/file - cd to dir, open file in vim
# v path/to/dir  - cd to dir
# v -            - cd back to previous dir
# v              - cd home
#
# Installation:
# This script needs to be sourced.
# Add to .bashrc:
# alias v='. /path/to/v.sh'
# 
# Then chmod +x /path/to/v.sh
#

V_CWD=`pwd`
V_OLD="$OLDPWD"
if [ "$1" == "" ]
then
  cd
elif ! cd "$1" &> /dev/null
then
  if cd "`dirname "$1"`" # &> /dev/null
  then
    if BN=`basename "$1"`; file "`readlink -f "$BN"`" | grep ASCII &> /dev/null
    then
      cd "`dirname "$1"`"
      vim "`basename "$1"`"
      if [ "`dirname "$1"`" != "." ]
      then
        echo "PAST: $V_CWD"
        echo "HERE: "`pwd`
        if [ "`read -p "[v to stay here] " -n 1 A; echo $A`" != "v" ]
        then
          cd "$V_CWD" &> /dev/null
        fi
        echo 
      fi
    else
      if [ "$1" = "-" ]
      then
        cd "$V_OLD"
      else
        echo "Not ASCII file and not directory."
      fi
    fi
  fi
fi
unset V_CWD
unset V_OLD
