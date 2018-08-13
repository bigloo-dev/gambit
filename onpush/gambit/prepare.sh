#!/bin/bash

$ONPUSH_DIR/$1/local/bin/gsc -exe $GSCFLAGS -o $TMP/$2 $PROJECT_DIR/bench/src/$2.scm
