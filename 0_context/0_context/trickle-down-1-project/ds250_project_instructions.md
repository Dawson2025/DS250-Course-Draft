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

#### For Units with Single-Level Structure (Traditional)
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

#### For Units with Assignment Folder Structure (Unit_2 Pattern)
**See**: `0_context/0_context/trickle-down-2-features/templates/unit-folder-setup-guide.md` for complete instructions.

**Quick Steps:**
1. Create `Projects/Unit_N/` directory
2. Create `Templates/Unit_N/` directory
3. Extract Canvas assignments (get URLs from Canvas)
4. Match with GitHub Pages (find corresponding template links)
5. Create assignment folders (`assignment_1/`, `assignment_2/`, etc.)
6. Populate with project files and templates
7. Update `_quarto.yml` navigation
8. Verify alignment (Canvas → GitHub Pages → Local)

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

### Template Completion Best Practices

#### SQL Query Templates (Example: Unit_2 Assignment 1)
**Reference**: `Templates/Unit_2/assignment_1/unit2_task1_template.qmd`

**What Makes a Well-Completed SQL Template:**

1. **Safe Division Handling**
   ```python
   # Always use NULLIF to prevent division by zero
   CAST(H AS FLOAT) / NULLIF(AB, 0) AS batting_avg
   ```

2. **Proper Data Type Casting**
   - Cast integers to FLOAT before division for decimal results
   - Use CAST explicitly for clarity and SQLite compatibility

3. **Correct ORDER BY Usage**
   ```sql
   ORDER BY batting_avg DESC, playerID ASC
   ```
   - Primary sort: Descending for top values (highest first)
   - Secondary sort: Ascending for consistent alphabetical ordering

4. **Appropriate Aggregation with GROUP BY and HAVING**
   ```sql
   SELECT playerID, SUM(H) AS total_hits, SUM(AB) AS total_at_bats
   FROM batting
   GROUP BY playerID
   HAVING SUM(AB) >= 100
   ```
   - Use GROUP BY for aggregating across groups
   - Use HAVING (not WHERE) for filtering aggregated results
   - Calculate aggregations (SUM) before filtering

5. **Display Results with .head()**
   ```python
   result = pd.read_sql_query(query, con)
   print(result.head(5))  # ✅ Correct: Use .head()
   # NOT: print(result)    # ❌ Wrong: Violates Slack policy
   ```
   - Always use `.head()` to limit output per Slack announcements
   - Never print entire dataframes in reports

6. **Database Path Configuration**
   - For templates: Use relative paths where possible
   - For working code: Absolute paths acceptable but document clearly
   ```python
   # Template-friendly relative path
   sqlite_file = '../../Data/lahmansbaseballdb.sqlite'
   
   # Or absolute path with clear documentation
   sqlite_file = '/home/dawson/code/DS250-Course-Draft/Data/lahmansbaseballdb.sqlite'
   # Database is located in the Data directory (absolute path)
   ```

7. **Text Analysis Based on Actual Results**
   - Run code, capture actual results, then write analysis
   - Reference specific values: player IDs, years, percentages, ranges
   - Identify patterns and historical context
   - Compare results across questions to show progression
   
   **Example Good Analysis:**
   > "The results reveal an interesting pattern: all five top players achieved a perfect 1.000 batting average (1 hit in 1 at-bat). These single-at-bat performances span over 95 years, from 1923 (abramge01) to 2019 (alanirj01), demonstrating that such rare events occur across different eras."
   
   **NOT Generic Methodology:**
   > "We queried the database and sorted the results."

8. **Query Structure and Comments**
   ```python
   # SQL query to calculate batting averages for players with at least 1 at bat
   query1 = """
   SELECT 
       playerID,
       yearID,
       CAST(H AS FLOAT) / NULLIF(AB, 0) AS batting_avg
   FROM batting
   WHERE AB >= 1
   ORDER BY batting_avg DESC, playerID ASC
   LIMIT 5
   """
   ```
   - Clear comments explaining query purpose
   - Multi-line SQL for readability
   - Descriptive alias names (batting_avg not ba)

9. **Progressive Complexity**
   - Start with simple queries (Question 1)
   - Add filters incrementally (Question 2: more at-bats)
   - Build to aggregations (Question 3: career stats with GROUP BY)
   - Each question builds on previous knowledge

10. **Complete Solutions**
    - Every question has executable code
    - Every question has explanatory text
    - Code runs without errors
    - Results display correctly when rendered

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
