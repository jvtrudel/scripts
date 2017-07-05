#! /usr/bin/env bash

current=`git rev-parse HEAD`

for branch in $(git rev-list --all --not $(git rev-list --all ^$2))
do
  git checkout $branch
  repository_stat.sh tmp-batch_onebranch.sh-tmp
done



sort -k1 tmp-batch_onebranch.sh-tmp > $1 
rm tmp-batch_onebranch.sh-tmp
git checkout $current
