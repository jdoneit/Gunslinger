#!/bin/sh

SRC_PATH=$(cd "$(dirname "$0")"; pwd)/Sfx/Work
DEST_PATH=$(cd "$(dirname "$0")"; pwd)/../Glued/Sfx

cp $SRC_PATH/*.m4a $DEST_PATH/
cp $SRC_PATH/*.wav $DEST_PATH/
