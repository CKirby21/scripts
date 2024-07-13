#!/usr/bin/env bash
set -euo pipefail

NAME=$(basename "$BASH_SOURCE")
if [[ $# -ne 1 ]]; then
    echo "USAGE: $NAME COMMIT_MESSAGE"
    exit 1
fi

COMMIT_MESSAGE="$1"
git add . && git commit -m "$COMMIT_MESSAGE" && git push

