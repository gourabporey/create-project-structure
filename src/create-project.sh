#! /bin/bash
source lib/case-conversion.sh

function create_project() {
  local PROJECT_NAME=$1;

  mkdir $PROJECT_NAME;
  cd $PROJECT_NAME;

  mkdir lib src test;

  local FUNCTION_NAME=$(kebab_to_camel_case $PROJECT_NAME);
  local FUNCTION_NAME_IN_PC=$(kebab_to_pascal_case $PROJECT_NAME);

  cat ~/bin/testingFramework.js > "lib/testing.js"
  cat ~/bin/jslib/functionSnippet.js > "src/$PROJECT_NAME.js"
  cat ~/bin/jslib/testSnippet.js | sed -e "s/FILE_IN_CC/$FUNCTION_NAME/g" -e "s/FILE_IN_PC/$FUNCTION_NAME_IN_PC/g" -e "s/PROJECT/$PROJECT_NAME/g" > "test/$PROJECT_NAME-test.js"

  cp ~/bin/shlib/runtest.sh .;
  open -a "iTerm"; clear;
  ./runtest.sh;

  local OPEN_VIM="vim $PROJECT_NAME/src/$PROJECT_NAME.js";
  local OSA_SCPT="tell application \"iTerm\" 
  create window with default profile 
  tell current session of current window 
  write text \"$OPEN_VIM\" 
end tell 
end tell";

echo "$OSA_SCPT" | osascript;
}

create_project $1
