#!/bin/bash

# Path to the VSCode settings directory
settings_dir="$HOME/.config/Code/User"

# Copy settings.json to the VSCode settings directory
cp settings/settings.json "$settings_dir/settings.json"

# Read the extensions from extensions.json
extensions=$(jq -r '.recommendations | join(" ")' extensions/extensions.json)
extensions_already_installed=$(code --list-extensions)

# List of extensions already installed
declare -a list_of_extensions_already_installed=()

# Populate the array with installed extensions
readarray -t list_of_extensions_already_installed <<< "$extensions_already_installed"

# Loop through recommended extensions
for extension in $extensions; do
  # Check if the extension is already installed
  if [[ " ${list_of_extensions_already_installed[@]} " =~ " $extension " ]]; then
    echo "Extension '$extension' is already installed, skipping."
  else
    # Install the extension
    echo "Installing '$extension'..."
    code --install-extension "$extension"
  fi
done
