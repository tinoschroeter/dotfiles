#!/usr/bin/env bash

util="dns_serial\ngen_password\n"
languages="javascript\nnodejs\nexpress\nhtml\ncss\nsql\nsqlite\nreact\nbash\nsaltstack\nvim\ngit\n"
core_utils="xargs\nfind\nmv\ncp\nsed\nawk\ncurl\ntr\nip"

selected=$(printf $util$languages$core_utils | fzf --no-border --height 80% --no-preview --layout=reverse)

if [[ ${#selected} -eq 0 ]]; then
	exit 1
fi

if [[ "dns_serial" =~ ${selected} ]]; then
	date_now=$(date +%Y%m%d)
	echo "${date_now}01 ; Serial"
	echo -n "${date_now}01" | xclip -selection c
	exit 0
fi

if [[ "gen_password" =~ ${selected} ]]; then
	pwd=$(pwgen -s -1 -c 15)
	echo -n ${pwd} | xclip -selection c
	echo ${pwd}
	exit 0
fi

if printf "$core_utils" | grep -qs "$selected"; then
	curl -s cht.sh/"$selected"\?T | less
	exit 0
fi

echo -n "${selected^^} "
read -p $'\e[32mquery:\e[0m ' query

if [[ "learn" =~ "$query"( |$) ]] || [[ ${#query} -eq 0 ]]; then
	curl -s cht.sh/"$selected"/:learn\?T | batcat
else
	curl -s cht.sh/"$selected"/$(echo "$query" | tr ' ' '+')\?T | batcat
fi
