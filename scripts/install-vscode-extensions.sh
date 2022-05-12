#!/bin/bash

echo install VSCode extension

while IFS='' read -r line || [[ -n "$line" ]]; do
  if ${#line::1} > 0; then
    if [[ "${line::1}" != "#" ]]; then
      echo "Installing $line using VSCode";
      /works/code-server --user-data-dir /root/.local/share/code-server --install-extension $line
    fi
  else
    echo "Skip $line using VSCode";
  fi
done < "$1"
