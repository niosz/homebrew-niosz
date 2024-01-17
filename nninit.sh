#!/bin/bash
#region ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– private
NNINIT_PID=$$;
function infor() {
    local MESSAGE="$@";
    if [ ! "$MESSAGE" = "" ]; then
        echo -e "[$(date '+%Y-%m-%d %H:%M:%S')]($NNINIT_PID) ✅ [INFOR] \033[1;34m${MESSAGE}\033[0m";
    fi;
}; 
export -f infor;
function error() {
    local MESSAGE="$@";
    if [ "$MESSAGE" = "" ]; then MESSAGE="unknow fatal error"; fi;
    echo -e "[$(date '+%Y-%m-%d %H:%M:%S')]($NNINIT_PID) 🆘 [ERROR] \033[1;32m${MESSAGE}\033[0m";
    exit 1;
}; 
export -f error;
#endregion
#region ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– check shells
infor "enumerate existing binary shells";
infor "installation completed";
#endregion