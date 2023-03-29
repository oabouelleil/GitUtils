#!/bin/bash

# This will tell git to also use your custom gitconfig
git config --local include.path ../.gitconfig

# This will force git to recheck and "reapply" gitattributes changes.
git rm --cached -r .
git add -A
