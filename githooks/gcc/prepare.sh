#!/bin/bash

[ -z "$CC" ] && CC=gcc
[ -z "$CFLAGS" ] && CFLAGS=-O3

for b in $BENCHMARKS; do
  $CC $CFLAGS $b.c -o $TMP/$b
done  
