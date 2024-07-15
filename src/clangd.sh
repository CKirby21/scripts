#!/usr/bin/env bash
########################################################################################################
# Generate file for clangd LSP resolution
########################################################################################################

OUTFILE=./compile_flags.txt

find C:/rtl/vcpkg/vcpkg-user-v2-vs22-x64-windows-230809/installed/x64-windows/include -type d > $OUTFILE

TEMPFILE=$(mktemp)
trap 'rm -f $TEMPFILE' EXIT

sed 's/^/-I/' $OUTFILE > "$TEMPFILE"

cat "$TEMPFILE" > $OUTFILE

echo -std=c++11 >> $OUTFILE

