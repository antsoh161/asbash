#!/bin/bash

files=($(find ./build -type f -name "compile_commands.json"))
num_files=${#files[@]}

if [ $num_files -eq 0 ]; then
  echo "No compile_commands.json files found in ./build."
  exit 1
fi

echo "Found the following compile_commands.json file(s) in ./build:"
for ((i=0; i<num_files; i++)); do
  echo "[$i] ${files[i]}"
done
echo -n "Select a file by entering its index (0-$((num_files-1))): "
read user_choice

if [[ ! $user_choice =~ ^[0-9]+$ ]] || [ $user_choice -lt 0 ] || [ $user_choice -ge $num_files ]; then
  echo "Invalid selection. Aborting."
  exit 1
fi

selected_file=${files[user_choice]}

# Check if .clangd already exists
if [ -e .clangd ]; then
  echo ".clangd file already exists. Do you want to overwrite it? (y/n): "
  read overwrite_choice

  if [ "$overwrite_choice" != "y" ]; then
    echo "Aborted."
    exit 1
  fi

  # Remove existing .clangd and symlink
  rm -f .clangd compile_commands.json
  echo "Existing .clangd file and symlink removed."
fi

# Create a symlink in the current directory
ln -s "$selected_file" compile_commands.json

# Create .clangd file with the specified content
cat <<EOF > .clangd
CompileFlags:
    Add: [-xc++, -Wall]
    Remove: [-W*, -m*, --sysroot]
    compiler: g++
Index:
    Background: Build
    StandardLibrary: Yes
Diagnostics:
    UnusedIncludes: Strict
Completion:
    AllScopes: Yes
InlayHints:
    Enabled: Yes
    ParameterNames: Yes
    DeducedTypes: Yes
Hover:
    ShowAKA: Yes
EOF

echo "Symlink created: compile_commands.json -> $selected_file"
echo "Created .clangd file with settings."
