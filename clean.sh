#!/bin/bash

set -e
mkdir -p resources
cd resources

# Initialize a variable to track if the full option is passed
full_mode=false

# Loop through all arguments passed to the script
for arg in "$@"; do
    if [[ $arg == "--full" ]] || [[ $arg == "full" ]]; then
        full_mode=true
        break
    fi
done

if $full_mode; then
    echo "Full mode activated."
else
    echo "Running in standard mode."
fi

rm -r ../build/oldunreal
rm -r ../build/mutators
rm -r ../build/inis

# Find and remove all directories within the current directory
find . -mindepth 1 -maxdepth 1 -type d -exec rm -r {} \;

if $full_mode; then
    rm -r ../build/core
fi