# 0_context - DS250 Course Website Documentation Structure

This directory contains structured documentation for AI agents (Claude Code, Cursor, etc.) working on the DS250 course website.

## Purpose

The `0_context` directory provides a hierarchical documentation system that helps AI agents:
1. Understand the project environment and setup
2. Follow project-specific guidelines and standards
3. Access detailed feature documentation
4. Initialize with complete project context

## Trickle-Down Documentation Structure

Documentation is organized in levels, where higher levels contain foundational information that informs lower levels:

### Level 0: Universal Instructions
**Location**: `0_context/trickle-down-0-universal-instructions/`
**Content**: Universal patterns applicable to any project
- `/init` command protocol
- General initialization procedures

### Level 0.5: Environment Setup
**Location**: `0_context/trickle-down-0.5-environment/`
**Content**: DS250-specific environment configuration
- `ds250_ai_agent_setup.md` - WSL Ubuntu + Quarto + Python 3.12 setup
- `universal-mcp-configuration/` - Universal MCP server management
- Required tools and versions
- Agent-specific integration
- Common environment issues and solutions

### Level 0.75: Universal Tools
**Location**: `0_context/trickle-down-0.75-universal-tools/`
**Content**: Universal tools that work across any project
- `universal-mcp-manager/` - Cross-AI-agent MCP coordination
- Tool documentation and usage patterns
- Integration examples

### Level 1: Project Instructions
**Location**: `0_context/trickle-down-1-project/`
**Content**: DS250 project-specific guidelines
- `ds250_project_instructions.md` - Complete project guide
- Critical rules (Quarto-first workflow, template safety, etc.)
- Architecture reference
- Common development tasks
- Traffic light system for edits

### Level 2: Features
**Location**: `0_context/trickle-down-2-features/`
**Content**: Feature-specific documentation
- `README.md` - Overview of all DS250 features
- Feature categories (Projects, Templates, Workbooks, Skill Builders, etc.)
- Development guidelines for each feature type
- Testing and standards

## Using the /init Command

To load complete context at the start of a Claude Code session:

```bash
/init [optional: focus-area]
```

**Examples**:
```bash
/init              # Full context loading
/init projects     # Focus on project content
/init templates    # Focus on student templates
/init navigation   # Focus on site navigation
/init workbooks    # Focus on practice workbooks
/init skill-builders  # Focus on educational content
```

**What /init does**:
1. ✅ Declares agent environment and project
2. ✅ Verifies WSL Ubuntu environment
3. ✅ Loads core documentation (CLAUDE.md, project instructions, environment setup)
4. ✅ Loads configuration files (_quarto.yml)
5. ✅ Loads focus area documentation (if specified)
6. ✅ Assesses current state (git status, directory structure)
7. ✅ Declares readiness for work

## Key Documentation Files

### Essential Reading
1. **[constitution.md](0_context/trickle-down-1-project/constitution.md)** - Project foundation, principles, non-negotiables
2. **[../CLAUDE.md](../CLAUDE.md)** - Repository overview, technologies, commands, architecture
3. **[ds250_project_instructions.md](0_context/trickle-down-1-project/ds250_project_instructions.md)** - Project-specific guidelines
4. **[ds250_ai_agent_setup.md](0_context/trickle-down-0.5-environment/ds250_ai_agent_setup.md)** - Environment configuration
5. **[ds250_init_command.md](0_context/trickle-down-0-universal-instructions/initialization/ds250_init_command.md)** - Complete /init protocol

### Configuration
- **[../_quarto.yml](../_quarto.yml)** - Site configuration, navigation, rendering rules

### Universal Tools
- **[Universal MCP Manager](0_context/trickle-down-0.75-universal-tools/universal-mcp-manager/README.md)** - Cross-AI-agent MCP coordination
- **[MCP Setup Guide](0_context/trickle-down-0.5-environment/universal-mcp-configuration/README.md)** - Installation and configuration

### Feature Documentation
- **[Features README](0_context/trickle-down-2-features/README.md)** - All feature categories and guidelines

## Project Technology Stack

- **Static Site Generator**: Quarto
- **Language**: Python 3.12
- **Key Libraries**: pandas, lets-plot, scikit-learn, numpy
- **Environment**: WSL Ubuntu (Cursor IDE with Claude Code)
- **Location**: `/home/dawson/code/DS250-Course-Draft/`
- **MCP Servers**: Universal configuration for all AI assistants (`~/.config/mcp/`)

## DS250 Course Context

**What is DS250?**
- 2-credit introductory data science course
- Python-based with pandas, lets-plot, scikit-learn
- 6 main projects (project_0 through project_6)
- Real-world data analysis with consulting-style reports
- Interactive programming (not traditional CS)

**Content Types**:
- Projects: Main course projects with client requests
- Templates: Student templates for assignments
- Workbooks: Practice workbooks (wb0-wb6)
- Skill Builders: Educational content with examples
- Setup Guides: Installation and configuration
- Course Materials: Reference documentation
- Syllabus: Course policies and grading

## Development Workflow

### Quick Start
```bash
# 1. Verify environment
pwd  # /home/dawson/code/DS250-Course-Draft

# 2. Activate Python
source .venv/bin/activate

# 3. Start Quarto preview
quarto preview

# 4. Make changes to .qmd files
# Browser auto-reloads
```

### Common Tasks
- **Add project**: Create `.qmd`, update `_quarto.yml`, create template
- **Add unit task**: Create file, update navbar menu, create template
- **Modify content**: Edit `.qmd`, preview, test rendering
- **Fix navigation**: Update `_quarto.yml`, test with preview

## Traffic Light System

🟢 **Green Zone** - Safe to edit:
- Individual project files (`Projects/*.qmd`)
- Workbooks (`Workbooks/*.qmd`)
- Skill Builders (`Skill Builders/*.qmd`)
- Setup guides (`Setup/*.qmd`)

🟡 **Yellow Zone** - Check first:
- Navigation in `_quarto.yml`
- Student templates structure
- Main page files

🔴 **Red Zone** - Coordinate required:
- Rendering rules in `_quarto.yml`
- Instructional template (`ds250_project_template.qmd`)
- Directory structure changes
- Theme configuration

## For Future Development

This documentation structure is designed to:
1. Scale as the course evolves
2. Maintain consistency across AI agent sessions
3. Reduce context loading time with focused /init
4. Provide clear guidelines for different content types
5. Enable efficient parallel development

---

**Start every Claude Code session with**: `/init [focus-area]`

*This ensures complete, consistent project context and optimal productivity.*
