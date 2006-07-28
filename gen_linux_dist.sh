#!/bin/bash

set -eu

VER=$(grep 'misc.version =' blyte.py | cut -b24- | perl -pe 's/"//g;')
DIR="linux-dist/blyte-$VER"

rm -rf linux-dist
mkdir -p $DIR

cp *.py icon16.png icon32.png logo.jpg names.dat dict_en.dat.gz sample.blyte manual.pdf fileformat.txt LICENSE INSTALL $DIR
rm $DIR/setup.py
cp Makefile.install $DIR/Makefile
cd linux-dist
tar cvf "blyte-$VER.tar" "blyte-$VER"
gzip -9 "blyte-$VER.tar"

mv "blyte-$VER.tar.gz" ..

cd ..
rm -rf linux-dist
