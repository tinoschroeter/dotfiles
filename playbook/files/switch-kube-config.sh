#!/bin/bash

CONTEXT_DIR="$HOME/.kube/custom-contexts"
CONFIG_FILE="$HOME/.kube/config"

if [ ! -d "$CONTEXT_DIR" ]; then
  echo "Error: Directory $CONTEXT_DIR does not exist"
  exit 1
fi

files=($(ls "$CONTEXT_DIR"))

echo "Available Kubernetes configurations:"
for i in "${!files[@]}"; do
  echo "$((i + 1))) ${files[$i]}"
done

read -p "Choose a configuration(1-${#files[@]}): " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt ${#files[@]} ]; then
  echo "Invalid selection"
  exit 1
fi

selected_file="${files[$((choice - 1))]}"

if [ -L "$CONFIG_FILE" ]; then
  rm "$CONFIG_FILE"
elif [ -f "$CONFIG_FILE" ]; then
  echo "Warning: $CONFIG_FILE exists and is not a symbolic link"
  read -p "Do you want to overwrite the file? (y/n):" confirm
  if [ "$confirm" != "j" ]; then
    echo "broken"
    exit 1
  fi
  rm "$CONFIG_FILE"
fi

ln -s "$CONTEXT_DIR/$selected_file" "$CONFIG_FILE"
echo "Kubernetes configuration has been switched to $selected_file"
