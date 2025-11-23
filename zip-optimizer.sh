#!/bin/bash
# (C) 2025 Benjamin Steenkamer
# Recompress all the ZIP archives in a directory using the highest compression level
# Replace the original ZIP archive if space is saved
# Prints the space saved per file and the total space saved at the end
# Usage: ./zip-optimizer <directory>

TARGET_DIR=$(realpath "${1:-.}")   # Get the absolute path of given directory or current dir if none was given
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory not found: $TARGET_DIR"
  exit 1
fi

# Find zip files within the directory
# Paths will be absolute because TARGET_DIR is an absolute path
ZIP_FILES=$(find "$TARGET_DIR" -name "*.zip" | sort)
if [ -z "$ZIP_FILES" ]; then
  echo "No ZIP archives found: $TARGET_DIR"
  exit 1
fi

FILE_COUNT=$(echo "$ZIP_FILES" | wc -l)
FILE_COUNT_WIDTH=${#FILE_COUNT} # Get the number of digits in the file count
echo "Optimizing $FILE_COUNT ZIP archives in $TARGET_DIR"

TEMP_DIR="/tmp/zip-optimizer"
rm -rf "$TEMP_DIR"    # Delete previous run if it failed
mkdir -p "$TEMP_DIR"

count=1
total_saved_bytes=0
# TODO make the syntax of this loop better
while IFS= read -r zip_file; do
    printf "%0${FILE_COUNT_WIDTH}d/${FILE_COUNT} Processing ${zip_file}\n" "$count"

    old_size_bytes=$(stat -c %s "$zip_file")
    7z x "$zip_file" -y -o"$TEMP_DIR" > /dev/null

    file_basename=$(basename "$zip_file")
    new_zip_file="$TEMP_DIR/$file_basename"
    7z a -tzip -mx=9 -mmt=on "$new_zip_file" "$TEMP_DIR/*" > /dev/null  # Create a ZIP archive, using max compression level and multithreading
    new_size_bytes=$(stat -c %s "$new_zip_file")

    if [ "$new_size_bytes" -lt "$old_size_bytes" ]; then
        bytes_saved=$(( old_size_bytes - new_size_bytes ))
        human_saved=$(numfmt --to=iec-i --suffix=B --format='%.1f' $bytes_saved)
        echo "  Saved ${human_saved} (${bytes_saved})"
        mv -f "$new_zip_file" "$zip_file"
        total_saved_bytes=$(( total_saved_bytes + bytes_saved ))
    fi

    rm -rf "$TEMP_DIR"/*
    count=$(( count + 1 ))
done <<< "$ZIP_FILES"

rm -rf "$TEMP_DIR"

total_saved_human=$(numfmt --to=iec-i --suffix=B --format='%.1f' $total_saved_bytes)
echo "Total space saved: $total_saved_human ($total_saved_bytes)"
