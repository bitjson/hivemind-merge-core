#!/bin/bash

./update.sh
NEXT_COMMIT=$(head -n 1 merges-remaining.txt | awk '{print $1;}')

cd hivemind
git checkout bitcoin-hivemind/master
git checkout -b merge/$NEXT_COMMIT
git branch HEAD -u bitcoin-core/master
git status
git merge $NEXT_COMMIT
