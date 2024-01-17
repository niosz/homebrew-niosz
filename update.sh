#!/bin/bash
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– current version
CURRENT_VERSION="$(cat lastversion.txt)";
echo "$CURRENT_VERSION";
MAJOR=$(echo "$CURRENT_VERSION" | awk -F'.' '{print $1}');
MINOR=$(echo "$CURRENT_VERSION" | awk -F'.' '{print $2}');
FIXES=$(echo "$CURRENT_VERSION" | awk -F'.' '{print $3}');
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– update version
FIXES=$((FIXES+1));
if [ $FIXES -gt 999 ]; then
    FIXES=100;
    MINOR=$(( MINOR + 1 ));
    if [ $MINOR -gt 999 ]; then
        MINOR=100;
        MAJOR=$((MAJOR+1));
    fi;
fi;
COMMIT_VERSION="${MAJOR}.${MINOR}.${FIXES}";
# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– git commit
cat Formula/niosz.rb | \
sed -E 's/^.+version ".+$/    version "'$COMMIT_VERSION'"/' > Formula/niosz.tmp && mv Formula/niosz.tmp Formula/niosz.rb;
echo "$COMMIT_VERSION" > lastversion.txt;
git add .;
git commit -m "$COMMIT_VERSION";
git push;