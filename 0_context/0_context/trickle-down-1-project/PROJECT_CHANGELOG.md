# DS250 Project Change Log

Complete chronological record of all project-level changes (Level 1+) to the DS250 Course Website.

**Note**: This is for project content changes. For changes to the 0_context documentation system itself, see `0_context/0_context/archive/CHANGELOG.md`.

---

## [2025-10-30]

### [Created] - Assignment Workflow Agents (Two-Agent Architecture)
- **Agent Files**:
  - `.claude/agents/agent-assignment-planner.md` (planning specialist)
  - `.claude/agents/agent-assignment-executor.md` (execution specialist)
- **Documentation**:
  - `0_universal_instructions/agent-patterns/assignment-workflow.md` (full architecture)
  - `0_universal_instructions/agent-patterns/assignment-quick-start.md` (quick guide)
- **Guide Updates**:
  - `trickle-down-2-features/templates/unit-folder-setup-guide.md` (added automated workflow option)
  - `trickle-down-2-features/templates/template-verification-and-completion-guide.md` (added automated workflow option)
  - `CLAUDE.md` (added Assignment Workflow Agents section)
- **Summary**: Created specialized Claude Code agents for automated assignment setup. The `assignment-planner` agent researches Canvas assignments and creates comprehensive plans following all 0_context rules. The `assignment-executor` agent executes approved plans with full tool access, tracking progress with todos and verifying with MCP browser tools. This two-agent architecture separates planning from execution, enabling hands-off automation after user approval while maintaining security boundaries and enforcing all template completion standards.

**Key Benefits**:
- Hands-off execution after plan approval
- Canvas authentication via canvas_authenticate.py (secure)
- All 0_context rules enforced automatically
- MCP visual verification included
- Progress tracking with todos
- Automatic documentation creation

**Pattern Established**: Unit 3 Assignment 1 (first use of automated workflow)

### [Added] - MCP Visual Verification Documentation
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-3-changes/2025-10-30-143500-unit3-assignment-1-reorganization-and-completion.md`
- **Files**:
  - `trickle-down-2-features/templates/template-verification-and-completion-guide.md` (Step 7.4: MCP verification)
  - `trickle-down-1-project/ds250_project_instructions.md` (Item 11: Visual Verification)
- **Summary**: Documented requirement to use MCP browser tools (playwright, chrome-devtools, browser) for programmatic visual verification of rendered templates. Added verification checklists, example workflow, and rationale explaining how MCP tools ensure analysis statements match rendered output. Includes Unit 3 Assignment 1 as reference example.

### [Completed] - Unit 3 Assignment 1 Template with Missing Data Analysis
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-3-changes/2025-10-30-143500-unit3-assignment-1-reorganization-and-completion.md`
- **Files**:
  - `Templates/Unit_3/assignment_1/unit3_task1_template.qmd` (completed with analysis + code)
- **Summary**: Completed Unit 3 Assignment 1 template for "Missing Data & JSON" project. Implemented data cleaning code to standardize 4 types of missing data (empty strings, 'n/a', -999, existing NaN) to np.nan. Added comprehensive analysis describing discovery process and cleaning operations. Included JSON example showing null value. Verified with MCP playwright tools - all analysis references match visible output (56, 27, 40, 205 counts).

### [Reorganized] - Unit 3 Assignment Folder Structure
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-3-changes/2025-10-30-143500-unit3-assignment-1-reorganization-and-completion.md`
- **Files**: Reorganized into `assignment_1/`, `assignment_2/`, `assignment_3/`, `assignment_4/` folders
- **Summary**: Moved Unit 3 projects and templates from flat structure to assignment-numbered subfolders matching Canvas assignment order and Unit 2 pattern. Updated all template path references and _quarto.yml navigation.

### [Added] - Analysis Must Match Rendered Visuals Rule
- **Files**:
  - `trickle-down-1-project/ds250_project_instructions.md` (new bullet under analysis best practices)
  - `trickle-down-2-features/templates/template-verification-and-completion-guide.md` (DO/DON'T updates)
- **Summary**: Documented project-wide rule that narrative analysis must only reference information visible in rendered Quarto outputs—tables, charts, or statistics shown in the report. Added explicit checklist items so template authors verify every statement against the visuals students will see.

## [2025-10-31]

### [Completed] - Unit 3 Assignments 2–4 Templates
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-3-changes/2025-10-31-113000-unit3-assignments-2-4-template-completion.md`
- **Files**:
  - `Templates/Unit_3/assignment_2/unit3_task2_template.qmd`
  - `Templates/Unit_3/assignment_3/unit3_task3_template.qmd`
  - `Templates/Unit_3/assignment_4/unit3_task4_template.qmd`
- **Summary**: Finalized the remaining Unit 3 client reports. Added shared data-cleaning blocks, narrative tied to rendered tables/plots, and Lets-Plot visuals for each assignment. Task 2 now covers the composite weather delay metric, Task 3 identifies September as the lowest-delay month, and Task 4 compares weather, carrier, and security delays both overall and per airport. All templates render successfully via `quarto render`, and analysis statements are constrained to information visible in the outputs.

## [2025-10-29]

### [Fixed] - Unit_2 Assignment 3 Simple Yankees vs Red Sox Salary Comparison
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-30-063500-unit2-assignment3-letsplot-line-fix.md`
- **Files**:
  - `Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd` (NYA teamID fix, per-decade grouped bar chart, gap summary table, updated analysis)
- **Summary**: Corrected Yankees/Red Sox comparison so both teams render and simplified the visualization to a per-decade grouped bar chart with a numeric gap table. The condensed view highlights New York's spending premium without overwhelming the reader. Verified by Quarto render and Playwright screenshot fallback pending chrome-devtools MCP stabilization.

### [Documented] - Template Verification and Completion Process
- **Guide**: See `trickle-down-2-features/templates/template-verification-and-completion-guide.md`
- **Process Documentation**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-223000-unit2-assignment-2-template-verification-process.md`
- **Validation Checklist**: See `trickle-down-2-features/templates/unit-2-changes/assignment-2-validation-checklist.md`
- **Files**: 
  - Created comprehensive template verification and completion guide
  - Created Assignment 2 process documentation
  - Created reusable validation checklist template
  - Updated `ds250_project_instructions.md` with template alignment requirements
- **Summary**: Established comprehensive process for ensuring templates match Canvas/GitHub Pages exactly. Created step-by-step verification guide covering title format, question text alignment, layout structure, and solution completion standards. Includes three-way verification process (Canvas → Project → Template) and validation checklists for future use. This process ensures templates maintain exact question text and structure from source files while only filling in solution sections.

### [Fixed] - Unit_2 Assignment 2 Template Title and Questions
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-223000-unit2-assignment-2-template-fix.md`
- **Files**: 
  - `Templates/Unit_2/assignment_2/unit2_task2_template.qmd` (title and Q2 updated, Q1 text fixed)
- **Summary**: Corrected the title and questions in the Unit_2 Assignment 2 template to precisely match the Canvas assignment. Changed title format to "Client Report - Basic aggregation and wrangling" with subtitle "Unit 2 Task 2". Ensured all SQL query instructions, sorting, and output requirements are present in question text.

### [Documented] - Unit Folder Setup Guide for Future Units
- **Guide**: See `trickle-down-2-features/templates/unit-folder-setup-guide.md`
- **Files**: 
  - Created comprehensive step-by-step guide for setting up unit folders
  - Updated `ds250_project_instructions.md` with reference to guide
- **Summary**: Created detailed guide documenting the Unit_2 folder setup process for replicating in future units. Guide covers Canvas assignment extraction, GitHub Pages alignment, folder structure creation, template extraction, path updates, navigation configuration, and three-way verification (Canvas → GitHub Pages → Local). Includes troubleshooting section and complete Unit_2 reference example.

### [Documented] - Assignment 1 Success Pattern and Best Practices
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-220000-assignment-1-success-pattern.md`
- **Validation Checklist**: See `trickle-down-2-features/templates/unit-2-changes/assignment-1-validation-checklist.md`
- **Files**: 
  - `0_context/0_context/trickle-down-1-project/ds250_project_instructions.md` (added "Template Completion Best Practices" section)
  - Created success pattern documentation
  - Created validation checklist
- **Summary**: Documented the successful approach used in Unit_2 Assignment 1 as the reference model for SQL-based template completions. Added comprehensive best practices section to project instructions covering SQL query patterns, policy compliance, database configuration, text analysis standards, and progressive complexity. Created validation checklist for replicating success in similar templates.

### [Enhanced] - Unit_2 Template Text Sections with Real Data Analysis
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-180000-text-sections-data-analysis.md`
- **Files**: 
  - `Templates/Unit_2/assignment_1/unit2_task1_template.qmd` (3 text sections updated)
  - `Templates/Unit_2/assignment_2/unit2_task2_template.qmd` (2 text sections updated)
  - `Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd` (3 text sections updated)
  - `Templates/Unit_2/assignment_4/unit2_task3_template.qmd` (1 text section updated)
- **Summary**: Replaced generic methodology descriptions with actual data analysis based on rendered results. Text sections now analyze specific data patterns, player names, years, salary ranges, and visualization insights.

### [Fixed] - Slack Policy Compliance in Unit_2 Templates
- **Detailed Entry**: See `trickle-down-1-project/slack-announcements/policy-updates/2025-10-29-170000-policy-compliance.md`
- **Files**: 
  - `Templates/Unit_2/assignment_1/unit2_task1_template.qmd` (fixed: added .head() to prints)
  - `Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd` (fixed: added .head() to print)
- **Summary**: Fixed violations of Slack policy requiring use of `.head()` instead of printing full dataframes. Verified all templates use lets_plot (no matplotlib). All Unit_2 templates now fully compliant with Slack-announced course policies.

### [Completed] - Unit_2 Template Implementation
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-162500-templates-completed.md`
- **Files**: All Unit_2 assignment templates completed with full solutions
- **Summary**: Implemented all SQL queries and Pandas code for Unit_2 assignments. Fixed template titles and database paths.

### [Reorganized] - Unit_2 Assignment Folder Structure
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-161500-folder-reorganization.md`
- **Files**: Reorganized into `assignment_1/`, `assignment_2/`, `assignment_3/`, `assignment_4/` folders
- **Summary**: Moved Unit_2 projects and templates into assignment-numbered subfolders matching Canvas assignment order.

### [Aligned] - Unit_2 Folders with GitHub Pages and Canvas
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-160500-folders-alignment.md`
- **Summary**: Ensured Unit_2 folder structure matches both GitHub Pages published content and Canvas assignment organization.

### [Updated] - Unit_2 Templates from GitHub Pages
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-160430-templates-updated.md`
- **Summary**: Updated Unit_2 templates to match exact versions from GitHub Pages site.

### [Created] - Templates/Unit_2/ Folder Structure
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-155800-folder-creation.md`
- **Summary**: Created `Templates/Unit_2/` folder with initial template files.

### [Verified] - Unit_2 GitHub Pages Content
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-155500-github-pages-verification.md`
- **Summary**: Verified GitHub Pages links and template references match local files.

### [Verified] - Unit_2 Canvas Assignments
- **Detailed Entry**: See `trickle-down-2-features/templates/unit-2-changes/2025-10-29-155229-canvas-verification.md`
- **Summary**: Verified Unit_2 folder contains only the 4 specified Canvas assignments using browser automation.

---

**Note**: For detailed documentation of each change, see the referenced entries in the appropriate trickle-down folders.
