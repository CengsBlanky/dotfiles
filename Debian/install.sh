#!/bin/bash
# this script install all packages managed by Debian apt manager

# Find all *.dep.txt files (including in subdirectories)
sudo apt update
if [ $? -ne 0 ]; then
    echo "update failed! abort install"
    exit 1
fi
find . -type f -name "*.dep.txt" | while read -r dep_file; do
    echo "📦 Reading packages from file: $dep_file"

    # Read non-comment, non-empty lines
    packages=$(grep -v '^\s*#' "$dep_file" | grep -v '^\s*$')

    if [ -z "$packages" ]; then
        echo "⚠️  No valid package entries found in $dep_file"
        continue
    fi

    printf "🔧 Packages to install:\n%s\n" "$packages"

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    sudo apt install -y $packages
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

    if [ $? -eq 0 ]; then
        echo "✅ Successfully installed packages from $dep_file"
    else
        echo "❌ Failed to install some packages from $dep_file"
    fi

    echo "-------------------------------------------------------------"
done

echo "🎉 All dependencies processed."
