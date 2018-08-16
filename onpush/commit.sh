#!/bin/bash

[ -z $BRANCH ] && BRANCH=`git branch | grep "^[*]" | awk '{ print $2 }'`
origin=`git remote -v | grep "(push)" | awk '{print $1}'`

# normalize remote branch names
BRANCH=`echo -n $BRANCH | sed 's|refs/heads/||'`

function restore() {
  git checkout $BRANCH
  #make deselect-gen-for-commit
}

trap restore EXIT

resbranch=result.$BRANCH.$COMMIT.$HOSTNAME

git checkout -b $resbranch
git add $ONPUSH_DIR/results/$system/$HOSTNAME
git commit -m `date '+%d%b%y'` .

git push -u $origin $resbranch
