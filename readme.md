# hivemind-merge-core

**Pull the latest Bitcoin Core into Bitcoin Hivemind.**

This repo provides a standard workspace and simple scripts for merging changes to the [Bitcoin Core](https://github.com/bitcoin/bitcoin) project into the [Bitcoin Hivemind](https://github.com/bitcoin-hivemind/hivemind) project.

## Get Started

To get started, clone this repo and run the `setup.sh` script.

```sh
git clone git@github.com:bitjson/hivemind-merge-core.git
cd hivemind-merge-core
./setup.sh
```

This script will clone Bitcoin Hivemind into the `hivemind` directory and add Bitcoin Core as a remote.

<small>**Note**: the scripts in this repo use several Unix shell commands. To run them on a Windows machine, consider using [Cash](https://github.com/dthree/cash).</small>

### Fork Bitcoin Hivemind on GitHub

If you haven't already, you'll need to fork [Bitcoin Hivemind](https://github.com/bitcoin-hivemind/hivemind) on GitHub to submit pull requests with your merges. If already have a fork of the [Bitcoin Core](https://github.com/bitcoin/bitcoin) repo associated with your GitHub account, it's also possible to open pull requests from that repo.

## Workflow

You can see the "Todo list" of merges that still need to be completed in the generated `merges-remaining.txt` file. This file is constantly updated and used by the scripts.

### Start the Next Merge

Before starting, check [Bitcoin Hivemind's pull requests](https://github.com/bitjson/hivemind/pulls) to see which commits have already been merged and are waiting to be accepted. You can also contribute by reviewing these pull requests.

To start a new merge, choose a Bitcoin Core merge commit from `merges-remaining.txt` which is not already the subject of a [pull request](https://github.com/bitcoin-hivemind/hivemind/pulls), and pass it to `next-merge.sh`.
```sh
./next-merge.sh COMMIT_ID
```

This script will fetch any recent updates to both repos, create a new branch, and start the merge.

If there are no active pull requests, you can omit the commit id to choose the next commit in `merges-remaining.txt`:
```sh
./next-merge.sh
```

### Fix Merge Conflicts

Almost every merge will contain merge conflicts. Most conflicts are simply caused by the name change from `bitcoin` to `hivemind`. Others may be more complicated and require significant code modifications to reconcile.

### Review the Merge

It's particularly important to review changes which did not cause merge conflicts – new strings often must be adjusted, and new functionality may be fundamentaly broken or incompatible with Hivemind. If in doubt, be sure to mention these changes, and how you handled them, in your pull request to Bitcoin Hivemind.

### Build Bitcoin Hivemind &amp; Run the Tests

Before committing the merge, be sure the documentation remains correct. Please follow the updated readme to confirm the build succeeds and tests pass.

### Commit the Merge

When you're finished merging and resolving conflicts, commit your changes:
```sh
cd hivemind
git commit
```

The default commit summary is fine. If you made significant changes while merging, please document them in the commit message.

### Push the Branch to GitHub and Open a Pull Request

If you haven't pushed work from this project to your personal repo before, you'll need to add your fork as a remote:
```sh
cd hivemind
git remote add origin ADD_YOUR_REPO_CLONE_URL_HERE
```

Push the merge branch to your personal repo, and [open the pull request](https://help.github.com/articles/creating-a-pull-request/) on GitHub:
```sh
git push origin HEAD
```

In the description of your pull request, please summarize any issues you came across in your merge and include a link to the equivalent pull request in the [Bitcoin Core](https://github.com/bitcoin/bitcoin) repo.

## Things to Understand

The `merges-remaining.txt` file is a list of merges made to Bitcoin Core which are not present in Bitcoin Hivemind. This means that non-merge commits made directly to the `master` branch of Bitcoin Core (by Bitcoin Core maintainers) would not appear in this list. While that would violate the project's security practices, commits made in that way are part of the count displayed when `get status` is run on a merge branch.
