#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Installing $line using VSCode";
    /works/code-server --user-data-dir /root/.local/share/code-server --install-extension $line
done < "$1"
