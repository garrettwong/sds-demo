#!/bin/sh

git add --all
git commit -m 'demo'
git push --all

source increment_minor.sh
export VERSION_TAG=$(cat app/.version)
export GPG_TTY=$(tty)
git tag -s -m "demo" $VERSION_TAG
git push origin $VERSION_TAG
