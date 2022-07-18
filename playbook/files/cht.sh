#!/usr/bin/env bash

languages="javascript\nnodejs\nexpress\nhtml\ncss\nsql\nsqlite\nreact\nbash\n"
core_utils="xargs\nfind\nmv\ncp\nsed\nawk\ncurl\ntr\nip\nvim"

selected=`printf $languages$core_utils | fzf`

if [[ ${#selected} -eq 0 ]]; then
    exit 1 
fi

if printf "$core_utils" | grep -qs "$selected"; then
  curl -s cht.sh/"$selected"\?T | less
  exit 0
fi

echo -n "${selected^^} "
read -p $'\e[32mquery:\e[0m ' query

if [[ "learn" =~ "$query"( |$) ]] || [[ ${#query} -eq 0 ]]; then
  curl -s cht.sh/"$selected"/:learn\?T | less
else
  curl -s cht.sh/"$selected"/`echo "$query" | tr ' ' '+'`\?T | less
fi
