#!/bin/bash

system=$1
benchmark=$2

[ -z "$PERF" ] && PERF=perf

mkdir -p $GITHOOKS_DIR/autobench/results/$system/$HOSTNAME

times=
cycles=
sep="["

#* TIMEFORMAT="%3R"                                                    */
#* export TIMEFORMAT                                                   */

for ((i=0; i<$AUTOBENCH_ITER; i++)) do
  p=`$PERF stat $TMP/$benchmark 2>&1 > /dev/null`
  cy=`echo $p | grep "   cycles  " | awk '{print $1}' | sed 's/,//g'`
  tm=`echo $p | grep " seconds time elapsed" | awk '{print $1}'`

  times="$times$sep $tm"
  cycles="$cycles$sep $cy"

  sep=","
done

echo "$2:"
echo "{ times: $times ], cycles: $cycles ] }" \
  | tee $GITHOOKS_DIR/autobench/results/$system/$HOSTNAME/$benchmark.json

