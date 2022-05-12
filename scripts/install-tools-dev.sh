#!/bin/bash

echo install tools

apt-get update
apt-get -y install git build-essential curl wget gnupg2 xz-utils openssl net-tools
