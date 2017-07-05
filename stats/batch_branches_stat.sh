#! /usr/bin/env bash

current=`git rev-parse HEAD`

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/)
do
  git checkout $branch
  git pull
  repository_stat.sh $1
done

git checkout $current
