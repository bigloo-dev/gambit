#!/bin/bash

$GITHOOKS_DIR/autobench/local/bin/gsc -exe $GSCFLAGS -o $TMP/$2 $PROJECT_DIR/bench/src/$2.scm
