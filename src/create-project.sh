#! /bin/bash
source ./create-project-structure/lib/case-conversion.sh

function create_project() {
  local PROJECT_NAME=$1;

  mkdir -p $PROJECT_NAME/lib $PROJECT_NAME/src $PROJECT_NAME/test;

  local FUNCTION_NAME=$(kebab_to_camel_case $PROJECT_NAME);
  local FUNCTION_NAME_IN_PC=$(kebab_to_pascal_case $PROJECT_NAME);

  cat ./create-project-structure/lib/testingFramework.js > "$PROJECT_NAME/lib/testing.js"
  cat ./create-project-structure/lib/functionSnippet.js > "$PROJECT_NAME/src/$PROJECT_NAME.js"
  cat ./create-project-structure/lib/testSnippet.js | sed -e "s/FILE_IN_CC/$FUNCTION_NAME/g" -e "s/FILE_IN_PC/$FUNCTION_NAME_IN_PC/g" -e "s/PROJECT/$PROJECT_NAME/g" > "$PROJECT_NAME/test/$PROJECT_NAME-test.js"

  cp ./create-project-structure/lib/runtest.sh $PROJECT_NAME/;
  clear;

  cd $PROJECT_NAME;
  ./runtest.sh;
}

create_project $1;
