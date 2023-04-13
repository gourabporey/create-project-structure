#! /bin/bash

./create-project-structure/src/create-project.sh $1;

read -p "Do you want to delete the command file? (y/n) : " USER_CONFIRMATION;

if [ $USER_CONFIRMATION = "y" ]; then
  rm -Rf ./create-project-structure;
fi
