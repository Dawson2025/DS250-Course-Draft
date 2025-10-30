# DS250 Course Website Initialization System
*Universal AI Agent: /init Command Protocol for DS250*

## Purpose
The `/init` command provides complete DS250 course website context to any AI coding agent by loading the documentation hierarchy in the correct order.

## Command Specification

### Usage
```
/init [optional: specific-focus-area]
```

**Examples**:
- `/init` - Full context loading
- `/init projects` - Full context + focus on project content
- `/init templates` - Full context + focus on student templates
- `/init navigation` - Full context + focus on site navigation

### Loading Sequence

#### Step 1: Agent Declaration Protocol
**AI Agent must declare**:
```
AI Agent: Claude Code (Cursor IDE)
Project: DS250 Course Website (DS250-Course-Draft)
Environment: WSL Ubuntu (/home/dawson/code/DS250-Course-Draft)
Technology Stack: Quarto + Python 3.12 + pandas + lets-plot
Session Focus: [focus area if specified, otherwise "Full Context Loading"]
Initialize: Starting context loading...
```

#### Step 2: Environment Verification
**Execute verification commands**:
```bash
# 1. Verify location
pwd  # Should output: /home/dawson/code/DS250-Course-Draft

# 2. Verify environment
uname -a  # Should show Linux (WSL)

# 3. Verify Python
python --version  # Should output: Python 3.12.x

# 4. Verify Quarto
quarto --version  # Should output Quarto version

# 5. Verify MCP configuration
ls -la ~/.config/mcp/mcp.json  # Universal MCP config exists
cat ~/.config/mcp/mcp.json | grep -c "mcpServers"  # Should show 1

# 6. Check repository status
git status  # Check for uncommitted changes
```

#### Step 3: Core Documentation Loading
**Load in order**:

1. **[0_context/0_context/trickle-down-1-project/constitution.md](../../trickle-down-1-project/constitution.md)**
   - Project mission and core principles
   - Technical standards and non-negotiables
   - Content quality standards
   - Traffic Light System
   - Project philosophy

2. **[CLAUDE.md](../../../../CLAUDE.md)**
   - Complete repository overview
   - Key technologies and common commands
   - Architecture and content organization
   - Development environment details

3. **[0_context/0_context/trickle-down-1-project/ds250_project_instructions.md](../../trickle-down-1-project/ds250_project_instructions.md)**
   - Critical rules for DS250 development
   - Quarto-first workflow
   - Template safety guidelines
   - Architecture quick reference
   - Common development tasks

4. **[0_context/0_context/trickle-down-0.5-environment/ds250_ai_agent_setup.md](../../trickle-down-0.5-environment/ds250_ai_agent_setup.md)**
   - Environment-specific configuration
   - Required tools and versions
   - Agent-specific integration
   - Common environment issues
   - Development workflow

5. **[0_context/0_context/trickle-down-0.5-environment/universal-mcp-configuration/README.md](../../../trickle-down-0.5-environment/universal-mcp-configuration/README.md)** (Optional - if working with MCP)
   - Universal MCP server management
   - Cross-AI-agent configuration
   - Available MCP servers
   - Setup and usage

#### Step 4: Configuration Loading
**Load key configuration**:

1. **[_quarto.yml](../../../../_quarto.yml)**
   - Site configuration
   - Navigation structure (navbar and sidebars)
   - Rendering rules and exclusions
   - Theme configuration

2. **Universal MCP Configuration** (if relevant)
   ```bash
   cat ~/.config/mcp/mcp.json | jq '.mcpServers | keys'
   # View available MCP servers
   ```
   - Filesystem access configured
   - Web search capabilities
   - GitHub integration
   - Output format settings

2. **[README_Codex_WSLA.md](../../../../README_Codex_WSLA.md)** (if relevant)
   - WSL setup instructions
   - Development workflow recommendations

#### Step 5: Feature Context (if focus area specified)

**If focus area = "projects"**:
- Read `0_context/0_context/trickle-down-2-features/README.md`
- List project files: `ls -la Projects/project_*.qmd`
- Review one project example: `head -100 Projects/project_1.qmd`

**If focus area = "templates"**:
- Read `Templates/ds250_project_template.qmd` (first 80 lines)
- List all templates: `ls -la Templates/*.qmd`
- Understand template structure and student usage

**If focus area = "navigation"**:
- Focus on `_quarto.yml` navbar and sidebar sections
- Understand menu structure and file references
- Test with `quarto preview`

**If focus area = "workbooks"**:
- List workbooks: `ls -la Workbooks/wb*.qmd`
- Review workbook structure
- Understand relationship to projects

**If focus area = "skill-builders"**:
- List skill builders: `ls -la "Skill Builders"/*.qmd`
- Review example skill builder
- Understand Python code patterns

#### Step 6: Current State Assessment
**Execute commands to understand current state**:
```bash
# 1. Check for uncommitted changes
git status

# 2. Check recent commits
git log --oneline -5

# 3. List main content directories
ls -la Projects/ Templates/ Workbooks/ "Skill Builders/" Setup/ "Course Materials/"

# 4. Check if site renders
quarto render --help  # Verify command available
```

#### Step 7: Agent Readiness Declaration
**AI Agent declares**:
```
Context Loading: Complete ✅
Environment: WSL Ubuntu verified ✅
Location: /home/dawson/code/DS250-Course-Draft ✅
Python: 3.12.x with virtual environment ✅
Quarto: Available and configured ✅
MCP: Universal configuration verified ✅
Configuration: _quarto.yml loaded ✅
Current State: [summarize git status, content structure] ✅
Focus Area: [if specified] ready for development ✅

MCP Servers Available: [list from ~/.config/mcp/mcp.json]
Ready for: [development task]
Session Goals: [based on focus area or ask user]
```

## Focus Area Details

### Projects Focus
**Understanding**:
- Project structure (Background, Client Request, Data, Tasks)
- Project numbering (0-6)
- Unit tasks (unit1_task1 through unit5_task4)
- Corresponding templates in Templates/ directory

**Common Tasks**:
- Creating new project specification
- Adding unit tasks
- Updating project content
- Testing project rendering

### Templates Focus
**Understanding**:
- Instructional vs. student-use templates
- Template exclusion from rendering
- Self-contained HTML output
- Code folding configuration

**Common Tasks**:
- Creating new project templates
- Creating unit task templates
- Maintaining template structure
- Testing template output

### Navigation Focus
**Understanding**:
- Navbar structure (top navigation)
- Sidebar structure (left navigation)
- Menu organization (dropdowns)
- File path references

**Common Tasks**:
- Adding new pages to navigation
- Reorganizing menu structure
- Testing navigation links
- Updating sidebar content

### Workbooks Focus
**Understanding**:
- Practice workbook structure (wb0-wb6)
- Alignment with projects
- Hands-on exercises
- Scaffolded learning

**Common Tasks**:
- Creating new workbooks
- Updating workbook content
- Aligning with project topics

### Skill Builders Focus
**Understanding**:
- Topic-focused educational content
- Python code examples
- lets-plot visualization patterns
- Supplementary learning resources

**Common Tasks**:
- Creating new skill builder content
- Adding code examples
- Updating existing skill builders

## Common Development Workflows

### Adding New Content
1. ✅ Determine content type (project, workbook, skill builder, etc.)
2. ✅ Create `.qmd` file in appropriate directory
3. ✅ Add navigation entry in `_quarto.yml`
4. ✅ Preview with `quarto preview`
5. ✅ Test rendering and navigation
6. ✅ Commit changes

### Modifying Existing Content
1. ✅ Locate `.qmd` file
2. ✅ Make changes
3. ✅ Preview with `quarto preview` or `quarto render file.qmd`
4. ✅ Verify output
5. ✅ Commit changes

### Fixing Navigation Issues
1. ✅ Review `_quarto.yml` structure
2. ✅ Check file path references
3. ✅ Test with `quarto preview`
4. ✅ Click through all navigation links
5. ✅ Fix broken links or menu structure

### Testing Rendering
1. ✅ Start preview: `quarto preview`
2. ✅ Check for rendering errors in terminal
3. ✅ Test navigation in browser
4. ✅ Verify code execution and plots
5. ✅ Check mobile responsiveness

## Error Handling

### Quarto Rendering Errors
**If rendering fails**:
1. Check Python code in `.qmd` file
2. Verify all imports are available
3. Check for syntax errors
4. Review error messages in terminal
5. Test Python code separately if needed

### Navigation Issues
**If navigation doesn't work**:
1. Verify file paths in `_quarto.yml`
2. Check file exists at specified location
3. Ensure file is not excluded from rendering
4. Reload preview server

### Environment Issues
**If Python/Quarto not found**:
1. Verify WSL environment: `uname -a`
2. Activate virtual environment: `source .venv/bin/activate`
3. Check tool installation: `which python`, `which quarto`
4. Reference ds250_ai_agent_setup.md for troubleshooting

---

**Quick Start After /init**:
```bash
# Activate Python environment
source .venv/bin/activate

# Start Quarto preview
quarto preview

# Open browser to preview URL
# Make changes to .qmd files
# Browser auto-reloads
```

*This /init protocol ensures consistent, complete context loading for all AI agents working on the DS250 course website.*
