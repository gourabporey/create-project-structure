#! /bin/bash

for FILE in ./test/*.js 
do
  node $FILE;
done
