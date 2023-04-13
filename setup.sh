#! /bin/bash

./create-project-structure/src/create-project.sh $1;

PARENT_PATH=$(realpath $0 | sed -e "s/\/[^/]*$/\//g");

read -p "Do you want to delete the command file? (y/n) : " USER_CONFIRMATION;

if [ $USER_CONFIRMATION = "y" ]; then
  #rm -Rf $PARENT_PATH;
  echo $USER_CONFIRMATION
fi
