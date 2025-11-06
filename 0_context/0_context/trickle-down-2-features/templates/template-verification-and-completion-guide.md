# Template Verification and Completion Guide
**Ensuring Templates Match Canvas/GitHub Pages Exactly**

This guide provides a systematic approach to verifying and completing assignment templates so they match the exact content from Canvas and GitHub Pages, with only solution sections filled in.

## Core Principle

**The finished template must have the same question text, title, and layout as the original template that the project file from Canvas and GitHub Pages provides. We are only filling out the solution sections—we do NOT modify the questions, titles, or structure.**

## What Must NOT Change

**CRITICAL:** When completing templates, these elements must remain exactly as they appear in the project file. Any deviation is an error that must be corrected.

- **Question Text**: Must match project file word-for-word (including all instructions, punctuation, and formatting)

- **Title Format and Wording**: Title must follow "Client Report - [Title]" format; subtitle must match "Unit N Task X"; wording extracted from project file exactly

- **Layout Structure**: Section ordering, header hierarchy, question numbering, and overall document structure must match project file

- **Formatting**: Markdown formatting (bold `__text__`, italics `_text_`, code blocks, line breaks, spacing) must match project file exactly

- **Names in Questions**: Variable names (e.g., `playerID`, `yearID`), table names (e.g., `batting`), column names, function names, and any identifiers mentioned in questions must remain exactly as specified

- **Data Specifications in Questions**: Thresholds (e.g., "at least 10 at bat"), limits (e.g., "top 5 results"), ordering instructions (e.g., "from highest to lowest"), and any numerical or specification requirements must match project file exactly

**Remember:** The only sections that should change when completing templates are the solution sections (text analysis and code blocks). Everything else must be an exact copy of the project file.

## Automated Workflow Option (RECOMMENDED)

**NEW**: Use the DS250 assignment agent workflow for automated template completion!

Instead of manually verifying and completing templates, use the `assignment-executor` agent after getting an approved plan from `assignment-planner`:

**Workflow**:
1. Planning agent extracts Canvas content and creates plan
2. User approves plan
3. Execution agent automatically:
   - Verifies question text matches project file
   - Runs code to get actual results
   - Writes analysis based on rendered output
   - Uses MCP browser tools for visual verification
   - Confirms all requirements met

**See**: `0_context/0_context/0_universal_instructions/agent-patterns/assignment-quick-start.md`

**When to use manual process**: Learning the pattern, spot-checking agent work, or custom modifications.

## Step-by-Step Verification Process (Manual)

If not using the automated workflow, follow these steps:

### Step 1: Source Verification

Before making any changes, verify the source of truth:

1. **Identify the Project File**
   - Location: `Projects/Unit_N/assignment_X/unitN_taskX.qmd`
   - This is the official assignment specification

2. **Verify GitHub Pages Version**
   - URL: `https://byuidatascience.github.io/DS250-Course-Draft/Projects/Unit_N/assignment_X/unitN_taskX.qmd`
   - Download and compare with local project file
   نب - These should match exactly

3. **Verify Canvas Assignment**
   - Use Canvas authentication to access the assignment
   - Compare question text word-for-word
   - Note any discrepancies (but typically Canvas and GitHub Pages should align)

### Step 2: Title and Subtitle Format Verification

Templates use a consistent format:

**Required Format:**
```yaml
title: "Client Report - [Assignment Title from Project File]"
subtitle: "Unit N Task X"
author: "[STUDENT NAME]"  # Or actual name if completing as example
```

**Example:**
- Project file title: `"Unit 2 Task 2: Basic aggregation and wrangling"`
- Template title: `"Client Report - Basic aggregation and wrangling"`
- Template subtitle: `"Unit 2 Task 2"`

**Verification Checklist:**
- [ ] Title uses "Client Report - " prefix
- [ ] Title text matches project file (minus "Unit X Task Y: " prefix)
- [ ] Subtitle matches "Unit N Task X" format
- [ ] Author is `"[STUDENT NAME]"` for templates (or actual name for completed examples)

### Step 3: Question Text Verification

**Critical Rule:** Question text must match the project file **word-for-word**.

**Verification Process:**

1. **Extract Questions from Project File**
   - Read `Projects/Unit_N/assignment_X/unitN_taskX.qmd`
   - Find the "Questions and Tasks" section
   - Copy each question exactly as written

2. **Compare with Template**
   - Read `Templates/Unit_N/assignment_X/unitN_taskX_template.qmd`
   - Compare each question under `## QUESTION N` headers
   - Verify:
     - Exact wording matches
     - Formatting matches (bold, italics, line breaks)
     - Numbering matches
     - All instructions included

3. **Fix Any Discrepancies**
   - Update template preparer to match project file exactly
   - Do NOT modify project file unless it contains clear errors

**Example Match:**

**Project File (Lines 54-56):**
```markdown
1. __Write an SQL query that pulls in the batting table. Then, with Python Pandas code create a dataframe that contains playerID, yearID, and batting average for players with at least 10 at bat that year. Sort the dataframe from highest batting average to lowest, and then by playerid alphabetically. Show the top 5 results in your report.__
```

**Template Must Match Exactly:**
```markdown
## QUESTION 1

__Write an SQL query that pulls in the batting table. Then, with Python Pandas code create a dataframe that contains playerID, yearID, and batting average for players with at least 10 at bat that year. Sort the dataframe from highest batting average to lowest, and then by playerid alphabetically. Show the top 5 results in your report.__
```

### Step 4: Layout Structure Verification

The template structure should follow this standard pattern:

```markdown
---
title: "Client Report - [Title]"
subtitle: "Unit N Task X"
author: "[STUDENT NAME]"
format:
  html:
    self-contained: true
    page-layout: full
    title-block-banner: true
    toc: true
    # ... other format options
execute: 
  warning: false
---

```{python}
# Standard imports
import pandas as pd 
import numpy as np
import sqlite3  # if SQL needed
from lets_plot import *

LetsPlot.setup_html(isolated_frame=True)
```

```{python}
# Data loading/setup
# Database connection or data import
```

## QUESTION 1

__[Exact question text from project file]__

_[Solution text section with data analysis based on actual results]_

```{python}
# Solution code block
```

## QUESTION 2

__[Exact question text from project file]__

_[Solution text section]_

```{python}
# Solution code block
```
```

**Layout Checklist:**
- [ ] YAML frontmatter matches standard format
- [ ] Standard imports included
- [ ] Data loading/setup section present
- [ ] Each question has:
   - `## QUESTION N` header
   - Bold question text (exact match from project)
   - Text analysis section (italic placeholder or filled in)
   - Code block with solution

### Step 5: Solution Completion (Filling in Answers)

**Important:** Only fill in the solution sections, do NOT modify questions.

**For Each Question:**

1. **Run the Code**
   - Execute all code blocks in the template
   - Verify code runs without errors
   - Capture actual results (data, visuals, outputs)

2. **Extract Data Insights**
   - Use browser automation or manual inspection
   - Capture specific values, patterns, trends
   - Note any interesting observations

3. **Write Data Analysis**
   - Replace placeholder text with actual analysis
   - Reference specific values from results
   - Cite player IDs, years, percentages, etc.
   - Explain patterns and trends observed
   - Provide context and interpretation

**Solution Writing Guidelines:**

**✅ DO:**
- Reference specific values from actual results
- Cite exact player IDs, years, percentages
- Explain patterns and trends
- Provide historical context when relevant
- Write as consulting report (not Q&A)
- Base analysis on displayed visuals/results
- Confirm that every statement can be verified directly from the rendered tables, charts, or statistics

**❌ DON'T:**
- Explain methodology instead of analyzing results
- Use generic descriptions ("the data shows...")
- Modify question text
- Change title or layout
- Skip question verification steps
- Mention numbers or insights that are not visible in the rendered Quarto output

**Example Good Analysis:**

```markdown
The career batting averages calculated through pandas aggregation reveal the all-time greats: Ty Cobb (cobbty01) achieves the highest career average at 0.366 over 11,436 at-bats, followed by barnero01 (0.360), Rogers Hornsby (hornsro01, 0.358), and Joe Jackson (jacksjo01, 0.356). These results match our SQL calculations exactly, validating that pandas groupby operations correctly aggregate multi-year data. The tight clustering of values (0.355-0.366) among the top tier demonstrates how rare sustained excellence is—even Hall of Fame-caliber players rarely exceed a 36% career batting average when measured over thousands of plate appearances.
```

This analysis:
- ✅ References specific player IDs
- ✅ Cites exact percentages
- ✅ Explains validation between methods
- ✅ Provides context and interpretation
- ✅ Based on actual results

### Step 6: Three-Way Verification

Before finalizing, verify alignment across all three sources:

1. **Canvas Assignment** → **Project File**
   - [ ] Questions match exactly
   - [ ] Instructions match
   - [ ] Titles match (accounting for format differences)

2. **Project File** → **GitHub Pages**
   - [ ] Content matches exactly
   - [ ] Formatting matches
   - [ ] Links work correctly

3. **Project File** → **Template**
   - [ ] Title format correct ("Client Report - [Title]")
   - [ ] Subtitle correct ("Unit N Task X")
   - [ ] Question text matches word-for-word
   - [ ] Layout structure matches
   - [ ] Solution sections filled in with real data□□ analysis

### Step 7: Validation Testing

**Run These Checks:**

1. **Code Execution Test**
   ```bash
   quarto render Templates/Unit_N/assignment_X/unitN_taskX_template.qmd
   ```
   - [ ] Renders without errors
   - [ ] All code blocks execute
   - [ ] Output displays correctly

2. **Content Verification**
   - [ ] Open rendered HTML in browser
   - [ ] Verify title displays correctly
   - [ ] Verify questions match project file
   - [ ] Verify solutions display correctly
   - [ ] Check all code outputs appear

3. **Comparison Check**
   - [ ] Side-by-side comparison: Project file vs Template
   - [ ] Verify questions match exactly
   - [ ] Verify only solution sections differ

4. **Visual Verification with MCP Browser Tools**

   **Use MCP servers to programmatically verify the rendered output displays correctly.**

   Available MCP browser tools (use whichever works in your environment):
   - `mcp__playwright__*` - Playwright browser automation
   - `mcp__chrome-devtools__*` - Chrome DevTools Protocol
   - `mcp__browser__*` - General browser automation

   **Verification Process:**
   ```python
   # Navigate to rendered HTML
   mcp__playwright__browser_navigate(url="file:///path/to/template.html")

   # Take full page screenshot for visual verification
   mcp__playwright__browser_take_screenshot(
       filename="template_verification.png",
       fullPage=true
   )

   # Verify page snapshot shows all expected content
   # Check that analysis text references match visible output
   ```

   **Verification Checklist:**
   - [ ] Page title and subtitle display correctly
   - [ ] All analysis text is visible and properly formatted
   - [ ] All code outputs appear in rendered HTML
   - [ ] Tables, charts, and visualizations display correctly
   - [ ] JSON/data examples render with proper formatting
   - [ ] Analysis statements can be verified from visible output only
   - [ ] Screenshots capture full page for documentation

   **Example from Unit 3 Assignment 1:**
   - Verified JSON example shows `"num_of_delays_late_aircraft": null`
   - Verified summary text shows "Total rows with missing values: 205"
   - Verified breakdown lists exact counts: airport_name (56), month (27), etc.
   - Analysis references "205 rows," "56 occurrences," "27 occurrences" - all visible in output

   **Why Use MCP Tools:**
   - Programmatic verification ensures consistency
   - Screenshots provide visual proof for documentation
   - Automated checks catch display issues early
   - Verifies analysis only references visible results (per 0_context rules)
   - Creates audit trail for template quality

## Common Issues and Solutions

### Issue 1: Title Mismatch

**Problem:** Template title doesn't match expected format.

**Solution:**
- Project file: `"Unit 2 Task 2: Basic aggregation and wrangling"`
- Template should be: `"Client Report - Basic aggregation and wrangling"`
- Subtitle: `"Unit 2 Task 2"`

### Issue 2: Question Text Differs

**Problem:** Template question doesn't match project file exactly.

**Solution:**
1. Copy question from project file exactly (including formatting)
2. Paste into template
3. Verify every word matches
4. Check formatting (bold, italics, line breaks)

### Issue 3: Missing Instructions

**Problem:** Template question is missing part of the instructions.

**Example:** Missing "Show the top 5 results in your report."

**Solution:**
- Re-read project file question completely
- Copy entire question including all instructions
- Verify all requirements are in template

### Issue 4: Incorrect Layout

**Problem:** Template structure doesn't match standard pattern.

**Solution:**
- Review Assignment 1 template as reference
- Ensure standard sections present:
  - YAML frontmatter
  - Imports
  - Data setup
  - QUESTION sections
  - Code blocks

## Success Pattern Reference

For complete examples, see:
- **Assignment 1**: `Templates/Unit_2/assignment_1/unit2_task1_template.qmd`
- **Assignment 2**: `Templates/Unit_2/assignment_2/unit2_task2_template.qmd`

Both follow this process:
1. ✅ Title format verified and corrected
2. ✅ Question text matches project file exactly
3. ✅ Solution sections filled with real data analysis
4. ✅ Code runs and produces correct results
5. ✅ Three-way verification completed

## Related Documentation

- **Unit Folder Setup Guide**: `trickle-down-2-features/templates/unit-folder-setup-guide.md`
- **Assignment 1 Success Pattern**: `trickle-down-2-features/templates/unit-2-changes/2025-10-29-220000-assignment-1-success-pattern.md`
- **Assignment 2 Success Pattern**: `trickle-down-2-features/templates/unit-2-changes/2025-10-29-223000-unit2-assignment-2-template-fix.md`
- **Best Practices**: `trickle-down-1-project/ds250_project_instructions.md` - "Template Completion Best Practices" section

## Quick Reference Checklist

Use this when completing any template:

### Pre-Completion
- [ ] Verify project file exists and is correct
- [ ] Verify GitHub Pages version matches
- [ ] Verify Canvas assignment (optional but recommended)
- [ ] Check template title format
- [ ] Verify question text matches project file exactly

### During Completion
- [ ] Only modify solution sections
- [ ] Never modify question text
- [ ] Run code to get actual results
- [ ] Write analysis based on actual data
- [ ] Reference specific values in analysis

### Post-Completion
- [ ] Three-way verification (Canvas → Project → Template)
- [ ] Code execution test
- [ ] Content verification (rendered HTML)
- [ ] Comparison check (Project vs Template)

---

**Remember:** The template should be a perfect copy of the project file's questions and structure, with only solution sections filled in. Any deviation from the project file's questions is an error that must be corrected.
