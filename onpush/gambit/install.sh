#!/bin/bash

[ -z "$CC" ] && CC=gcc

if [ ! -z "`git diff HEAD HEAD^ ./configure`" ]; then
  ./configure --enable-single-host --prefix=$ONPUSH_DIR/local
fi

make -j && make check && make install

