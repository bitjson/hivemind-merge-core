#!/bin/bash

./fetch.sh
cd hivemind
git log --merges --reverse bitcoin-hivemind/master...bitcoin-core/master --oneline > ../merges-remaining.txt
cd ..
