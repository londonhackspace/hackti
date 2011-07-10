#!/bin/sh

PAGE=`curl -s http://groups.google.com/group/london-hack-space`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

MEMBERS=`echo $PAGE | egrep '<b>Members:</b> [0-9]+' | perl -e '<STDIN>=~m/.*<b>Members:<\/b> ([0-9]+).*/; print "$1\n"'`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

MESSAGES=`echo $PAGE | egrep '>[0-9]+ of [0-9]+ messages<' | perl -e '<STDIN>=~m/.*>[0-9]+ of ([0-9]+) messages<.*/; print "$1\n"'`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

echo "members:"$MEMBERS" messages:"$MESSAGES

