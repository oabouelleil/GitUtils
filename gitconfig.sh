#!/bin/bash

git config --local include.path ../.gitconfig

# This will force git to recheck and "reapply" gitattributes changes.
git rm --cached -r .
git add -A
