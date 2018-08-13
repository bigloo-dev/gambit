#!/bin/bash

[ -z "$CC" ] && CC=gcc

if [ ! -z "`git diff HEAD HEAD^ ./configure`" -o ! -f config.log -o ! -d $ONPUSH_DIR/local ]; then
  echo "configuring gambit..."
  ./configure --enable-single-host --prefix=$ONPUSH_DIR/local || exit 1
fi

echo "compiling gambit... "
make -j && make check && make install

