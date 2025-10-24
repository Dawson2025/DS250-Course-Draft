# Universal MCP Configuration - Setup Guide
*Quick Start for Installing Universal MCP System*

## Prerequisites

- WSL Ubuntu (or any Linux environment)
- npm/npx installed
- Multiple AI coding assistants (Cursor, Claude Code, etc.)

## Quick Setup

### Step 1: Verify Installation

The universal MCP system is already installed. Verify:

```bash
# Check master config exists
ls -la ~/.config/mcp/

# Should show:
# mcp.json
# setup_universal_mcp.sh
# README.md
```

### Step 2: Verify Symlinks

```bash
# List all AI assistant symlinks
ls -la ~/.*/mcp.json

# Should show multiple symlinks all pointing to:
# /home/dawson/.config/mcp/mcp.json
```

### Step 3: Test Configuration

```bash
# View current MCP servers
cat ~/.config/mcp/mcp.json

# Test from different assistants
cat ~/.cursor/mcp.json   # Same content
cat ~/.claude/mcp.json   # Same content
```

## Installation from Scratch (If Needed)

If you need to set up on a new system:

### 1. Create Master Configuration

```bash
# Create directory
mkdir -p ~/.config/mcp

# Create configuration file
cat > ~/.config/mcp/mcp.json << 'EOF'
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-filesystem",
        "/home/dawson/code/DS250-Course-Draft"
      ]
    }
  }
}
EOF
```

### 2. Create Setup Script

Copy the setup script from this repository:

```bash
# Download or copy setup script to:
# ~/.config/mcp/setup_universal_mcp.sh

# Make executable
chmod +x ~/.config/mcp/setup_universal_mcp.sh
```

Or create it manually:

```bash
cat > ~/.config/mcp/setup_universal_mcp.sh << 'SCRIPT'
#!/bin/bash
# Universal MCP Configuration Setup

UNIVERSAL_MCP_CONFIG="$HOME/.config/mcp/mcp.json"

create_mcp_symlink() {
    local agent_name="$1"
    local config_path="$2"
    mkdir -p "$(dirname "$config_path")" 2>/dev/null
    [ -f "$config_path" ] && [ ! -L "$config_path" ] && mv "$config_path" "${config_path}.backup"
    [ -L "$config_path" ] && rm "$config_path"
    ln -s "$UNIVERSAL_MCP_CONFIG" "$config_path"
    [ -L "$config_path" ] && echo "   ✅ $agent_name"
}

# Add all AI assistants
create_mcp_symlink "Cursor" "$HOME/.cursor/mcp.json"
create_mcp_symlink "Claude Code" "$HOME/.claude/mcp.json"
create_mcp_symlink "Warp AI" "$HOME/.warp/mcp.json"
# ... add more as needed
SCRIPT

chmod +x ~/.config/mcp/setup_universal_mcp.sh
```

### 3. Run Setup

```bash
bash ~/.config/mcp/setup_universal_mcp.sh
```

## Adding MCP Servers

### Common MCP Servers

#### 1. Filesystem Access

```json
{
  "filesystem": {
    "command": "npx",
    "args": [
      "@modelcontextprotocol/server-filesystem",
      "/path/to/your/project"
    ]
  }
}
```

#### 2. Web Search (Tavily)

```json
{
  "web-search": {
    "command": "npx",
    "args": ["tavily-mcp"],
    "env": {
      "TAVILY_API_KEY": "your-api-key"
    }
  }
}
```

Get API key: https://tavily.com

#### 3. GitHub Integration

```json
{
  "github-search": {
    "command": "npx",
    "args": ["github-mcp-server"],
    "env": {
      "GITHUB_TOKEN": "your-github-token"
    }
  }
}
```

Create token: https://github.com/settings/tokens

#### 4. Browser Automation (Playwright)

```json
{
  "playwright": {
    "command": "npx",
    "args": [
      "-y",
      "@playwright/mcp@latest",
      "--browser",
      "chromium"
    ]
  }
}
```

#### 5. Chrome DevTools

```json
{
  "chrome-devtools": {
    "command": "npx",
    "args": ["-y", "chrome-devtools-mcp@latest"]
  }
}
```

#### 6. Browser Server

```json
{
  "browser": {
    "command": "npx",
    "args": ["@agent-infra/mcp-server-browser"]
  }
}
```

#### 7. Context7 (Semantic Search)

```json
{
  "context7": {
    "command": "npx",
    "args": ["-y", "@upstash/context7-mcp"],
    "env": {
      "CONTEXT7_API_KEY": "your-api-key"
    }
  }
}
```

Get API key: https://upstash.com

## Configuring for DS250 Course

### Recommended Setup

For DS250 course development, configure these servers:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-filesystem",
        "/home/dawson/code/DS250-Course-Draft"
      ]
    },
    "web-search": {
      "command": "npx",
      "args": ["tavily-mcp"],
      "env": {
        "TAVILY_API_KEY": "your-key"
      }
    },
    "github-search": {
      "command": "npx",
      "args": ["github-mcp-server"],
      "env": {
        "GITHUB_TOKEN": "your-token"
      }
    }
  }
}
```

### Why These Servers?

- **filesystem**: Access course content, templates, projects
- **web-search**: Research Python libraries, Quarto features
- **github-search**: Find examples, check course repository

## Verification

### Test MCP Servers

#### Test Filesystem

```bash
# In Claude Code or Cursor, ask:
"Can you list the files in the Projects directory?"

# Should access via MCP filesystem server
```

#### Test Web Search

```bash
# In Claude Code, ask:
"Search the web for latest pandas documentation"

# Should use Tavily MCP server
```

#### Test GitHub

```bash
# In Claude Code, ask:
"Search GitHub for Quarto examples"

# Should use GitHub MCP server
```

### Verify All Assistants See Same Config

```bash
# Open Cursor - check MCP servers available
# Open Claude Code - check MCP servers available
# Open Warp - check MCP servers available

# All should show identical server list
```

## Troubleshooting Setup

### Issue: Script Fails

```bash
# Check master config exists
ls -la ~/.config/mcp/mcp.json

# If not, create it first
mkdir -p ~/.config/mcp
touch ~/.config/mcp/mcp.json
# Add configuration...
```

### Issue: Permission Denied

```bash
# Fix file permissions
chmod 600 ~/.config/mcp/mcp.json
chmod +x ~/.config/mcp/setup_universal_mcp.sh

# Fix ownership
chown $USER:$USER ~/.config/mcp/mcp.json
```

### Issue: Symlink Not Created

```bash
# Manual symlink creation
rm ~/.assistant/mcp.json  # Remove if exists
ln -s ~/.config/mcp/mcp.json ~/.assistant/mcp.json

# Verify
readlink ~/.assistant/mcp.json
```

### Issue: npx Not Found

```bash
# Install Node.js and npm
# On Ubuntu/WSL:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts

# Verify
npx --version
```

## Post-Setup

### Restart AI Assistants

After setup, restart all AI assistants to load MCP configuration:

```bash
# Close all AI assistant windows/processes
# Reopen them

# Or restart WSL
wsl --shutdown
# Reopen WSL
```

### Test Functionality

Create a test file to verify MCP servers work:

```bash
# Create test file
echo "Test MCP setup" > ~/mcp-test.txt

# In AI assistant, ask:
"Can you read the file ~/mcp-test.txt via MCP?"

# Should successfully read via filesystem server
```

### Update API Keys

```bash
# Edit master config
nano ~/.config/mcp/mcp.json

# Add your actual API keys
# Save and exit

# All AI assistants automatically use new keys
```

## Next Steps

1. ✅ Verify setup complete
2. ✅ Test with one AI assistant
3. ✅ Add API keys for web search and GitHub
4. ✅ Test with all AI assistants
5. ✅ Create backup of configuration
6. ✅ Document custom MCP servers added

## Maintenance

### Weekly

- Check symlinks intact: `ls -la ~/.*/mcp.json`

### Monthly

- Review API key usage
- Update MCP server packages (auto-updated via npx -y)
- Add new AI assistants to setup script

### Quarterly

- Backup configuration
- Review and remove unused servers
- Audit security (permissions, token rotation)

---

**Setup Complete!** You now have a universal MCP configuration system that works across all AI coding assistants.

For detailed usage, see [`README.md`](README.md)
