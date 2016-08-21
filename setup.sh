#!/bin/bash

# Setup repo with proper remote names
git clone git@github.com:bitcoin-hivemind/hivemind.git
cd hivemind
git remote rename origin bitcoin-hivemind
git remote add bitcoin-core git@github.com:bitcoin/bitcoin.git
git fetch bitcoin-core
git checkout bitcoin-hivemind/master
cd ..

./update.sh
