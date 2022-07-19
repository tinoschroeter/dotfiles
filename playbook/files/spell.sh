#!/usr/bin/env bash

language="de\nen"

selected=`printf $language | fzf` 

if [[ $selected =~ "de" ]]; then
  echo -n "Gebe einen Text ein und Enter: "
elif [[ $selected =~ "en" ]]; then
  echo -n "Type some text and Enter: "
else
  exit 1
fi

read data
if [[ ${#data} -eq 0 ]]; then                                                                                        
  exit 1 
fi

echo $data|aspell pipe -l $selected
