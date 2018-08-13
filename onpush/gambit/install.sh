#!/bin/bash

[ -z "$CC" ] && CC=gcc

if [ ! -z "`git diff HEAD HEAD^ ./configure`" -o ! -f config.log ]; then
  echo "configuring gambit..."
  ./configure --enable-single-host --prefix=$ONPUSH_DIR/local
fi

echo "compiling gambit..."
make -j && make check && make install

