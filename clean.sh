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

if $full_mode; then
    rm -r ../build/core
fi