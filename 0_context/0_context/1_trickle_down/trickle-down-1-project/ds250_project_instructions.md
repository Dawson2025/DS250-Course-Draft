# DS250 Course Website Project Instructions

**Auto-loaded at the start of every Claude Code conversation**

## Quick Start: Essential Context

Before starting any work, understand these key aspects:

1. **[@constitution.md](constitution.md)** - Project foundation, core principles, and non-negotiables
2. **[@CLAUDE.md](../../../../CLAUDE.md)** - Complete repository guide, architecture, and common commands
3. **[@_quarto.yml](../../../../_quarto.yml)** - Site configuration, navigation structure, and rendering rules
4. **[@README_Codex_WSLA.md](../../../../README_Codex_WSLA.md)** - WSL development environment setup

## Project Overview

**Purpose**: DS 250 (Data Science Programming) course website built with Quarto
**Stack**: Quarto + Python 3.12 + lets-plot + pandas + scikit-learn
**Environment**: WSL Ubuntu (Cursor IDE with Claude Code)
**Location**: `/home/dawson/code/DS250-Course-Draft/`
**Published Site**: Assignments and course materials are accessed at: https://byuidatascience.github.io/DS250-Course-Draft/

## Critical Rules

### 1. Quarto-First Workflow
- All content is in `.qmd` (Quarto Markdown) files
- Preview changes with `quarto preview` before committing
- Render specific files with `quarto render path/to/file.qmd`
- Never edit rendered HTML in `_site/` - edit source `.qmd` files

### 2. Template Safety
- **DO NOT** modify `Templates/ds250_project_template.qmd` without explicit instruction
- This template is instructional for students
- Students use project-specific templates (`P0_template.qmd` through `P5_template.qmd`)
- Unit task templates follow pattern `unit*_task*_template.qmd`

### 3. Navigation Structure
- Top navbar: Defined in `_quarto.yml` under `navbar:`
- Sidebars: Defined in `_quarto.yml` under `sidebar:`
- Adding new content requires updating `_quarto.yml` navigation
- Test navigation after changes

### 4. Data Source Guidelines
- Projects typically load data via URLs (GitHub raw links)
- Local data files in `Data/` directory are for reference
- Students should use URL loading to ensure GitHub Pages compatibility
- If local data is used, it must be in same directory as `.qmd` file

## Architecture Quick Reference

### Directory Structure
```
DS250-Course-Draft/
├── Projects/               # Main course projects and unit tasks
│   ├── project_0.qmd       # Project specs (read-only for students)
│   ├── project_1.qmd
│   ├── ...
│   ├── unit1_task1.qmd     # Individual task assignments
│   └── unit*_task*.qmd
├── Templates/              # Student templates (DO NOT RENDER)
│   ├── ds250_project_template.qmd
│   ├── P0_template.qmd
│   ├── P*_template.qmd
│   └── unit*_task*_template.qmd
├── Workbooks/              # Practice workbooks (wb0-wb6)
├── Skill Builders/         # Educational content with examples
│   ├── pandas_letsplot.qmd
│   ├── machine_learning.qmd
│   └── *.qmd
├── Setup/                  # Installation guides
├── Course Materials/       # Reference materials
├── Syllabus/               # Course policies
├── Data/                   # Course datasets
├── tools/                  # Utility scripts
│   └── make_selfcontained_html.py
├── _quarto.yml             # Site configuration (CRITICAL)
└── CLAUDE.md               # Repository guide

### Excluded from Rendering (in _quarto.yml)
- `!/Templates`
- `!/Data`
- `!/Images`
- `!/Projects/Archive`
- `!/Setup/Archive`
- `!/Workbooks/Archive`
```

### Standard Quarto Markdown Structure
```yaml
---
title: "Project Title"
date: YYYY-MM-DDTHH:MM:SS+06:00
lastmod: YYYY-MM-DDTHH:MM:SS+06:00
weight: 2
draft: false
keywords: [""]
---

### Background
Project context and purpose

### Client Request
Real-world data questions

### Data
URL links and information

### Tasks
Numbered tasks with instructions
```

### Python Code Cell Pattern
```python
```{python}
import pandas as pd
import numpy as np
from lets_plot import *

LetsPlot.setup_html(isolated_frame=True)

# Analysis code here
df = pd.read_csv("URL_to_data")
```
```

## Common Development Tasks

### Preview and Build
```bash
# Live preview with hot reload
quarto preview

# Render entire site
quarto render

# Render single file
quarto render Projects/project_1.qmd

# Check Python environment
source .venv/bin/activate
python --version  # Should be 3.12
```

### Adding New Content

#### Adding a New Project
1. Create `Projects/project_N.qmd`
2. Add to sidebar in `_quarto.yml`:
   ```yaml
   - text: "Project N: Title"
     file: Projects/project_N.qmd
   ```
3. Create corresponding template in `Templates/PN_template.qmd`
4. Preview to verify navigation

#### Adding a New Unit Task
1. Create `Projects/unitN_taskM.qmd`
2. Add to navbar menu in `_quarto.yml`:
   ```yaml
   - text: "Unit N Title"
     menu:
       - text: "Task M"
         file: Projects/unitN_taskM.qmd
   ```
3. Create template `Templates/unitN_taskM_template.qmd`
4. Test navigation and rendering

#### Adding Skill Builder Content
1. Create `Skill Builders/topic_name.qmd`
2. Add to sidebar in `_quarto.yml`:
   ```yaml
   - text: "Topic Name"
     file: Skill Builders/topic_name.qmd
   ```
3. Include practical Python examples
4. Use standard imports and lets-plot setup

### Working with Data
```python
# Preferred: URL loading (works on GitHub Pages)
df = pd.read_csv("https://github.com/byuidatascience/data4names/raw/master/data-raw/names_year/names_year.csv")

# Alternative: Local file (must be in same directory as .qmd)
df = pd.read_csv("data_file.csv")

# SQLite databases
import sqlite3
conn = sqlite3.connect("../Data/lahmansbaseballdb.sqlite")
```

## Code Standards for Course Content

### Quality Expectations
- **Comments**: Explain complex operations for student learning
- **Variable names**: Descriptive and pedagogical
- **Plotting**: Always use lets-plot with grammar of graphics approach
- **Code folding**: Enabled by default with "Show the code" option

### Standard Imports
```python
import pandas as pd
import numpy as np
from lets_plot import *
LetsPlot.setup_html(isolated_frame=True)

# For ML projects
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

# For SQL projects
import sqlite3
```

## Traffic Light System for Edits

🟢 **Green Zone (Safe to Edit)**:
- Individual project files (`Projects/project_*.qmd`)
- Individual unit task files (`Projects/unit*_task*.qmd`)
- Workbook files (`Workbooks/wb*.qmd`)
- Skill Builder content (`Skill Builders/*.qmd`)
- Setup guides (`Setup/*.qmd`)
- Course materials (`Course Materials/*.qmd`)

🟡 **Yellow Zone (Check First)**:
- Navigation structure in `_quarto.yml`
- Main page files (`index.qmd`, `setup.qmd`, etc.)
- Student templates (must maintain format)
- Syllabus content (`Syllabus/*.qmd`)

🔴 **Red Zone (Coordinate Required)**:
- `_quarto.yml` rendering rules
- `Templates/ds250_project_template.qmd` (instructional)
- Directory structure changes
- Theme configuration
- Site-wide formatting

## Course Context

### Course Philosophy
- **2-credit** introductory data science course
- **Interactive programming** (not traditional CS program building)
- **Client-focused projects** with consulting-style reports
- **Real-world data** with meaningful questions

### Project Timeline
- Projects span ~2 weeks (4 class days)
- ~8 hours expected outside class time per project
- Students render to HTML and submit to Canvas

### Technology Choices
- **lets-plot**: Grammar of graphics (like R's ggplot2)
- **pandas**: Standard Python data manipulation
- **SQLite**: SQL database work
- **scikit-learn**: Machine learning introduction

## Running the Site

```bash
# Activate Python environment
source .venv/bin/activate

# Preview site (recommended for development)
quarto preview

# Open browser to http://localhost:XXXX (port shown in terminal)
# Changes auto-reload

# Full render (before deployment)
quarto render

# Output in _site/ directory
```

## For AI Agents

### Before Starting Work
1. ✅ Verify you're in WSL environment: `pwd` should show `/home/dawson/code/DS250-Course-Draft`
2. ✅ Check Python version: `python --version` (should be 3.12.x)
3. ✅ Review `_quarto.yml` if adding/modifying navigation
4. ✅ Preview changes before considering complete

### When Adding Content
1. Create the `.qmd` file in appropriate directory
2. Update `_quarto.yml` navigation structure
3. Test with `quarto preview`
4. Verify navigation works
5. Check that content renders correctly

### When Modifying Templates
1. Understand template purpose (instructional vs. student-use)
2. Maintain YAML frontmatter structure
3. Preserve code folding settings
4. Test rendering with sample content
5. Verify HTML output is self-contained

---

**Remember**: This is a course website for students learning data science. Content should be clear, pedagogical, and exemplify best practices in Python data science.
