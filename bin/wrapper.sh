#!/bin/bash -e

# this should exist in the install hook, and in fact does,
# but for some reason snapd won't run it in the install hook properly...
# and so here it lives ...
if [ ! -d "$SNAP_USER_DATA/.runrootless" ]; then
    mkdir -p "$SNAP_USER_DATA/.runrootless"
    ln -s $SNAP/bin/proot "$SNAP_USER_DATA/.runrootless/runrootless-proot"
fi

# use first argument as which program to run
# second and all remaining arguments are arguments to the program
"$SNAP/bin/$1" "${@:2}"