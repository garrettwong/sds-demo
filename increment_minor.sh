#!/bin/bash

# Function to increment minor version
function increment_minor_version() {
    local current_version=$(cat app/.version)
    # Remove the leading "v"
    current_version=${current_version#v}
    echo $current_version

    IFS='.' read -r major minor patch <<<"$current_version"

    # Increment minor version
    let patch=$((patch + 1))

    # Update version string
    new_version="v${major}.${minor}.${patch}"

    # Write new version to file
    echo "$new_version" >app/.version
}

# Call the function to increment version
increment_minor_version

# Print the updated version
echo "Updated version: $(cat app/.version)"
