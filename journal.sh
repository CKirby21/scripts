#!/usr/bin/env bash

TODAYS_ENTRY_FILE_NAME=$(date "+%Y-%m-%d.md")
JOURNAL_PATH="$HOME/repos/brain/Journal"
TODAYS_ENTRY_PATH="$JOURNAL_PATH/$TODAYS_ENTRY_FILE_NAME"
nvim "$TODAYS_ENTRY_PATH"

