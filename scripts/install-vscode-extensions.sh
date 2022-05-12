#!/usr/bin/env bash

echo install VSCode extension

while IFS='' read -r line || [[ -n "$line" ]]; do

  if [ ${#line} -gt 0 ]; then
    if [[ ${line:0:1} != "#" ]]; then
      echo "install "  $line
      /works/code-server --user-data-dir /root/.local/share/code-server --install-extension $line
    fi

  else
    echo "Skip $line using VSCode";
  fi
done < "$1"
