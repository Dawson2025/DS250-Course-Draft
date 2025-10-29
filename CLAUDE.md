# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a DS 250 (Data Science Programming) course website built with Quarto. The course teaches Python-based data science using pandas, lets-plot, scikit-learn, and NumPy. The site includes project specifications, setup guides, workbooks, skill builders, and course materials.

## Initialization System

This repository uses a **trickle-down documentation structure** in the `0_context/` directory. When starting a new Claude Code session, use:

```
/init [optional: focus-area]
```

**Examples**:
- `/init` - Full context loading
- `/init projects` - Focus on project content
- `/init templates` - Focus on student templates
- `/init navigation` - Focus on site navigation

**What this loads**:
1. Environment verification (WSL, Python, Quarto)
2. Core documentation (this file, project instructions, environment setup)
3. Configuration files (`_quarto.yml`)
4. Focus area details (if specified)
5. Current state assessment (git status, directory structure)

**Documentation hierarchy**:
- `0_context/0_context/0_universal_instructions/` - Universal patterns and /init command
- `0_context/0_context/1_trickle_down/trickle-down-0.5-environment/` - WSL/Quarto environment setup
- `0_context/0_context/1_trickle_down/trickle-down-1-project/` - DS250 project instructions
- `0_context/0_context/1_trickle_down/trickle-down-2-features/` - Feature documentation

See `0_context/0_context/0_universal_instructions/initialization/ds250_init_command.md` for full details.

## Development Environment

This repository is actively developed in **WSL (Windows Subsystem for Linux)** using **Cursor IDE** with **Claude Code**. The working directory is in the WSL filesystem (`~/code/DS250-Course-Draft`) for optimal performance.

- **Platform**: Linux (WSL2) on Windows
- **IDE**: Cursor with Claude Code integration
- **Python**: 3.12 (virtual environment in `.venv/`)
- **Repository location**: WSL home directory (not `/mnt/c/...`)
- **MCP Configuration**: Universal setup for all AI assistants (`~/.config/mcp/`)

## Key Technologies

- **Quarto**: Static site generator for rendering `.qmd` files to HTML
- **Python 3.12**: Primary language (virtual environment in `.venv/`)
- **Key Python Libraries**: pandas, lets-plot, scikit-learn, numpy, palmerpenguins, nbformat, nbclient, pyyaml, setuptools
- **Plotting**: lets-plot (grammar of graphics, similar to ggplot2 in R)

## Common Commands

### Building and Previewing the Site

```bash
# Preview the site (live reload)
quarto preview

# Render the entire site
quarto render

# Render a single file
quarto render path/to/file.qmd
```

### Python Environment

```bash
# Activate virtual environment
source .venv/bin/activate

# Install required packages (if .venv doesn't have them)
pip install numpy pandas scikit-learn lets-plot palmerpenguins nbformat nbclient pyyaml setuptools
```

### Utility Scripts

```bash
# Create self-contained HTML (inlines CSS/JS)
python tools/make_selfcontained_html.py input.html output.html
```

## Architecture and Structure

### Content Organization

- **`Projects/`**: Main course projects (project_0.qmd through project_6.qmd) and unit tasks
  - Projects follow a "Client Report" format where students analyze real-world data
  - Each project has multiple tasks/units (e.g., unit1_task1.qmd, unit2_task1.qmd)

- **`Templates/`**: Student templates for assignments
  - `ds250_project_template.qmd`: Main project template with formatting and structure
  - `P0_template.qmd` through `P5_template.qmd`: Project-specific templates
  - `unit*_task*_template.qmd`: Templates for individual unit tasks

- **`Workbooks/`**: Practice workbooks (wb0.qmd through wb6.qmd) corresponding to each project

- **`Skill Builders/`**: Supporting educational content with Python code examples
  - Files like `pandas_letsplot.py`, `machine_learning.py`, `relational_data.py`

- **`Setup/`**: Installation and configuration guides (python_setup.qmd, sql_setup.qmd, git_github_setup.qmd, etc.)

- **`Course Materials/`**: Reference materials (vs_code.qmd, lets_plot.qmd, python.qmd, sql.qmd, ml.qmd)

- **`Data/`**: Course datasets (lahmansbaseballdb.sqlite, iris.csv, Guns.csv, etc.)

### Navigation Structure

The site uses `_quarto.yml` to define:
- **Top navbar**: Links to setup, units 1-5 tasks, GitHub task, and FAQ
- **Sidebars**: Organized by Projects, Setup, Materials, Syllabus, Workbooks, and Skill Builders
- **Project rendering**: Excludes Templates, Data, Images, and Archive folders from rendering

### File Rendering

The Quarto configuration:
- Renders all `.qmd` files except those in excluded directories (Templates, Data, Images, Archives)
- Uses flatly (light) and darkly (dark) themes
- Outputs self-contained HTML with code folding enabled by default

### Student Workflow

Students work with Quarto Markdown (`.qmd`) files that combine:
1. YAML frontmatter for document configuration
2. Markdown for narrative text
3. Python code blocks (```{python}) for analysis
4. Output preview to generate HTML reports

Template structure for student reports:
- Title block with project name, course, and author
- Elevator pitch (2-3 sentence summary of key insights)
- Question/Task sections with code and analysis
- Code folding enabled by default with "Show the code" option

## Important Context

### Course Focus

- 2-credit introductory data science course using Python
- Emphasizes interactive programming (not traditional CS program building)
- Real-world client-focused projects with consulting-style reports
- Core topics: data wrangling, visualization (lets-plot), SQL (SQLite), machine learning (scikit-learn)

### Project Structure

Projects span ~2 weeks (4 class days) with ~8 hours expected outside class time. Each project:
- Has a "Client Request" framing real-world data questions
- Uses external datasets (often loaded via URL, not local files)
- Requires consulting-style write-ups (not Q&A format)
- Must be rendered to HTML for Canvas submission

### Template Usage

The `ds250_project_template.qmd` is instructional and should NOT be used directly for writing reports (except Project 0). Students should use the project-specific templates (P0_template.qmd through P5_template.qmd).

### Data Sources

Projects typically load data via URLs (e.g., GitHub raw links) rather than local files to ensure reports work when published to GitHub. If local data files are used, they must be in the same directory as the `.qmd` file.

### Code Standards

- Quality commenting expected for team collaboration and future reference
- Python code cells use lets-plot with `LetsPlot.setup_html(isolated_frame=True)`
- Standard imports: `pandas`, `numpy`, `lets_plot`, occasionally `scikit-learn`
- SQL work uses SQLite databases

### WSL Setup Scripts

The repository includes helper scripts for setting up WSL development (see `README_Codex_WSLA.md`):
- `0_context/0_context/1_trickle_down/trickle-down-0.5-environment/setup-scripts/setup_wsl.ps1`: PowerShell script to enable WSL and install Linux distribution
- `0_context/0_context/1_trickle_down/trickle-down-0.5-environment/setup-scripts/install_codex_in_wsl.sh`: Bash script for WSL environment setup
- Files are stored in WSL home directory for performance (not under `/mnt/c/...`)

### Universal MCP Configuration

All AI coding assistants (Cursor, Claude Code, Warp, Copilot, etc.) share a unified MCP (Model Context Protocol) configuration:

- **Location**: `~/.config/mcp/mcp.json` (single source of truth)
- **Setup**: All assistants symlink to master config
- **Documentation**: `0_context/0_context/0.5_setup/universal-mcp-configuration/`
- **Tool Guide**: `0_context/0_context/0.75_universal_tools/universal-mcp-manager/`

**Configured MCP Servers**:
- `filesystem` - Access to DS250-Course-Draft directory
- `web-search` - Tavily web search for research
- `github-search` - GitHub repository search
- `playwright` - Browser automation (Chromium)
- `chrome-devtools` - Browser debugging
- `browser` - General web automation
- `context7` - Semantic search (requires API key)

**Usage**:
```bash
# View current MCP servers
cat ~/.config/mcp/mcp.json

# Edit configuration (updates all AI assistants)
nano ~/.config/mcp/mcp.json

# Verify setup
ls -la ~/.*/mcp.json  # All should symlink to ~/.config/mcp/mcp.json
```
