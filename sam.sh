#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Source directory
src_dir="$1"

# Verify if source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Source directory '$src_dir' does not exist."
    exit 1
fi

# Check if source directory is empty
if [ -z "$(ls -A "$src_dir")" ]; then
    echo "Source directory '$src_dir' is empty. Nothing to copy."
    exit 1
fi

# Destination directory
dest_dir="$2"

# Verify if destination directory exists
if [ ! -d "$dest_dir" ]; then
    echo "Destination directory '$dest_dir' does not exist."
    exit 1
fi

# Copy files from source to destination
cp -r "$src_dir"/* "$dest_dir"

echo "Files copied successfully from '$src_dir' to '$dest_dir'."
