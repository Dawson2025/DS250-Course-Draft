# Claude Code MCP Configuration
*Special Setup Requirements for Claude Code CLI*

## Important: Claude Code is Different

**Claude Code does NOT use `~/.claude/mcp.json` directly**. Unlike other AI assistants (Cursor, Warp, etc.) that read from configuration files, Claude Code uses its own CLI to manage MCP servers.

## Why the Difference?

- **Other Assistants**: Read from `~/.assistant/mcp.json` (symlinked to `~/.config/mcp/mcp.json`)
- **Claude Code**: Uses `claude mcp` CLI commands to manage servers
- **Storage**: Claude Code stores configuration in `~/.claude.json` (project-specific)

## Claude Code MCP Commands

### List Configured Servers

```bash
claude mcp list
```

**Output**:
```
Checking MCP server health...

playwright: npx -y @playwright/mcp@latest --browser chromium - ✓ Connected
chrome-devtools: npx -y chrome-devtools-mcp@latest - ✓ Connected
browser: npx -y @agent-infra/mcp-server-browser - ✓ Connected
web-search: npx -y tavily-mcp - ✓ Connected
```

### Add MCP Server (Simple - No Environment Variables)

```bash
claude mcp add --transport stdio <name> -- <command> [args...]
```

**Examples**:

```bash
# Playwright
claude mcp add --transport stdio playwright -- npx -y @playwright/mcp@latest --browser chromium

# Chrome DevTools
claude mcp add --transport stdio chrome-devtools -- npx -y chrome-devtools-mcp@latest

# Browser
claude mcp add --transport stdio browser -- npx -y @agent-infra/mcp-server-browser
```

### Add MCP Server with Environment Variables (Use JSON)

For servers requiring environment variables (API keys, tokens), use `add-json`:

```bash
claude mcp add-json <name> '<json-config>'
```

**Examples**:

```bash
# Web Search (Tavily)
claude mcp add-json web-search '{"command":"npx","args":["-y","tavily-mcp"],"env":{"TAVILY_API_KEY":"your-api-key"}}'

# GitHub Search
claude mcp add-json github-search '{"command":"npx","args":["-y","github-mcp-server"],"env":{"GITHUB_TOKEN":"your-github-token"}}'

# Filesystem
claude mcp add-json filesystem '{"command":"npx","args":["-y","@modelcontextprotocol/server-filesystem","/path/to/project"]}'
```

### Remove MCP Server

```bash
claude mcp remove <name>
```

**Example**:
```bash
claude mcp remove filesystem
```

### Get Server Details

```bash
claude mcp get <name>
```

## Complete DS250 Setup

To configure all MCP servers for DS250 development:

```bash
# 1. Playwright (Browser automation)
claude mcp add --transport stdio playwright -- npx -y @playwright/mcp@latest --browser chromium

# 2. Chrome DevTools (Browser debugging)
claude mcp add --transport stdio chrome-devtools -- npx -y chrome-devtools-mcp@latest

# 3. Browser (Web automation)
claude mcp add --transport stdio browser -- npx -y @agent-infra/mcp-server-browser

# 4. Web Search (Tavily - replace YOUR_KEY)
claude mcp add-json web-search '{"command":"npx","args":["-y","tavily-mcp"],"env":{"TAVILY_API_KEY":"YOUR_TAVILY_KEY"}}'

# 5. GitHub Search (replace YOUR_TOKEN)
claude mcp add-json github-search '{"command":"npx","args":["-y","github-mcp-server"],"env":{"GITHUB_TOKEN":"YOUR_GITHUB_TOKEN"}}'

# 6. Filesystem (DS250 course directory)
claude mcp add-json filesystem '{"command":"npx","args":["-y","@modelcontextprotocol/server-filesystem","/home/dawson/code/DS250-Course-Draft"]}'
```

## Verify Setup

After adding servers:

```bash
# 1. List servers
claude mcp list

# 2. Restart Claude Code
exit  # or Ctrl+D

# 3. Start new session
claude

# 4. Check MCP servers available
/mcp
```

## Configuration Storage

Claude Code stores MCP configuration in:

- **Global**: `~/.claude.json`
- **Project-specific**: `./.claude.json` (in project directory)

**View configuration**:
```bash
cat ~/.claude.json | jq '.mcp' 2>/dev/null || cat ~/.claude.json | grep -A 50 mcp
```

## Differences from Universal MCP Setup

| Aspect | Other Assistants | Claude Code |
|--------|------------------|-------------|
| **Config File** | `~/.assistant/mcp.json` | `~/.claude.json` |
| **Setup Method** | Symlink to master | CLI commands |
| **Sync** | Automatic via symlink | Manual via CLI |
| **Storage** | Shared universal config | Project-specific |
| **Update** | Edit one file | Run CLI commands |

## Synchronization Strategy

Since Claude Code doesn't use the universal config, you have two options:

### Option 1: Manual Sync (Current)

Manually add servers to Claude Code when needed:

```bash
# After changing ~/.config/mcp/mcp.json
# Manually add servers to Claude Code
claude mcp add-json <name> '<json>'
```

### Option 2: Script-Based Sync (Future Enhancement)

Create a script to read `~/.config/mcp/mcp.json` and add servers to Claude Code:

```bash
# Future: sync_mcp_to_claude.sh
# Reads ~/.config/mcp/mcp.json
# Executes claude mcp add-json for each server
```

## Troubleshooting

### Server Shows "Failed to connect"

**Problem**: `claude mcp list` shows server but marked as failed

**Solutions**:

1. **Check npx package installation**:
   ```bash
   npx -y <package-name> --help
   ```

2. **Verify environment variables**:
   ```bash
   # Check if API key is correct
   claude mcp get <server-name>
   ```

3. **Remove and re-add**:
   ```bash
   claude mcp remove <server-name>
   claude mcp add-json <server-name> '<corrected-json>'
   ```

4. **Check package exists**:
   ```bash
   npm info <package-name>
   ```

### `/mcp` Shows "No MCP servers configured"

**Problem**: Added servers but `/mcp` shows nothing

**Solution**: Restart Claude Code

```bash
# Exit current session
exit  # or Ctrl+D

# Start new session
claude

# Check again
/mcp
```

### JSON Parse Errors

**Problem**: Invalid JSON when using `add-json`

**Solution**: Use single quotes for outer string, double quotes inside JSON

```bash
# CORRECT
claude mcp add-json name '{"key":"value"}'

# WRONG
claude mcp add-json name "{"key":"value"}"
claude mcp add-json name {"key":"value"}
```

### Environment Variable Format Errors

**Problem**: Error about environment variable format when using `--env`

**Solution**: Use `add-json` instead of `--env` flag

```bash
# DON'T USE THIS (doesn't work reliably)
claude mcp add --transport stdio --env KEY=value name -- command

# USE THIS INSTEAD
claude mcp add-json name '{"command":"command","args":["arg"],"env":{"KEY":"value"}}'
```

## Best Practices for DS250

### 1. Add Servers Per Project

Claude Code MCP config is project-specific. Add servers when working on DS250:

```bash
cd ~/code/DS250-Course-Draft
claude mcp add-json filesystem '{"command":"npx","args":["-y","@modelcontextprotocol/server-filesystem","/home/dawson/code/DS250-Course-Draft"]}'
```

### 2. Document Your Servers

Keep a list of commands used:

```bash
# Create a setup script for DS250
cat > ~/code/DS250-Course-Draft/setup-claude-mcp.sh << 'EOF'
#!/bin/bash
# DS250 Claude Code MCP Setup

claude mcp add --transport stdio playwright -- npx -y @playwright/mcp@latest --browser chromium
claude mcp add --transport stdio chrome-devtools -- npx -y chrome-devtools-mcp@latest
claude mcp add --transport stdio browser -- npx -y @agent-infra/mcp-server-browser
claude mcp add-json web-search '{"command":"npx","args":["-y","tavily-mcp"],"env":{"TAVILY_API_KEY":"YOUR_KEY"}}'
claude mcp add-json filesystem '{"command":"npx","args":["-y","@modelcontextprotocol/server-filesystem","/home/dawson/code/DS250-Course-Draft"]}'

echo "MCP servers configured for DS250"
claude mcp list
EOF

chmod +x ~/code/DS250-Course-Draft/setup-claude-mcp.sh
```

### 3. Verify After Each Addition

```bash
claude mcp add-json <name> '<json>'
claude mcp list  # Immediately verify
```

### 4. Test in New Session

```bash
# After adding all servers
exit

# Start fresh
claude

# Confirm available
/mcp
```

## Import from Other Assistants (Future)

Claude Code has experimental support for importing from Claude Desktop:

```bash
claude mcp add-from-claude-desktop
```

**Note**: This only works for Claude Desktop on Mac and WSL, not for other assistants like Cursor.

## API Keys and Security

### Storing API Keys

Claude Code stores API keys in `~/.claude.json`. Protect this file:

```bash
chmod 600 ~/.claude.json
```

### Rotating Keys

```bash
# 1. Remove old server
claude mcp remove web-search

# 2. Add with new key
claude mcp add-json web-search '{"command":"npx","args":["-y","tavily-mcp"],"env":{"TAVILY_API_KEY":"NEW_KEY"}}'

# 3. Verify
claude mcp list
```

## Future Improvements Needed

1. **Auto-sync script**: Read `~/.config/mcp/mcp.json` and sync to Claude Code
2. **Export command**: `claude mcp export` to generate JSON for backup
3. **Import command**: `claude mcp import <file.json>` to restore configuration
4. **Global vs project**: Better support for global MCP servers

---

**Key Takeaway**: Claude Code requires CLI-based setup, not file-based configuration like other assistants. Use `claude mcp add-json` for servers with environment variables.

**Last Updated**: 2025-10-23
**Applies To**: Claude Code CLI only
