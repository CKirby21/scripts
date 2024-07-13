#!/usr/bin/env bash

PWD=$(pwd)
SRC_PATH="$PWD/src"
SCRIPT_PATH_LIST=$(find "$SRC_PATH" -maxdepth 1 -mindepth 1 -name "*.sh")
SHIMS_PATH="$PWD/shims"
BASHRC_PATH="$HOME/.bashrc"

if [ ! -f "$BASHRC_PATH" ]; then
    echo Creating "$BASHRC_PATH" ...
    touch "$BASHRC_PATH"
fi

mkdir -p "$SHIMS_PATH"

for SCRIPT_PATH in $SCRIPT_PATH_LIST; do

    SCRIPT_BASENAME=$(basename "$SCRIPT_PATH" ".sh")
    LINK_NAME="$SHIMS_PATH/me$SCRIPT_BASENAME"
    echo Creating "$LINK_NAME" ...
    ln -f "$SCRIPT_PATH" "$LINK_NAME" 
done
echo

EXPORT="export PATH=\"\$PATH:$SHIMS_PATH\""
if ! cat "$BASHRC_PATH" | grep -q "$EXPORT"; then

    echo Writing to ~/.bashrc ...
    echo
    echo "### Added by $PWD" | tee -a "$BASHRC_PATH"
    echo "$EXPORT" | tee -a "$BASHRC_PATH"
    echo "### End" | tee -a "$BASHRC_PATH"
    echo
fi

echo
echo Success!

