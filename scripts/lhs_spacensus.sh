#!/bin/sh

PAGE=`curl -s http://bell.local:4242/S`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

PEOPLE=`echo $PAGE | cut -c4-`

echo "people:"$PEOPLE

