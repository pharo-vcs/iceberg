#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

# Get the current commit message to use it in the sync commit
COMMIT_MESSAGE=`git log --format="Sync %h: %B" -n 1`

git clone https://$GH_TOKEN@github.com/pharo-vcs/iceberg.wiki.git

# Cleanup the wiki repository so removed files get removed and copy new files
cd iceberg.wiki
find . -not -path "./.git/*" -not -path "./.git" -delete
cp -ar "${__root}/docs/." .

# GOGOGO
git add *
git commit -m "${COMMIT_MESSAGE}"
git push
