# Universal MCP Manager
*Trickle-Down Level 0.75: Universal Tool - Cross-AI-Agent MCP Coordination*

## Tool Classification

**Level**: 0.75 (Universal Tools)
**Type**: Configuration Management System
**Scope**: All AI Assistants, All Projects
**Purpose**: Unified MCP server management across AI coding assistants

## What This Tool Does

The Universal MCP Manager provides a **single configuration file** that controls Model Context Protocol (MCP) servers for all AI coding assistants on the system. Instead of managing separate configurations for Cursor, Claude Code, Warp, Copilot, and other assistants, you maintain one master file.

### Problem It Solves

**Without Universal MCP Manager**:
```
~/.cursor/mcp.json        (config 1)
~/.claude/mcp.json        (config 2)
~/.warp/mcp.json          (config 3)
~/.codex/mcp.json         (config 4)
~/.gemini/mcp.json        (config 5)

Problem: 5 files to update when adding/removing MCP servers
Problem: Inconsistent server availability across assistants
Problem: API key synchronization issues
```

**With Universal MCP Manager**:
```
~/.config/mcp/mcp.json    (MASTER)
           ↓
    All assistants symlink to master

Solution: 1 file to update
Solution: All assistants always in sync
Solution: Single source of truth for API keys
```

## Architecture

### Components

1. **Master Configuration** (`~/.config/mcp/mcp.json`)
2. **Setup Automation** (`~/.config/mcp/setup_universal_mcp.sh`)
3. **Documentation** (`~/.config/mcp/README.md`)
4. **Symbolic Links** (created automatically)

### Design Pattern: Single Source of Truth

```
┌─────────────────────────────────────┐
│  ~/.config/mcp/mcp.json (MASTER)   │
│  {                                  │
│    "mcpServers": {                  │
│      "filesystem": {...},           │
│      "web-search": {...},           │
│      "github-search": {...}         │
│    }                                │
│  }                                  │
└──────────┬──────────────────────────┘
           │ (symlinked by all)
    ┌──────┴─────┬────────────┬────────────┐
    ↓            ↓            ↓            ↓
~/.cursor    ~/.claude    ~/.warp    ~/.codex
mcp.json     mcp.json     mcp.json   mcp.json
(symlink)    (symlink)    (symlink)  (symlink)
```

## Usage

### View Current Configuration

```bash
# View master config
cat ~/.config/mcp/mcp.json

# Or view from any assistant (same file)
cat ~/.cursor/mcp.json
cat ~/.claude/mcp.json
```

### Edit Configuration (Updates All Assistants)

```bash
# Edit master
nano ~/.config/mcp/mcp.json

# OR edit from any assistant path (same result)
nano ~/.cursor/mcp.json
```

**One edit affects all AI assistants immediately.**

### Add MCP Server

Edit `~/.config/mcp/mcp.json`:

```json
{
  "mcpServers": {
    "existing-servers": "...",
    "new-server": {
      "command": "npx",
      "args": ["-y", "@package/mcp-server"],
      "env": {
        "API_KEY": "your-key"
      }
    }
  }
}
```

Save. **All assistants now have access to the new server.**

### Remove MCP Server

Edit `~/.config/mcp/mcp.json`, remove server entry, save.

**All assistants immediately lose access.**

### Add New AI Assistant

```bash
# Method 1: Manual symlink
ln -s ~/.config/mcp/mcp.json ~/.new-assistant/mcp.json

# Method 2: Add to setup script and re-run
nano ~/.config/mcp/setup_universal_mcp.sh
# Add: create_mcp_symlink "New Assistant" "$HOME/.new-assistant/mcp.json"
bash ~/.config/mcp/setup_universal_mcp.sh
```

## Integration with DS250 Development

### Current Configuration for DS250

The Universal MCP Manager is configured with servers useful for DS250 course development:

#### 1. Filesystem Server
**Purpose**: Access DS250 course files
```json
{
  "filesystem": {
    "command": "npx",
    "args": [
      "@modelcontextprotocol/server-filesystem",
      "/home/dawson/code/DS250-Course-Draft"
    ]
  }
}
```

**Usage**:
- Read course content
- Analyze project structure
- Navigate templates
- Access datasets

#### 2. Web Search (Tavily)
**Purpose**: Research Python libraries, Quarto features

**Usage**:
- "Search for pandas groupby examples"
- "Find latest lets-plot documentation"
- "Research Quarto code folding options"

#### 3. GitHub Search
**Purpose**: Find examples, check course repository

**Usage**:
- "Search GitHub for Quarto course examples"
- "Find DS250 repository issues"
- "Look for similar course websites"

#### 4. Browser Automation (Playwright)
**Purpose**: Test course website rendering

**Usage**:
- Automated testing of Quarto output
- Screenshot generation
- Link validation

### Adapting for Different Projects

To work on a different project, update the filesystem path:

```bash
# Edit configuration
nano ~/.config/mcp/mcp.json

# Change filesystem path:
{
  "filesystem": {
    "args": [
      "@modelcontextprotocol/server-filesystem",
      "/home/dawson/code/OTHER-PROJECT"
    ]
  }
}

# Save - all assistants now access new project
```

## AI Assistant Coverage

### Currently Configured (13 Assistants)

| Assistant | Status | Use Case |
|-----------|--------|----------|
| **Cursor** | ✅ Active | Primary IDE for DS250 development |
| **Claude Code** | ✅ Active | CLI-based coding assistance |
| **Warp AI** | ✅ Configured | Terminal-based AI |
| **Codex** | ✅ Configured | OpenAI Codex CLI |
| **Continue.dev** | ✅ Configured | VS Code extension |
| **Aider** | ✅ Configured | AI pair programming |
| **Cody** | ✅ Configured | Sourcegraph AI |
| **GitHub Copilot** | ✅ Configured | GitHub's AI assistant |
| **Google Gemini** | ✅ Configured | Google's AI CLI |
| **TabNine** | ✅ Configured | AI code completion |
| **Windsurf** | ✅ Configured | Codeium's IDE |
| **Void** | ✅ Configured | AI coding assistant |
| **VS Code AI** | ✅ Configured | VS Code AI extensions |

### Adding More Assistants

When new AI assistants are released:

1. Find config location (check documentation)
2. Add to `~/.config/mcp/setup_universal_mcp.sh`
3. Re-run setup script

**Automatic forward compatibility** with future AI tools.

## Tool Benefits

### For DS250 Course Development

1. **Consistent Access**: All AI assistants can access course files
2. **Research Capabilities**: Web search for Python/Quarto help
3. **Code Discovery**: GitHub search for examples
4. **Unified API Keys**: One place to manage credentials

### For Multi-Project Workflows

1. **Quick Switching**: Change filesystem path once
2. **Project Templates**: Different MCP configs per project type
3. **Team Consistency**: Share MCP configuration across team

### For AI Assistant Experimentation

1. **Try New Tools**: Easy to add new AI assistants
2. **No Reconfiguration**: New assistant gets all servers immediately
3. **Fair Comparison**: All assistants have same capabilities

## Operational Patterns

### Daily Workflow

```bash
# Morning: Check configuration
cat ~/.config/mcp/mcp.json | jq '.mcpServers | keys'

# During work: Use any AI assistant
# All have same MCP servers available

# End of day: No cleanup needed
# Configuration persists
```

### Project Switching

```bash
# Switch to different project
nano ~/.config/mcp/mcp.json
# Update filesystem path
# Save

# All AI assistants now access new project
```

### Experiment with New MCP Server

```bash
# Add server to config
nano ~/.config/mcp/mcp.json

# Test with Claude Code
# If useful, keep it
# If not, remove from config

# No need to update multiple assistants
```

## Maintenance Tasks

### Weekly

```bash
# Verify symlinks intact
ls -la ~/.*/mcp.json

# Check all point to master
readlink ~/.cursor/mcp.json
readlink ~/.claude/mcp.json
```

### Monthly

```bash
# Review API keys
cat ~/.config/mcp/mcp.json | grep -i "key"

# Check for new AI assistants
# Add to setup script if needed

# Backup configuration
cp ~/.config/mcp/mcp.json ~/.config/mcp/mcp.json.backup
```

### Quarterly

```bash
# Audit MCP server usage
# Remove unused servers

# Update API keys (rotation)
# Test all configured servers

# Review AI assistant list
# Remove deprecated assistants
```

## Security Management

### API Key Protection

**Location**: Single file (`~/.config/mcp/mcp.json`)
**Permissions**: `600` (owner read/write only)
**Backup**: Use encrypted backups

```bash
# Check permissions
ls -la ~/.config/mcp/mcp.json
# Should show: -rw------- (600)

# Fix if needed
chmod 600 ~/.config/mcp/mcp.json
```

### Token Rotation

```bash
# Update API key in one place
nano ~/.config/mcp/mcp.json

# Change:
"API_KEY": "old-key"
# To:
"API_KEY": "new-key"

# Save - all assistants use new key immediately
```

### Version Control Safety

```bash
# NEVER commit real config
echo "~/.config/mcp/mcp.json" >> ~/.gitignore

# Create template for sharing
cp ~/.config/mcp/mcp.json ~/.config/mcp/mcp.json.template
sed -i 's/"API_KEY": ".*"/"API_KEY": "YOUR_API_KEY"/g' ~/.config/mcp/mcp.json.template

# Commit template only
git add ~/.config/mcp/mcp.json.template
```

## Comparison with Alternatives

### Alternative 1: Per-Assistant Configuration

**Pros**:
- Assistant-specific customization
- No symlink complexity

**Cons**:
- ❌ Maintain N configuration files
- ❌ API keys in multiple places
- ❌ Inconsistent server availability
- ❌ Sync issues between assistants

### Alternative 2: Environment Variables

**Pros**:
- Simple key management

**Cons**:
- ❌ Doesn't handle complex MCP server configs
- ❌ Still need per-assistant config files
- ❌ No automatic propagation

### Universal MCP Manager (Current)

**Pros**:
- ✅ Single source of truth
- ✅ Automatic synchronization
- ✅ Easy to add new assistants
- ✅ Centralized API key management
- ✅ No duplication

**Cons**:
- Requires symlink support (Linux/WSL)
- Global changes affect all assistants

**Winner**: Universal MCP Manager for most use cases

## Troubleshooting

See [`trickle-down-0.5-environment/universal-mcp-configuration/README.md`](../../trickle-down-0.5-environment/universal-mcp-configuration/README.md) for detailed troubleshooting.

### Quick Fixes

**Problem**: Assistant says "No MCP servers"
```bash
ls -la ~/.assistant/mcp.json  # Check symlink exists
readlink ~/.assistant/mcp.json  # Verify points to master
bash ~/.config/mcp/setup_universal_mcp.sh  # Re-create
```

**Problem**: Server not working
```bash
cat ~/.config/mcp/mcp.json | grep "server-name"  # Check in config
npx -y @package/mcp-server --help  # Test package
```

**Problem**: Permission denied
```bash
chmod 600 ~/.config/mcp/mcp.json  # Fix permissions
```

## Future Enhancements

1. **Validation Tool**: Check symlinks and config validity
2. **Server Discovery**: Auto-suggest relevant MCP servers
3. **Environment Profiles**: Dev/prod configurations
4. **Project Templates**: Preset configs for project types

---

**Tool Type**: Universal (0.75)
**Maintained In**: `~/.config/mcp/`
**Documentation**: [0.5 Setup Guide](../../trickle-down-0.5-environment/universal-mcp-configuration/)
**Last Updated**: 2025-10-23
