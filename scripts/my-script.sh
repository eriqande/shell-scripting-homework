#!/bin/bash

# define a function to print the usage or "help" for the script
function usage {
      echo Syntax:
      echo "./my-script.sh NAME STUDYSYSTEM
      
     NAME: your name
     STUDYSYSTEM: what organisms do you work on?
              
   Example:
   
      $(basename $0) \"Matt DeSaix\" birds
      "
      echo
}

#  test for right number of required args.  If not, print usage message
if [ $# -ne 2 ]; then
    usage;
    exit 1;
fi

echo "My name is ${1} and I work on ${2}"