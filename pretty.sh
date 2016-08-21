#!/bin/bash

./fetch.sh
cd hivemind
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative bitcoin-hivemind/master..bitcoin-core/master && cd ..
