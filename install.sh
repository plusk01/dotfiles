#!/bin/bash

# Get path to the directory of this file, no matter where it is sourced from
MYPATH=$(dirname ${BASH_SOURCE[0]})

cp luskrc ~/.luskrc

# TODO: make sure this line doesn't already exist
echo "source ~/.luskrc" >> ~/.bashrc
