#!/usr/bin/env bash

languages="javascript\nnodejs\nexpress\nsql\nbash\n"
core_utils="xargs\nfind\nmv\ncp\nsed\nawk\ncurl\ntr\nip\nvim"

selected=`printf $languages$core_utils | fzf`

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
