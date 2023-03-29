#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 [clean|smudge]"
    exit 1
fi

REPO_PATH=$(git rev-parse --show-toplevel)
REPO_PATH_ESCAPED=$(echo "$REPO_PATH" | sed 's/[.[\*^$\\/]/\\&/g')
REPO_PATH_BACKSLASH=$(echo "$REPO_PATH" | sed 's/\//\\/g' | sed 's/[.[\*^$\\/]/\\&/g')
STANDARD_STRING="__REPO_PATH__"
STANDARD_STRING_BACKSLASH="__REPO_PATH_BACKSLASH__"

case $1 in
    clean)
        sed -e "s|$REPO_PATH_ESCAPED|$STANDARD_STRING|g" \
            -e "s|$REPO_PATH_BACKSLASH|$STANDARD_STRING_BACKSLASH|g"
        ;;
    smudge)
        sed -e "s|$STANDARD_STRING|$REPO_PATH_ESCAPED|g" \
            -e "s|$STANDARD_STRING_BACKSLASH|$REPO_PATH_BACKSLASH|g" \
            -e 's/\\/\//g'
        ;;
    *)
        echo "Invalid argument. Use 'clean' or 'smudge'."
        exit 1
        ;;
esac
