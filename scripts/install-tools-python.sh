#!/usr/bin/env bash

echo install python3

apt update && apt install -y python3 python3-pip
pip3 install python-language-server
