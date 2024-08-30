#!/bin/bash

# Define the base URL of your GitHub repository
REPO_BASE_URL="https://github.com/allked/nonononono/raw/main"

#https://github.com/allked/nonononono/raw/main/update.zip

# Define the name of the encrypted ZIP file
ZIP_FILE="update.zip"

# Download the encrypted ZIP file
echo "Downloading $ZIP_FILE..."
if ! curl -L -o "$ZIP_FILE" "$REPO_BASE_URL/$ZIP_FILE"; then
    echo "Error: Failed to download $ZIP_FILE"
    exit 1
fi

# Prompt the user for the password without echoing it on the screen
echo -n "Enter password for $ZIP_FILE: "
read -s password
echo

# Extract the encrypted ZIP file
echo "Extracting $ZIP_FILE..."
if ! unzip -P "$password" "$ZIP_FILE" -d .; then
    echo "Error: Failed to extract $ZIP_FILE. Please check the password."
    rm "$ZIP_FILE"
    exit 1
fi

# Clean up the ZIP file
rm "$ZIP_FILE"

echo "Update complete!"

