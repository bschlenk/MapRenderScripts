#!/bin/bash
cwd=$(pwd)

mkdir -p $TEXTURE_PATH
VERSION=1.8
wget --quiet -N https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/${VERSION}.jar -O "$TEXTURE_PATH/minecraft.jar"
cd $TEXTURE_PATH
rm -rf assets
mkdir -p temp
unzip minecraft.jar -d temp > /dev/null
mv temp/assets .
rm -rf temp

cd "$cwd"

exit 0
