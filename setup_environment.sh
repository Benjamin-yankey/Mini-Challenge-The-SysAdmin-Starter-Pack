#!/bin/bash



set -euo pipefail

# Directories to create
dirs=( "logs" "configs" "scripts" )

# Create directories only if they don't exist
for d in "${dirs[@]}"; do
  if [ -d "$d" ]; then
    echo "Directory already exists: $d"
  else
    mkdir -p "$d"
    echo "Created directory: $d"
  fi
done


echo "Creating files with sample content..."


cat > logs/system.log <<'EOF'
[INFO] System log initialized
EOF

# configs/app.conf
cat > configs/app.conf <<'EOF'
# app configuration
settingA=true
EOF

# scripts/backup.sh
cat > scripts/backup.sh <<'EOF'

echo "Running backup (placeholder) at $(date)"
EOF

chmod 644 logs/system.log

# configs/app.conf
chmod 444 configs/app.conf

# scripts/backup.sh 
chmod 755 scripts/backup.sh

echo
echo "Directory tree and permissions:"

if command -v tree >/dev/null 2>&1; then
  tree -a .
else
  find . -print | sed -e 's/[^-][^\/]*\//  /g;s/^\././'
fi

echo
echo "Permissions (ls -lR):"
ls -lR

