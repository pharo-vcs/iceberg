#!/bin/bash
set -x
set -e

wget -O - get.pharo.org/70+vm | bash
./pharo Pharo.image st scripts/updateIceberg.st 