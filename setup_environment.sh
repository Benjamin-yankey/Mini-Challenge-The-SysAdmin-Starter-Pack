#!/usr/bin/env bash

# Exit on error
set -e

# Create directories with existence check
if [ -d "logs" ]; then
    echo "Directory already exists: logs"
else
    mkdir logs
fi

if [ -d "configs" ]; then
    echo "Directory already exists: configs"
else
    mkdir configs
fi

if [ -d "scripts" ]; then
    echo "Directory already exists: scripts"
else
    mkdir scripts
fi

# Create files with sample content
echo "System log initialized" > logs/system.log
echo "App configuration file" > configs/app.conf
echo "#!/bin/bash echo 'Backup script running...'" > scripts/backup.sh

# Set permissions
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh


# Display directory structure
if command -v tree &> /dev/null; then
    tree
else
    echo "tree command not found. Using ls -R instead:"
    ls -R
fi


# Display permissions
ls -lR