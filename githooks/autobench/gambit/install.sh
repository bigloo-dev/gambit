#!/bin/bash

[ -z "$CC" ] && CC=gcc

if [ ! -z "`git diff HEAD HEAD^ ./configure`" -o ! -f config.log -o ! -d $GITHOOKS_DIR/autobench/local ]; then
  echo "configuring gambit..."
  ./configure --enable-single-host --prefix=$GITHOOKS_DIR/autobench/local || exit 1
  echo "compiling and testing gambit... "
  make -j && make check && make install 
else  
  echo "compiling gambit... "
  make -j && make install
fi
