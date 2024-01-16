#!/bin/bash
ADDPATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin";
if [ ! "$HOMEBREW_PREFIX" = "" ]; then ADDPATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$ADDPATH"; fi;
export PATH="$ADDPATH:$PATH";
function process() {
    function installed() {
        brew list | cat | sort | uniq;
    }; export -f installed;
    installed > installed.txt;
    function installs() {
        cat $(find Modules -type f | grep -E "\.txt$" | sort);
        echo;
    }; export -f installs;
    installs > installs.txt;
    grep -Fvf installed.txt installs.txt > install.txt;
    rm installs.txt;
    rm installed.txt;
    CHECK=$(cat install.txt | wc -l | awk '{print $1}');
    if [ $CHECK -ne 0 ]; then
        cat install.txt | awk '{print "brew install "$0}' | bash;
        rm install.txt;
        brew update;
        brew upgrade;
    else
        rm install.txt;
    fi;
}; export -f process;
process | tee log.txt;
if [ ! -d $HOME/.niosz ]; then mkdir $HOME/.niosz; fi;
cat log.txt >> $HOME/.niosz/brew.log;
rm log.txt;