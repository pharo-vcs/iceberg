#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__root="$(cd "$(dirname "${__dir}")/.." && pwd)"

COMMIT_MESSAGE=`git log --format=%B -n 1`
git clone https://github.com/pharo-vcs/iceberg.wiki.git
cp -r "${__root}/docs/*" iceberg.wiki
cd iceberg.wiki
git commit -m "${COMMIT_MESSAGE}"
git push
