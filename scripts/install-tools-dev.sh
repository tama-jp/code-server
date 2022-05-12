#!/usr/bin/env bash

echo install tools

apt update
apt -y install git build-essential curl wget gnupg2 xz-utils openssl net-tools
