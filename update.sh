#!/bin/bash
VERSION="$(ls -lrt Modules | tail -1 | awk '{print $9}' | sed 's/\.sh$//')";
cat Formula/boot.rb | sed -E 's/^.+version ".+$/    version "'$VERSION'"/' > Formula/boot.tmp && mv Formula/boot.tmp Formula/boot.rb;
git add .;
git commit -m "$VERSION";
git push;