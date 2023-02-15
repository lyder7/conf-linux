#!/bin/bash

# Opprett en sikkerhetskopi av filer i en bestemt mappe
backup_dir=/path/to/backup/folder
backup_file=backup_$(date +%Y%m%d).tar.gz
tar -zcvf $backup_dir/$backup_file /path/to/folder/to/backup
