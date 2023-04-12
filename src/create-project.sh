#! /bin/bash
source ~/my-utils/create-project-structure/lib/case-conversion.sh

function create_project() {
  local PROJECT_NAME=$1;

  mkdir $PROJECT_NAME; cd $PROJECT_NAME;

  mkdir lib src test;

  local FUNCTION_NAME=$(kebab_to_camel_case $PROJECT_NAME);
  local FUNCTION_NAME_IN_PC=$(kebab_to_pascal_case $PROJECT_NAME);

  cat ~/my-utils/create-project-structure/lib/testingFramework.js > "lib/testing.js"
  cat ~/my-utils/create-project-structure/lib/functionSnippet.js > "src/$PROJECT_NAME.js"
  cat ~/my-utils/create-project-structure/lib/testSnippet.js | sed -e "s/FILE_IN_CC/$FUNCTION_NAME/g" -e "s/FILE_IN_PC/$FUNCTION_NAME_IN_PC/g" -e "s/PROJECT/$PROJECT_NAME/g" > "test/$PROJECT_NAME-test.js"

  cp ~/my-utils/create-project-structure/lib/runtest.sh .;
  open -a "iTerm"; clear;
  ./runtest.sh;
}

create_project $1;
