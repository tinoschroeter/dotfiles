#!/usr/bin/env bash

languages="javascript\nnodejs\nexpress\nsql\nbash"
core_utils="xargs\nfind\nmv\ncp\nsed\nawk\necho\ncurl\ntr\nip"

selected=`printf $languages\n$core_utils | fzf`

if printf "$core_utils" | grep -qs "$selected"; then
  curl -s cht.sh/"$selected"\?T | vim -
  exit 0
fi

echo -n "${selected^^} "
read -p $'\e[32mquery:\e[0m ' query

if [[ "learn" =~ "$query"( |$) ]] || [[ ${#query} -eq 0 ]]; then
  curl -s cht.sh/"$selected"/:learn\?T | vim -
else
  curl -s cht.sh/"$selected"/`echo "$query" | tr ' ' '+'`\?T | vim -
fi
