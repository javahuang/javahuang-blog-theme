#!/bin/bash

echo `date`

msg="update:$*"


rm -rf _site/*
jekyll build

git add --all ./*
git status
git commit -m "update at `date` $msg"
git push origin master


cd ../javahuang.github.io
git pull
rm -rf {20*,page*,*.html,*.xml,*.txt,*.sh}
cp -r ../javahuang-blog-theme/_site/* .

git add --all ./*
git commit -m "update at `date` $msg"
git push origin master

echo `date`
exit 0

