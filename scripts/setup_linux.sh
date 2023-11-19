#!/bin/bash

# Argument 1 will be the extensions file path passed from the JavaScript script
extensions_file="$1"

# Argument 2 will be the settings file path passed from the JavaScript script
settings_file="$2"

# Path to the VSCode settings directory
settings_dir="$HOME/.config/Code/User"

# Copy settings.json to the VSCode settings directory
cp "$settings_file" "$settings_dir/settings.json"

# Read the extensions from extensions.json without jq
extensions=$(grep -o '"[^"]*"' "$extensions_file" | tr -d '["]')

# Get the list of installed extensions
extensions_already_installed=$(code --list-extensions)

# Loop through recommended extensions
for extension in $extensions; do
  # Check if the extension is already installed
  if echo "$extensions_already_installed" | grep -q "$extension"; then
    echo "Extension '$extension' is already installed, skipping."
  else
    echo "Installing '$extension'..."
    code --install-extension "$extension"
  fi
done
