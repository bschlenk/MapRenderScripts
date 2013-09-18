#!/bin/bash
cd "$( dirname "${BASH_SOURCE[0]}" )"
source config
mkdir -p textures
VERSION=1.6.2
wget --quiet -N https://s3.amazonaws.com/Minecraft.Download/versions/${VERSION}/${VERSION}.jar -O textures/minecraft.jar
cd textures
rm -rf assets
mkdir -p temp
unzip minecraft.jar -d temp > /dev/null
cd temp
rm -rf *.class
cd ..
mv temp/assets .
rm -rf temp
