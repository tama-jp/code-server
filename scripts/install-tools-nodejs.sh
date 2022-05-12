#!/bin/bash

echo install node.js

## Install Node.js
#curl -sL https://deb.nodesource.com/setup_12.x | bash -
#
## Install Yarn
#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#
#apt-get update && apt-get install -y yarn nodejs

curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# code-server を取得するのに wget を install しておく
apt-get install -y wget
