#!/bin/bash

PROJECT_DIR=$PWD
ONPUSH_DIR=$PROJECT_DIR/onpush
COMMIT=`git rev-parse --short HEAD`
[ -z "$HOST" ] && HOST=`hostname`
TMP=$ONPUSH_DIR/tmp
NBITER=3
BRANCH=$1


. ./$ONPUSHDIR/CONFIG.sh

for h in $HOSTS; do 
  if [ "$h " = "$HOST " ]; then
    mkdir -p $TMP
  
    for s in $SYSTEMS; do
      if [ -d $s ]; then
        set -a
        source ./$ONPUSHDIR/install.sh $s && exit 1
        source ./$ONPUSHDIR/prepare.sh $s
	for b in $BENCHMARKS; do
          source ./$ONPUSHDIR/measure.sh $s $b
	done
        source ./$ONPUSHDIR/commit.sh $s
        source ./$ONPUSHDIR/cleanup.sh $s
        set +a
      fi
    done
  fi  
done
