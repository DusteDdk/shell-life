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

if [ "$1" == "" ]
then
  cd
elif [ -d "$1" ]
then
  cd "$1"
elif [ -f "$1" ]
then
  if `file "$1" | grep ASCII &> /dev/null`
  then
    cd "`dirname "$1"`"
    vim "`basename "$1"`"
    if [ "`dirname "$1"`" != "." ]
    then
      if [ "`read -p "[v to stay in dir] " -n 1 A; echo $A`" != "v" ]
      then
        cd - &> /dev/null
      fi
      echo 
    fi
  else
    echo "Not ASCII file."
  fi
elif [ "$1" == "-" ]
then
  cd -
else 
  echo -e "Error: $1 not found."
fi
