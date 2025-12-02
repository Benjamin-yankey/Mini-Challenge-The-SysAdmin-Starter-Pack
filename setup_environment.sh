#!/bin/bash

set -e

# Remove existing directories if they exist
rm -rf logs configs scripts

# Create directories
mkdir -p logs configs scripts
echo "Created directories: logs, configs, scripts"

# Create logs/system.log
echo "[2025-12-02 10:00:00] System initialized successfully" > logs/system.log
echo "Created: logs/system.log"

# Create configs/app.conf
echo "APP_ENV=production" > configs/app.conf
echo "Created: configs/app.conf"

# Create scripts/backup.sh
cat > scripts/backup.sh <<'EOF'
#!/bin/bash
echo "Running backup at $(date)"
EOF
echo "Created: scripts/backup.sh"

# Set permissions
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

echo ""
echo "Directory Structure:"
if command -v tree &> /dev/null; then
    tree
else
    ls -R
fi

echo ""
echo "Permissions Overview:"
ls -lR