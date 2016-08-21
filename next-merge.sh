#!/bin/bash

./update.sh

NEXT_COMMIT=$1
if [ -z "${1}" ]; then
    NEXT_LINE=$(head -n 1 merges-remaining.txt)
    NEXT_COMMIT=$(echo $NEXT_LINE | awk '{print $1;}')
    echo
    echo "next-merge.sh was not passed a commit id."
    echo "The next commit requiring a merge is '$NEXT_LINE'."
    echo
    echo "You may want to confirm this Bitcoin Core merge commit is not the subject of an existing Bitcoin Hivemind pull request:"
    echo "https://github.com/bitcoin-hivemind/hivemind/pulls"
    echo
    echo "To choose anther commit, provide the commit id to next-merge.sh, e.g.:"
    echo "./next-merge.sh $NEXT_COMMIT"
    echo
    read -s -n 1 -p "Press any key to start merging commit id '$NEXT_COMMIT', or Ctrl+C to cancel..."
    echo
fi

cd hivemind
git checkout bitcoin-hivemind/master
git checkout -b merge/$NEXT_COMMIT
git branch HEAD -u bitcoin-core/master
git status
git merge $NEXT_COMMIT
