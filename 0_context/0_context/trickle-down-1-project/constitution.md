# DS250 Course Website Project Constitution
*Trickle-Down Level 1: Project Foundation*

## Mission Statement

The DS250 Course Website serves as the primary learning platform for BYU-I's 2-credit introductory data science programming course. Our mission is to provide clear, accessible, pedagogical content that empowers students to learn Python-based data science through real-world, client-focused projects using pandas, lets-plot, scikit-learn, and SQLite.

## Core Principles

### 1. Student-Centered Design
**Principle**: Every decision prioritizes student learning and accessibility.

**In Practice**:
- Content is written for beginners learning data science
- Instructions are clear, step-by-step, and tested
- Code examples are well-commented and pedagogical
- Setup guides accommodate multiple platforms (Windows, macOS, Linux)
- Error messages and troubleshooting sections anticipate common student issues

**Non-Negotiable**:
- No jargon without explanation
- All code examples must run without errors
- Setup instructions must be tested on student-typical environments

### 2. Quarto-First Workflow
**Principle**: Quarto is the authoritative source for all rendered content.

**In Practice**:
- All content modifications happen in `.qmd` files (never in rendered HTML)
- Preview changes with `quarto preview` before considering complete
- Test navigation and rendering after every change
- Use Quarto's features (code folding, self-contained HTML, themes)

**Non-Negotiable**:
- Never edit files in `_site/` directory
- Always render and preview before committing
- Maintain valid Quarto YAML frontmatter

### 3. Template Integrity
**Principle**: Student templates are sacred and changes must be intentional.

**In Practice**:
- `Templates/ds250_project_template.qmd` is instructional only (Project 0 exception)
- Project-specific templates (`P0_template.qmd` through `P5_template.qmd`) provide structure
- Templates maintain consistent formatting across all projects
- Code folding, self-contained HTML, and YAML structure are preserved

**Non-Negotiable**:
- Template changes require explicit discussion and approval
- Templates must render to valid, self-contained HTML
- Student workflow (download → edit → render → submit) must not break

### 4. Real-World Data Focus
**Principle**: Projects use real-world datasets that address meaningful questions.

**In Practice**:
- Data sources are reliable and accessible (preferably URL-based)
- Client Request sections frame authentic data science questions
- Projects span multiple topics (not just toy examples)
- Students learn to work with messy, real data

**Non-Negotiable**:
- Data sources must be accessible (no authentication required for students)
- URL-based data loading preferred (GitHub raw links, stable APIs)
- Local data files only when necessary (must be in same directory as `.qmd`)

### 5. Interactive Programming Pedagogy
**Principle**: Course emphasizes exploration and iteration, not traditional program building.

**In Practice**:
- Projects encourage experimentation and exploration
- Consulting-style reports (not Q&A format)
- Python code is exploratory and well-commented
- Students learn by doing, not by memorizing

**Non-Negotiable**:
- No "cookbook" solutions
- Encourage critical thinking and data exploration
- Code quality matters (comments, variable names, structure)

### 6. Consistent Technology Stack
**Principle**: Course uses a unified, coherent set of technologies.

**In Practice**:
- **Python 3.12+** for all programming
- **pandas** for data manipulation
- **lets-plot** for visualization (grammar of graphics)
- **scikit-learn** for machine learning
- **SQLite** for SQL (not MySQL, PostgreSQL, etc.)
- **Quarto** for document rendering

**Non-Negotiable**:
- Don't introduce alternative libraries without strong justification
- Maintain compatibility with student environments
- Standard imports pattern must be consistent

### 7. Environment Agnostic (with WSL Preference)
**Principle**: Students can complete course on any platform, but development uses WSL.

**In Practice**:
- **Development**: WSL Ubuntu for optimal performance
- **Students**: Windows, macOS, or Linux all supported
- Setup guides provide platform-specific instructions
- File paths use forward slashes (cross-platform)

**Non-Negotiable**:
- Don't assume Windows-only or Mac-only solutions
- Test critical instructions on multiple platforms
- Development repository lives in WSL home directory

## Technical Standards

### Code Quality
**Standards**:
- **Comments**: Explain the "why", not just the "what"
- **Variable names**: Descriptive and pedagogical (`student_count` not `sc`)
- **Functions**: Single responsibility, clear purpose
- **Imports**: Standard pattern at top of code cells

**Standard Import Pattern**:
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

### Quarto Standards
**YAML Frontmatter**:
```yaml
---
title: "Project Title"
date: YYYY-MM-DDTHH:MM:SS+06:00
lastmod: YYYY-MM-DDTHH:MM:SS+06:00
weight: N
draft: false
keywords: [""]
---
```

**Template YAML**:
```yaml
---
title: "Client Report - [Insert Project Title]"
subtitle: "Course DS 250"
author: "[STUDENT NAME]"
format:
  html:
    self-contained: true
    page-layout: full
    title-block-banner: true
    toc: true
    toc-depth: 3
    toc-location: body
    number-sections: false
    html-math-method: katex
    code-fold: true
    code-summary: "Show the code"
    code-overflow: wrap
    code-copy: hover
    code-tools:
        source: false
        toggle: true
        caption: See code
execute:
  warning: false
---
```

### Navigation Standards
**_quarto.yml Structure**:
- Navbar: Top-level course navigation
- Sidebars: Content-area navigation (Projects, Setup, Materials, etc.)
- All files referenced must exist
- Menu structure must be logical and consistent

## Development Workflow Standards

### Traffic Light System

🟢 **Green Zone (Safe to Edit Freely)**:
- Individual project files (`Projects/project_*.qmd`, `Projects/unit*_task*.qmd`)
- Workbooks (`Workbooks/wb*.qmd`)
- Skill Builders (`Skill Builders/*.qmd`)
- Setup guides (`Setup/*.qmd`)
- Course materials (`Course Materials/*.qmd`)

🟡 **Yellow Zone (Check First)**:
- Navigation structure in `_quarto.yml`
- Main page files (`index.qmd`, `setup.qmd`, `materials.qmd`, etc.)
- Student templates (must maintain format and structure)
- Syllabus content (`Syllabus/*.qmd`)

🔴 **Red Zone (Coordinate Required)**:
- `_quarto.yml` rendering rules and exclusions
- `Templates/ds250_project_template.qmd` (instructional template)
- Directory structure changes
- Theme configuration
- Site-wide formatting changes

### Change Protocol

**For Green Zone Changes**:
1. Edit `.qmd` file
2. Preview with `quarto preview` or `quarto render file.qmd`
3. Test navigation and content
4. Commit changes

**For Yellow Zone Changes**:
1. Review existing structure and dependencies
2. Make changes thoughtfully
3. Test thoroughly (full site preview)
4. Verify navigation works
5. Check mobile responsiveness
6. Commit with detailed message

**For Red Zone Changes**:
1. Discuss necessity and impact
2. Document current state
3. Make changes incrementally
4. Test exhaustively (full render, all pages)
5. Verify student workflow not broken
6. Get approval before committing

### Git Standards
**Commit Messages**:
- Clear, descriptive subject line
- Explain "why" in body when not obvious
- Reference issues if applicable

**Branch Strategy**:
- `main` branch is deployable
- Feature branches for major changes
- Test before merging to main

## Content Quality Standards

### Project Specifications
**Required Sections**:
1. **Background**: Context and purpose (2-3 paragraphs)
2. **Client Request**: Authentic data science questions
3. **Data**: URL link and information reference
4. **Tasks**: Numbered, clear, specific

**Quality Checklist**:
- [ ] Background provides sufficient context
- [ ] Client request is realistic and engaging
- [ ] Data source is accessible via URL
- [ ] Tasks are clear and achievable
- [ ] Video walkthrough embedded (optional but recommended)

### Templates
**Required Elements**:
- YAML frontmatter (self-contained HTML)
- Title block with project, course, author
- Elevator pitch section
- Question/Task sections
- Code folding enabled
- Standard imports at top

**Quality Checklist**:
- [ ] Renders to valid HTML
- [ ] Self-contained (no external dependencies)
- [ ] Code folding works
- [ ] Structure matches project specification
- [ ] Instructions clear for students

### Skill Builders
**Required Elements**:
- Topic introduction
- Conceptual explanation
- Code examples with output
- Practical exercises or examples

**Quality Checklist**:
- [ ] Explains "why" not just "how"
- [ ] Code examples run without errors
- [ ] Output is visible and meaningful
- [ ] Supplements course projects effectively

### Setup Guides
**Required Elements**:
- Overview and purpose
- Prerequisites
- Step-by-step instructions (numbered)
- Platform-specific notes (Windows, macOS, Linux)
- Troubleshooting section
- Video tutorial (optional but recommended)

**Quality Checklist**:
- [ ] Instructions tested on target platforms
- [ ] Screenshots current and accurate
- [ ] Troubleshooting covers common issues
- [ ] Links work and point to stable resources

## Student Success Metrics

### Learning Outcomes
Students who complete DS250 should be able to:
1. Load, explore, and visualize data with pandas and lets-plot
2. Query relational databases with SQL (SQLite)
3. Handle missing data and data quality issues
4. Build and evaluate basic machine learning models
5. Create professional data science reports
6. Use Git and GitHub for version control
7. Apply data science to real-world problems

### Project Expectations
**Time Commitment**: ~8 hours outside class per project (2-week timeline)
**Deliverable**: Self-contained HTML report (consulting-style)
**Evaluation**: Quality of analysis, code, writing, and visualizations

## Non-Negotiables (Summary)

### Absolutely Must:
1. ✅ All code examples must run without errors
2. ✅ Quarto must render all `.qmd` files successfully
3. ✅ Templates must produce self-contained HTML
4. ✅ Data sources must be accessible to students
5. ✅ Navigation must work (all links valid)
6. ✅ Content must be student-appropriate (clear, pedagogical)
7. ✅ Python 3.12+ with standard library stack
8. ✅ WSL Ubuntu development environment
9. ✅ Preview all changes before committing
10. ✅ Respect Traffic Light System zones

### Absolutely Must Not:
1. ❌ Edit rendered HTML in `_site/` directory
2. ❌ Break student template workflow
3. ❌ Introduce dependencies not in standard stack
4. ❌ Use platform-specific paths (Windows backslashes)
5. ❌ Commit without testing rendering
6. ❌ Change templates without explicit approval
7. ❌ Break existing navigation structure
8. ❌ Add content without updating `_quarto.yml`
9. ❌ Use data sources requiring authentication
10. ❌ Commit broken code examples

## Maintenance and Evolution

### Regular Reviews
**Quarterly**:
- Review project datasets (ensure URLs still work)
- Update library versions if necessary
- Check for broken links
- Review student feedback

**Annually**:
- Review entire curriculum alignment
- Update technologies if justified
- Refresh examples and datasets
- Review competency-based grading criteria

### Technology Updates
**When to Update**:
- Security vulnerabilities
- Major version changes with compelling features
- Student environment changes
- Better pedagogical tools available

**How to Update**:
1. Document current state
2. Test new technology thoroughly
3. Update all affected content
4. Update setup guides
5. Test student workflow end-to-end
6. Deploy incrementally

## Project Philosophy

### Why This Course Exists
DS250 bridges the gap between introductory programming (CSE 110) and advanced data science courses (DS 350). It teaches students to:
- Think computationally about data
- Use Python interactively (not build traditional programs)
- Create professional deliverables
- Work with real-world data and questions

### What Makes This Course Unique
- **Client-focused**: Every project has a realistic client request
- **Consulting approach**: Students write reports, not just answer questions
- **Real data**: No toy datasets or made-up scenarios
- **Competency-based**: Focus on demonstrated skill, not just completion
- **Practical tools**: Industry-standard stack (pandas, lets-plot, scikit-learn)
- **Quarto ecosystem**: Modern, reproducible reporting

### Success Criteria
A successful DS250 course website:
- Loads quickly and works on all devices
- Provides clear, achievable learning paths
- Supports students at multiple skill levels
- Scales to 100+ students per semester
- Requires minimal instructor intervention for technical issues
- Prepares students for DS 350 and CSE 450

---

## Constitution Adherence

All contributors (AI agents, instructors, TAs) must:
1. Read and understand this constitution
2. Follow principles and standards
3. Respect non-negotiables
4. Use Traffic Light System appropriately
5. Prioritize student success
6. Maintain content quality
7. Test changes thoroughly
8. Document significant decisions

**This constitution is the foundation of the DS250 course website. When in doubt, refer back to these principles.**

*Last Updated: 2025-10-23*
*Project: DS250 Course Website*
*Environment: WSL Ubuntu + Quarto + Python 3.12*
