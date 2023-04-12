function kebab_to_camel_case() {
  local NAME=$1;
  for CHARS in $(echo $NAME | grep -o "\-[a-z]");
  do
    local CAPITAL_CASE=$(echo $CHARS | tr "[:lower:]" "[:upper:]" | tr -d "\-");
    NAME=$(echo $NAME | sed -e "s/$CHARS/$CAPITAL_CASE/");
  done
  echo $NAME;
}


function kebab_to_pascal_case() {
  local NAME=$1;
  for CHARS in $(echo $NAME | grep -oe "\-[a-z]" -oe "^[a-z]");
  do
    local CAPITAL_CASE=$(echo $CHARS | tr "[:lower:]" "[:upper:]" | tr -d "\-");
    NAME=$(echo $NAME | sed -e "s/$CHARS/$CAPITAL_CASE/");
  done
  echo $NAME;
}
