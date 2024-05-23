#!/bin/bash

decode_base64() {
	echo "$1" | base64 --decode
}

in_data_section=false
while IFS= read -r line; do
	if [[ "$line" =~ ^data: ]]; then
		in_data_section=true
		continue
	fi

	if [[ "$in_data_section" == true && "$line" =~ ^[a-zA-Z] ]]; then
		break
	fi

	if [[ "$in_data_section" == true && "$line" =~ ^[[:space:]]*([^:]+):[[:space:]]*(.+)$ ]]; then
		key="${BASH_REMATCH[1]}"
		value="${BASH_REMATCH[2]}"
		decoded_value=$(decode_base64 "$value")
		echo "$key: $decoded_value"
	fi
done
