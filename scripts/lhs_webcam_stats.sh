#!/bin/sh

PAGE=`curl -sk https://london.hackspace.org.uk/webcam_stats.php`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

echo $PAGE

