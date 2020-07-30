#!/bin/bash
set -x
set -e

if [[ $* == *--dev* ]]
then
    BASELINE_GROUPS=development
else
    BASELINE_GROUPS=default
fi

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_DIR="$(dirname "$SCRIPTS_DIR")"

wget -O - get.pharo.org/64/90+vm | bash
./pharo Pharo.image st --save --quit "$REPO_DIR/scripts/preLoading.st"
./pharo Pharo.image metacello install "tonel://$REPO_DIR" BaselineOfIceberg --groups=$BASELINE_GROUPS
./pharo Pharo.image st --save --quit "$REPO_DIR/scripts/postLoading.st"
