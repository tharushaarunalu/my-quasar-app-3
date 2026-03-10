#!/bin/bash

mkdir repo
cd repo
git init

touch commit.txt
git add commit.txt
git commit -m "start"

start="2023-01-01"
end="2026-12-31"

current=$start

while [[ "$current" < "$end" ]]
do
  commits=$((RANDOM % 5))

  for ((i=0;i<$commits;i++))
  do
    echo $RANDOM >> commit.txt
    git add commit.txt
    GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git commit -m "commit $current"
  done

  current=$(date -I -d "$current + 1 day")
done
