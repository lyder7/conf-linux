#!/bin/bash

# Set backup directory to home directory
backup_dir="$HOME/backup"

# Create backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
  echo "Created backup directory: $backup_dir"
fi

# Set backup filename to include the current date and time
backup_filename="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Compress specified directory to backup filename in backup directory
tar -czvf "$backup_dir/$backup_filename" /path/to/folder/to/backup

echo "Backup complete: $backup_dir/$backup_filename"

