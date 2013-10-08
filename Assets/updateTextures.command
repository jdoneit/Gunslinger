#!/bin/sh

SRC_PATH=$(cd "$(dirname "$0")"; pwd)/Textures/Work
DEST_PATH=$(cd "$(dirname "$0")"; pwd)/../Glued/Textures

cp $SRC_PATH/*.png $DEST_PATH/

cp $SRC_PATH/global/*.png $DEST_PATH/
cp $SRC_PATH/global/*.plist $DEST_PATH/

cp $SRC_PATH/orbs/*.png $DEST_PATH/
cp $SRC_PATH/orbs/*.plist $DEST_PATH/

cp $SRC_PATH/background/*.png $DEST_PATH/
cp $SRC_PATH/background/*.plist $DEST_PATH/

cp $SRC_PATH/menu/*.png $DEST_PATH/
cp $SRC_PATH/menu/*.plist $DEST_PATH/

cp $SRC_PATH/cutscenes/*.png $DEST_PATH/
cp $SRC_PATH/cutscenes/*.plist $DEST_PATH/

