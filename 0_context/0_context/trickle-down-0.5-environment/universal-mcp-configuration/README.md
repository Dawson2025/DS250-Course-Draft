# Universal MCP Configuration Setup
*Trickle-Down Level 0.5: Environment Setup - Universal Tool*

## Overview

The Universal MCP (Model Context Protocol) Configuration is a cross-AI-agent tool management system that provides **a single source of truth** for MCP server configurations across all coding assistants.

**Location**: `~/.config/mcp/`

**Purpose**: Enable all AI coding assistants (Cursor, Claude Code, Warp, Copilot, etc.) to share the same MCP servers without manual synchronization.

## Why This Exists (Level 0.5 Context)

At the environment setup level (0.5), we establish universal systems that:
- Work across any project
- Provide consistent tool access to all AI agents
- Reduce configuration complexity
- Enable parallel AI agent usage

The Universal MCP Configuration achieves this by using **symbolic links** to create a single configuration file that all AI assistants reference.

## Architecture

### Single Source of Truth Pattern

```
~/.config/mcp/mcp.json (MASTER)
           ↓
    ┌──────┴──────┬──────────┬──────────┬───────────┐
    ↓             ↓          ↓          ↓           ↓
~/.cursor/   ~/.claude/  ~/.warp/  ~/.codex/  ~/.gemini/
mcp.json     mcp.json    mcp.json  mcp.json   mcp.json
  (symlink)   (symlink)   (symlink) (symlink)  (symlink)
```

### Components

1. **Master Configuration** (`~/.config/mcp/mcp.json`)
   - Contains all MCP server definitions
   - Includes API keys and environment variables
   - Single file to edit for universal updates

2. **Setup Script** (`~/.config/mcp/setup_universal_mcp.sh`)
   - Automated symlink creation for all known AI assistants
   - Backs up existing configurations
   - Validates master config exists

3. **Documentation** (`~/.config/mcp/README.md`)
   - Usage instructions
   - Troubleshooting guide
   - Security notes

## Installation

### Initial Setup

The setup has already been completed. To verify:

```bash
# Check master config exists
cat ~/.config/mcp/mcp.json

# Verify symlinks
ls -la ~/.*/mcp.json

# View configured servers
cat ~/.config/mcp/mcp.json | jq '.mcpServers | keys'
```

### ⚠️ Important: Claude Code Exception

**Claude Code uses a different system**. It does NOT read from `~/.claude/mcp.json`. Instead, it requires CLI-based configuration.

See **[claude-code-setup.md](claude-code-setup.md)** for Claude Code-specific instructions.

**Quick Summary for Claude Code**:
```bash
# Use CLI commands, not config files
claude mcp add-json web-search '{"command":"npx","args":["-y","tavily-mcp"],"env":{"TAVILY_API_KEY":"your-key"}}'
claude mcp list
```

### Re-run Setup (If Needed)

```bash
# Re-create all symlinks
bash ~/.config/mcp/setup_universal_mcp.sh
```

### Add New AI Assistant

When installing a new AI coding assistant:

```bash
# Find where it stores config (check documentation)
# Then create symlink:
ln -s ~/.config/mcp/mcp.json ~/.new-assistant/mcp.json

# Or add to setup script and re-run
```

## Currently Configured AI Assistants

| Assistant | Config Path | Status |
|-----------|-------------|--------|
| Cursor | `~/.cursor/mcp.json` | ✅ Active |
| Claude Code | `~/.claude/mcp.json` | ✅ Active |
| Warp AI | `~/.warp/mcp.json` | ✅ Configured |
| Codex | `~/.codex/mcp.json` | ✅ Configured |
| Continue.dev | `~/.continue/mcp.json` | ✅ Configured |
| Aider | `~/.aider/mcp.json` | ✅ Configured |
| Cody (Sourcegraph) | `~/.cody/mcp.json` | ✅ Configured |
| GitHub Copilot | `~/.github-copilot/mcp.json` | ✅ Configured |
| Google Gemini | `~/.gemini/mcp.json` | ✅ Configured |
| TabNine | `~/.tabnine/mcp.json` | ✅ Configured |
| Windsurf | `~/.windsurf/mcp.json` | ✅ Configured |
| Void | `~/.void/mcp.json` | ✅ Configured |
| VS Code AI | `~/.vscode/mcp.json` | ✅ Configured |

## MCP Servers Configuration

### Currently Configured Servers

1. **context7** - Upstash Context7 for semantic search
   - Requires: `CONTEXT7_API_KEY`
   - Status: Needs API key configuration

2. **chrome-devtools** - Chrome DevTools integration
   - No configuration required
   - Provides browser debugging capabilities

3. **playwright** - Browser automation with Chromium
   - Browser: Chromium
   - Provides headless browser automation

4. **browser** - Agent Infrastructure browser server
   - General web automation capabilities

5. **web-search** - Tavily web search integration
   - Configured with API key
   - Provides web search capabilities to AI agents

6. **github-search** - GitHub repository search
   - Configured with personal access token
   - Enables GitHub interaction from AI agents

7. **filesystem** - Local filesystem access
   - Path: `/home/dawson/code/DS250-Course-Draft`
   - Provides file operations via MCP

### Adding a New MCP Server

Edit `~/.config/mcp/mcp.json`:

```json
{
  "mcpServers": {
    "existing-servers": "...",
    "new-server": {
      "command": "npx",
      "args": ["-y", "@package/mcp-server"],
      "env": {
        "API_KEY": "your-api-key"
      }
    }
  }
}
```

**All AI assistants automatically see the new server.**

### Removing an MCP Server

Edit `~/.config/mcp/mcp.json` and remove the server entry. Save the file.

**All AI assistants automatically lose access to the removed server.**

## Usage Patterns

### Edit Configuration

```bash
# Method 1: Edit master directly
nano ~/.config/mcp/mcp.json

# Method 2: Edit via any assistant (same file)
nano ~/.cursor/mcp.json
nano ~/.claude/mcp.json
nano ~/.warp/mcp.json

# All methods edit the same file!
```

### Verify Configuration

```bash
# List all symlinks
ls -la ~/.*/mcp.json

# Check if symlinks point to master
readlink ~/.cursor/mcp.json
# Output: /home/dawson/.config/mcp/mcp.json

# View current servers
cat ~/.config/mcp/mcp.json | grep -E '^\s+"[^"]+":' | head -20
```

### Backup Configuration

```bash
# Create backup
cp ~/.config/mcp/mcp.json ~/.config/mcp/mcp.json.backup.$(date +%Y%m%d)

# Restore from backup
cp ~/.config/mcp/mcp.json.backup.YYYYMMDD ~/.config/mcp/mcp.json
```

## Security Considerations

### API Keys and Tokens

The configuration contains sensitive data:
- Tavily API key (web search)
- GitHub personal access token
- Context7 API key (when configured)

**Protection measures**:
- File permissions: `600` (owner read/write only)
- Location: User home directory (not in project repos)
- Never commit to version control

### Updating Sensitive Values

```bash
# Edit configuration
nano ~/.config/mcp/mcp.json

# Update API key
# Find: "API_KEY": "old-key"
# Replace with: "API_KEY": "new-key"

# Save and exit
# All AI assistants automatically use new key
```

### Version Control

**DO NOT** track `~/.config/mcp/mcp.json` in git repos.

If you want to track structure:

```bash
# Create template without secrets
cp ~/.config/mcp/mcp.json ~/.config/mcp/mcp.json.template

# Replace secrets with placeholders
sed -i 's/"TAVILY_API_KEY": ".*"/"TAVILY_API_KEY": "YOUR_TAVILY_KEY"/' ~/.config/mcp/mcp.json.template
sed -i 's/"GITHUB_TOKEN": ".*"/"GITHUB_TOKEN": "YOUR_GITHUB_TOKEN"/' ~/.config/mcp/mcp.json.template

# Track template only
git add ~/.config/mcp/mcp.json.template
```

## Troubleshooting

### AI Assistant Not Finding MCP Servers

**Problem**: Assistant says "No MCP servers configured"

**Solution**:
```bash
# 1. Check symlink exists
ls -la ~/.assistant/mcp.json

# 2. Verify symlink target
readlink ~/.assistant/mcp.json

# 3. Re-create symlink
rm ~/.assistant/mcp.json
ln -s ~/.config/mcp/mcp.json ~/.assistant/mcp.json

# 4. Or re-run setup script
bash ~/.config/mcp/setup_universal_mcp.sh
```

### MCP Server Not Working

**Problem**: Specific server not responding

**Solution**:
```bash
# 1. Verify server in config
cat ~/.config/mcp/mcp.json | grep "server-name"

# 2. Test npx package
npx -y @package/mcp-server --help

# 3. Check environment variables
cat ~/.config/mcp/mcp.json | grep -A 5 "server-name"

# 4. Restart AI assistant
```

### Permission Denied

**Problem**: Cannot read/write config

**Solution**:
```bash
# Fix permissions
chmod 600 ~/.config/mcp/mcp.json

# Fix ownership
sudo chown $USER:$USER ~/.config/mcp/mcp.json

# Verify
ls -la ~/.config/mcp/mcp.json
```

### Broken Symlink

**Problem**: Symlink points to non-existent file

**Solution**:
```bash
# Remove broken symlink
rm ~/.assistant/mcp.json

# Re-create pointing to master
ln -s ~/.config/mcp/mcp.json ~/.assistant/mcp.json

# Verify
cat ~/.assistant/mcp.json
```

## Integration with DS250 Development

### Filesystem Server Configuration

The `filesystem` MCP server is configured for the DS250 course repository:

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

This allows AI assistants to:
- Read course content files
- Analyze project structure
- Suggest file organization
- Assist with content navigation

### Project-Specific Customization

While MCP config is universal, you can adjust for specific projects:

**Option 1: Change master config**
```bash
# Edit filesystem path for current project
nano ~/.config/mcp/mcp.json
# Change path, affects all assistants
```

**Option 2: Project-specific override** (if assistant supports)
```bash
# Some assistants allow local .mcp.json
# This overrides universal config for that project only
```

## Maintenance

### Regular Reviews

**Monthly**:
- Review API keys for rotation needs
- Check for new AI assistants to add
- Verify all symlinks are intact
- Update MCP server packages

```bash
# Check symlinks
ls -la ~/.*/mcp.json

# View current config
cat ~/.config/mcp/mcp.json
```

**Quarterly**:
- Update MCP server packages to latest
- Review and remove unused servers
- Audit API key usage
- Document changes

### Adding New Assistants

When new AI coding assistants are released:

1. **Find config location**:
   - Check assistant documentation
   - Look for `~/.assistant-name/`

2. **Add to setup script**:
   ```bash
   # Edit script
   nano ~/.config/mcp/setup_universal_mcp.sh

   # Add line
   create_mcp_symlink "New Assistant" "$HOME/.new-assistant/mcp.json"
   ```

3. **Re-run setup**:
   ```bash
   bash ~/.config/mcp/setup_universal_mcp.sh
   ```

### Updating MCP Packages

```bash
# MCP packages are installed via npx (-y flag)
# They auto-update to latest on each run
# No manual update needed

# To pin versions, specify in config:
{
  "server": {
    "command": "npx",
    "args": ["-y", "@package/mcp-server@1.2.3"]
  }
}
```

## Best Practices

### DO

✅ Edit `~/.config/mcp/mcp.json` for universal changes
✅ Backup before major changes
✅ Use strong API keys
✅ Document server purpose in comments (if JSON supports)
✅ Test server changes with one assistant first
✅ Keep permissions at `600`
✅ Re-run setup script when adding assistants

### DON'T

❌ Commit `mcp.json` with real API keys to git
❌ Share configuration files containing tokens
❌ Edit symlinks directly (edit master instead)
❌ Delete master config (breaks all assistants)
❌ Use world-readable permissions
❌ Store configuration in project directories
❌ Hard-code project-specific paths (affects all projects)

## Future Enhancements

### Planned Additions

1. **Environment-based configs**
   - Development vs production API keys
   - Project-specific MCP servers

2. **Validation script**
   - Check all symlinks valid
   - Test MCP servers connectivity
   - Verify API keys active

3. **Migration tool**
   - Migrate from assistant-specific configs
   - Merge multiple configs safely

4. **MCP server discovery**
   - Auto-discover available MCP packages
   - Suggest relevant servers for project type

---

**Documentation Level**: 0.5 (Environment Setup)
**Scope**: Universal (All Projects, All AI Assistants)
**Maintained By**: User configuration
**Last Updated**: 2025-10-23
