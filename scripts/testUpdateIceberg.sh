#!/bin/bash
set -x
set -e

if [[ $* == *--dev* ]]
then
    BASELINE_GROUPS=development
else
    BASELINE_GROUPS=default
fi

case "$(uname -s)" in
   MINGW*)
     SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -W )"
     ;;
   *)
     SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
     ;;
esac

REPO_DIR="$(dirname "$SCRIPTS_DIR")"

wget -O - get.pharo.org/64/110+vm | bash
./pharo Pharo.image st --save --quit "$SCRIPTS_DIR/preLoading.st"
./pharo Pharo.image metacello install "tonel://$REPO_DIR" BaselineOfIceberg --groups=$BASELINE_GROUPS
./pharo Pharo.image st --save --quit "$SCRIPTS_DIR/postLoading.st"
