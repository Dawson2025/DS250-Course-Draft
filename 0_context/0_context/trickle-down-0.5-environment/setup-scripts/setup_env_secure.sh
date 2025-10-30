#!/bin/bash
# Secure .env file setup script
# This script helps set up .env with proper security permissions

# Script is in: 0_context/0_context/trickle-down-0.5-environment/setup-scripts/
# Project root is 6 levels up
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../../.." && pwd)"
ENV_FILE="${PROJECT_ROOT}/.env"
ENV_EXAMPLE="${PROJECT_ROOT}/.env.example"

echo "=== Secure .env File Setup ==="
echo ""

# Check if .env.example exists
if [ ! -f "$ENV_EXAMPLE" ]; then
    echo "❌ Error: .env.example not found at $ENV_EXAMPLE"
    exit 1
fi

# Check if .env already exists
if [ -f "$ENV_FILE" ]; then
    echo "⚠️  .env file already exists at:"
    echo "   $ENV_FILE"
    echo ""
    read -p "Do you want to update permissions only? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        chmod 600 "$ENV_FILE"
        echo "✓ Permissions updated to 600 (owner read/write only)"
        ls -la "$ENV_FILE"
        exit 0
    else
        echo "Skipping. Edit $ENV_FILE manually if needed."
        exit 0
    fi
fi

# Create .env from example
echo "Creating .env file from .env.example..."
cp "$ENV_EXAMPLE" "$ENV_FILE"

# Set secure permissions immediately
chmod 600 "$ENV_FILE"

echo ""
echo "✓ .env file created at:"
echo "   $ENV_FILE"
echo ""
echo "✓ Permissions set to 600 (owner read/write only)"
ls -la "$ENV_FILE"
echo ""
echo "📝 Next steps:"
echo "   1. Edit the file: nano $ENV_FILE"
echo "   2. Replace placeholders with your actual LDS Church credentials"
echo "   3. Save and close"
echo ""
echo "🔒 Security Note:"
echo "   - File permissions are already secure (600)"
echo "   - File is in .gitignore (won't be committed)"
echo "   - Only you can read/write this file"

