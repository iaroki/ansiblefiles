#!/bin/env bash

# Install brew
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Check dependencies
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install it first."
    exit 1
fi

if ! command -v yq &> /dev/null; then
    echo "yq is not installed. Please install it first: brew install yq"
    exit 1
fi

# YAML file location
YAML_FILE="brew.yaml"

# Install packages
echo "Installing packages..."
brew install $(yq '.[0].vars.packages.install[]' "$YAML_FILE" -r)

echo "All specified packages have been installed."

