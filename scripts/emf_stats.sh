#!/bin/sh

PAGE=`curl -sk https://www.emfcamp.org/stats`
if [ $? -ne 0 ]; then
  echo "NaN"
  exit 1;
fi;

echo $PAGE

