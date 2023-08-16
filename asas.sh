#!/bin/bash

function create_hierarchy {
    local path="$1"
    shift
    local hierarchy=("$@")

    if [ ${#hierarchy[@]} -eq 0 ]; then
        return
    fi

    local element="${hierarchy[0]}"
    unset 'hierarchy[0]'

    if [[ "$element" == *.* ]]; then
        folder_name="${element%.*}"
        file_name="${element#*.}"
        new_path="$path/$folder_name"
        mkdir -p "$new_path"
        touch "$new_path/$file_name"
    else
        new_path="$path/$element"
        mkdir -p "$new_path"
    fi

    create_hierarchy "$new_path" "${hierarchy[@]}"
}

while IFS= read -r line || [[ -n "$line" ]]; do
    IFS='/' read -ra hierarchy <<< "$line"
    create_hierarchy "." "${hierarchy[@]}"
done < "input.txt"
