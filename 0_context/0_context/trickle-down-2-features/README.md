# DS250 Course Website Features
*Trickle-Down Level 2: Feature Documentation*

## Overview

This directory contains documentation for the major content areas (features) of the DS250 course website. Each feature represents a distinct section of the site that students interact with.

## Feature Categories

### 1. Projects
**Location**: `Projects/` directory
**Purpose**: Main course projects with real-world data analysis assignments
**Content**:
- `project_0.qmd` through `project_6.qmd` - Project specifications
- `unit1_task1.qmd` through `unit5_task4.qmd` - Individual unit tasks
- `unit6.qmd` - GitHub portfolio task

**Key Characteristics**:
- Client-focused format with "Client Request" sections
- Real-world datasets (often loaded via URLs)
- 2-week timeline per project (~8 hours outside class)
- Consulting-style deliverables

### 2. Templates
**Location**: `Templates/` directory
**Purpose**: Student templates for project reports and unit tasks
**Content**:
- `ds250_project_template.qmd` - Instructional template (Project 0 only)
- `P0_template.qmd` through `P5_template.qmd` - Project-specific templates
- `unit*_task*_template.qmd` - Unit task templates

**Key Characteristics**:
- NOT rendered to website (excluded in `_quarto.yml`)
- Students download and use locally
- Self-contained HTML output
- Code folding enabled by default

### 3. Workbooks
**Location**: `Workbooks/` directory
**Purpose**: Practice workbooks corresponding to each project
**Content**: `wb0.qmd` through `wb6.qmd`

**Key Characteristics**:
- Hands-on practice with course concepts
- Aligned with project topics
- Scaffold learning before full projects

### 4. Skill Builders
**Location**: `Skill Builders/` directory
**Purpose**: Supporting educational content with Python examples
**Content**:
- `introduction.qmd` - Project 0 introduction
- `pandas_letsplot.qmd` - Project 1 (Pandas and lets-plot)
- `json_missing.qmd` - Project 2 (JSON and missing data)
- `relational_data.qmd` - Project 3 (SQL and databases)
- `ml_sklearn.qmd` - Project 4 (Machine learning)
- `munging.qmd` - Project 5 (Data munging)
- `git_github.qmd` - Project 6 (GitHub and Git)

**Key Characteristics**:
- Explanatory content with code examples
- Topic-focused learning resources
- Supplements project work

### 5. Setup Guides
**Location**: `Setup/` directory
**Purpose**: Installation and configuration instructions
**Content**:
- `python_setup.qmd` - Python installation
- `python_lib.qmd` - Python libraries installation
- `vs_code_setup.qmd` - VS Code setup
- `quarto_setup.qmd` - Quarto installation
- `git_github_setup.qmd` - Git and GitHub setup
- `sql_setup.qmd` - SQL setup
- `copilot_setup.qmd` - GitHub Copilot setup
- `slack_setup.qmd` - Slack setup
- `aws_setup.qmd` - AWS VM setup (optional)

**Key Characteristics**:
- Step-by-step instructions
- Platform-specific guidance
- Video tutorials embedded
- Troubleshooting sections

### 6. Course Materials
**Location**: `Course Materials/` directory
**Purpose**: Reference materials for course technologies
**Content**:
- `vs_code.qmd` - VS Code usage guide
- `lets_plot.qmd` - lets-plot plotting guide
- `python.qmd` - Python for data science
- `sql.qmd` - SQLite guide
- `ml.qmd` - Machine learning guide
- `git_pull_merge.qmd` - GitHub fork/merge guide

**Key Characteristics**:
- Reference documentation
- Technology-focused
- Examples and best practices

### 7. Syllabus
**Location**: `Syllabus/` directory
**Purpose**: Course policies and grading
**Content**:
- `syllabus.qmd` - Main syllabus
- `competency.qmd` - Competency-based grading

**Key Characteristics**:
- Course policies
- Grading structure
- Academic expectations

## Feature Development Guidelines

### When Creating New Project Content

1. **Create the project specification**:
   ```bash
   # Create in Projects/
   touch Projects/project_N.qmd
   ```

2. **Add standard structure**:
   ```yaml
   ---
   title: "Project N: Title"
   date: YYYY-MM-DDTHH:MM:SS+06:00
   lastmod: YYYY-MM-DDTHH:MM:SS+06:00
   weight: N
   draft: false
   keywords: [""]
   ---

   ### Background
   ### Client Request
   ### Data
   ### Tasks
   ```

3. **Create corresponding template**:
   ```bash
   touch Templates/PN_template.qmd
   ```

4. **Update navigation** in `_quarto.yml`:
   ```yaml
   sidebar:
     - title: "Projects"
       contents:
         - text: "Project N: Title"
           file: Projects/project_N.qmd
   ```

5. **Create workbook**:
   ```bash
   touch Workbooks/wbN.qmd
   ```

6. **Update workbook sidebar** in `_quarto.yml`

### When Creating New Unit Task

1. **Create task file**:
   ```bash
   touch Projects/unitN_taskM.qmd
   ```

2. **Add to navbar menu** in `_quarto.yml`:
   ```yaml
   navbar:
     right:
       - text: "Unit N Title"
         menu:
           - text: "Task M"
             file: Projects/unitN_taskM.qmd
   ```

3. **Create template**:
   ```bash
   touch Templates/unitN_taskM_template.qmd
   ```

### When Adding Skill Builder

1. **Create content file**:
   ```bash
   touch "Skill Builders/topic_name.qmd"
   ```

2. **Include Python examples**:
   ```python
   ```{python}
   import pandas as pd
   import numpy as np
   from lets_plot import *

   LetsPlot.setup_html(isolated_frame=True)

   # Examples here
   ```
   ```

3. **Add to sidebar** in `_quarto.yml`:
   ```yaml
   - title: "Skill Builders"
     contents:
       - text: "Topic Name"
         file: Skill Builders/topic_name.qmd
   ```

## Feature Standards

### Content Quality
- **Pedagogical**: Written for students learning data science
- **Clear**: Step-by-step instructions where appropriate
- **Practical**: Real-world examples and use cases
- **Tested**: All code examples should run without errors

### Code Standards
- **Comments**: Explain complex operations
- **Style**: Follow pandas/Python conventions
- **Imports**: Use standard course imports
- **Plotting**: Use lets-plot with grammar of graphics

### Quarto Standards
- **Self-contained**: HTML output should be standalone
- **Code folding**: Enabled by default
- **Responsive**: Works on mobile devices
- **Accessible**: Alt text for images, proper headings

## Navigation Integration

All features must be integrated into the site navigation via `_quarto.yml`:

### Navbar (Top)
- Setup guides
- Unit tasks (dropdown menus)
- FAQ

### Sidebars (Left)
- Projects listing
- Setup guides listing
- Course materials listing
- Syllabus
- Workbooks listing
- Skill builders listing

## Testing Features

### Before Considering Complete
1. ✅ Quarto renders without errors: `quarto render path/to/file.qmd`
2. ✅ Navigation works: Test links in preview
3. ✅ Python code executes: All code cells run
4. ✅ Plots render: lets-plot charts display correctly
5. ✅ Links work: External URLs and data sources load
6. ✅ Mobile responsive: Check on different screen sizes

### Preview Workflow
```bash
# Start preview server
quarto preview

# Make changes to .qmd files
# Browser auto-reloads with changes

# Test navigation
# Click through all links

# Stop preview
Ctrl+C
```

## Common Feature Patterns

### Project Pattern
- Background context
- Client request framing
- Data source with URL
- Numbered tasks
- Video walkthrough (optional)

### Template Pattern
- YAML frontmatter with self-contained: true
- Elevator pitch section
- Question/Task sections
- Code folding enabled
- Submission instructions

### Skill Builder Pattern
- Topic introduction
- Conceptual explanation
- Code examples with output
- Practice exercises
- Further reading

### Setup Guide Pattern
- Overview and purpose
- Prerequisites
- Step-by-step instructions
- Platform-specific notes
- Troubleshooting
- Video tutorial (optional)

---

*This feature structure enables organized, maintainable course content that scales across 6+ projects and multiple content types.*
