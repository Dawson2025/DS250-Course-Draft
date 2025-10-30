# AI Agent Environment Configuration for DS250 Course Website
*Trickle-Down Level 0.5: Environment-Specific Configuration*

## This Project's Environment Choice: WSL Ubuntu + Quarto

**Project-Specific Decision:** This DS250 course website is being developed within a WSL Ubuntu environment using Cursor IDE with Claude Code.

**Important Context:** These environment rules apply because we CHOSE WSL Ubuntu for this project. Other projects might use different environments (native Linux, macOS, native Windows, Docker, etc.)

## Environment Setup for AI Agents (WSL Ubuntu + Quarto Context)

Since this project uses WSL Ubuntu with Quarto, AI agents must adapt to this environment:

### Claude Code (Cursor IDE - Current Agent):
- **Location Verification**: `pwd` should show `/home/dawson/code/DS250-Course-Draft/`
- **NOT Windows paths**: Avoid `/mnt/c/...` paths
- **Python Environment**: Use `.venv/` virtual environment (Python 3.12)
- **Quarto Commands**: Must be available in PATH (`quarto preview`, `quarto render`)
- **Integration**: Cursor IDE with Claude Code extension in WSL mode

### Other AI Agents (if used in future):
- Must work within this project's chosen WSL Ubuntu environment
- Project location: `/home/dawson/code/DS250-Course-Draft/` (NOT Windows paths)
- Use WSL Ubuntu development tools (Python 3.12, Quarto, pip)
- Respect virtual environment (`.venv/`)

## Why These Environment Rules Exist for THIS Project

**Project Decision:** We chose WSL Ubuntu because:
- Better performance for Python data science operations
- Native Linux tooling for Quarto rendering
- Optimal file system performance (not `/mnt/c/...`)
- Consistent development environment
- Better compatibility with course tools (pandas, lets-plot, scikit-learn)

**Important Note:** If this were a different project using a different environment (native Windows, macOS, Docker, etc.), the AI agent setup would be different.

## Required Tools and Versions

### Python Environment
```bash
# Python version
python --version  # Should output: Python 3.12.3

# Virtual environment location
ls -la .venv/  # Should exist

# Activate virtual environment
source .venv/bin/activate

# Required packages
pip list | grep -E "pandas|numpy|scikit-learn|lets-plot|palmerpenguins|nbformat|nbclient|pyyaml|setuptools"
```

**Expected packages**:
- numpy
- pandas
- scikit-learn
- lets-plot
- palmerpenguins
- nbformat
- nbclient
- pyyaml
- setuptools

### Quarto
```bash
# Quarto version check
quarto --version  # Should output version (any recent version)

# Quarto capabilities check
quarto check  # Verifies installation and dependencies
```

### Git
```bash
# Git should be available
git --version

# Repository status
git status  # Should show clean or tracked changes
```

## Agent-Specific Integration

### Claude Code in Cursor IDE
**Current Setup**:
- IDE: Cursor running in WSL mode
- Extension: Claude Code integrated
- Terminal: WSL Ubuntu terminal (not PowerShell/CMD)
- File System: Direct WSL access (not `/mnt/c/...`)

**Verification Commands**:
```bash
# 1. Check we're in WSL
uname -a  # Should show Linux

# 2. Check location
pwd  # Should be /home/dawson/code/DS250-Course-Draft

# 3. Check Python
python --version  # Should be 3.12.x

# 4. Check Quarto
quarto --version  # Should show version

# 5. Check git
git status  # Should show repository status
```

### Warp AI Assistant (if used)
- Must enter WSL environment first: `wsl` command if starting from Windows
- Navigate to: `cd ~/code/DS250-Course-Draft`
- Verify location: `pwd` should show `/home/dawson/code/DS250-Course-Draft`

### GitHub Copilot (if used)
- Must be configured for WSL workspace
- Index should include WSL file paths
- Terminal operations should use WSL bash

## Common Environment Issues

### Issue: Wrong Path Separator
**Problem**: Using Windows paths like `C:\Users\...` or `/mnt/c/...`
**Solution**: Always use WSL paths like `/home/dawson/code/DS250-Course-Draft/`

### Issue: Python Not Found
**Problem**: `python: command not found`
**Solution**:
```bash
# Activate virtual environment
source .venv/bin/activate

# Verify Python is now available
which python  # Should show .venv/bin/python
```

### Issue: Quarto Not Found
**Problem**: `quarto: command not found`
**Solution**: Quarto needs to be installed in WSL (not just Windows)
```bash
# Check if Quarto is installed
which quarto

# If not, install Quarto for Linux
# See: https://quarto.org/docs/get-started/
```

### Issue: Permission Denied
**Problem**: Permission errors when editing files
**Solution**:
```bash
# Check file ownership
ls -la

# Files should be owned by dawson:dawson
# If not, fix ownership:
sudo chown -R dawson:dawson .
```

## Development Workflow for AI Agents

### Starting a Session
```bash
# 1. Verify environment
pwd  # Should be /home/dawson/code/DS250-Course-Draft
uname -a  # Should show Linux (WSL)

# 2. Activate Python environment
source .venv/bin/activate

# 3. Check git status
git status

# 4. Start Quarto preview (if making content changes)
quarto preview  # Opens browser with live reload
```

### Working with Quarto Files
```bash
# Edit .qmd files in appropriate directory
# - Projects/*.qmd for project specifications
# - Templates/*.qmd for student templates
# - Workbooks/*.qmd for practice workbooks
# - Setup/*.qmd for installation guides

# Preview specific file
quarto render path/to/file.qmd

# Preview entire site with live reload
quarto preview

# Full site render
quarto render
```

### Before Committing Changes
```bash
# 1. Render changed files
quarto render path/to/changed/file.qmd

# 2. Check for errors
# Look for rendering errors in terminal output

# 3. Test navigation (if changed _quarto.yml)
quarto preview
# Click through navigation to verify changes

# 4. Check git status
git status

# 5. Review changes
git diff
```

## File Permissions

### Claude Code Permissions
Located in `.claude/settings.local.json`:
```json
{
  "permissions": {
    "allow": [
      "Bash(cat .venv/pyvenv.cfg)",
      "Read(//home/dawson/.claude/**)",
      "Read(//etc/**)"
    ],
    "defaultMode": "bypassPermissions"
  }
}
```

This allows Claude Code to:
- Read Python virtual environment configuration
- Access Claude settings
- Read system configuration files
- Bypass permissions for general operations (trusted environment)

## Performance Considerations

### Why WSL Home Directory?
- **Fast**: Native Linux file system performance
- **Slow**: `/mnt/c/...` has Windows-Linux interop overhead
- **Best**: Keep project in `~/code/DS250-Course-Draft/`

### Quarto Rendering
- **Preview mode**: Fast, incremental rendering with live reload
- **Full render**: Slower, processes all `.qmd` files
- **Single file**: Fast, only renders specified file

### Python Operations
- **Virtual environment**: Isolated, fast package loading
- **Pandas/NumPy**: Optimized for Linux
- **lets-plot**: Renders efficiently in Quarto

---

*Environment: WSL Ubuntu + Quarto + Python 3.12 (project-specific choice)*
*Project: DS250 Course Website*
*IDE: Cursor with Claude Code*
