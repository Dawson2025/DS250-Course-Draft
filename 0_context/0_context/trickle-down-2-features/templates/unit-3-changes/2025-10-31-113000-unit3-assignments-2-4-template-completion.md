# Unit 3 Assignments 2–4: Template Completion and Verification

**Date**: 2025-10-31  
**Time**: 11:30:00  
**Type**: Template Completion + Verification  
**Scope**: `Templates/Unit_3/assignment_2/` → `assignment_4/`

## Summary

Finished the remaining Unit 3 client-report templates (Tasks 2–4) using the shared flights dataset. Each template now contains standardized data preparation, analysis narrative tied to rendered outputs, and Lets-Plot visuals. All three templates render without errors via `quarto render`, producing updated HTML artifacts for instructor review.

## Changes Made

### 1. Unit 3 Task 2 – Weather Delays

**File**: `Templates/Unit_3/assignment_2/unit3_task2_template.qmd`

- Added a reusable cleaning block that:
  - Fills blank airport names, coerces all numeric fields, standardises month labels, and stores an ordered categorical month column.
  - Computes the “weather from late aircraft/NAS” features (0.30 late, 0.40 or 0.65 NAS) and the combined `weather_delay_total`.
- Question 1 now generates a formatted summary table with delay rate and average delay hours, highlighting SFO as the worst performer.
- Question 2 prints the first rows showing the derived weather components, making the transformation auditable.
- Question 3 aggregates the new metric by airport and plots the weather delay share sorted by magnitude.

### 2. Unit 3 Task 3 – “If not now, when?”

**File**: `Templates/Unit_3/assignment_3/unit3_task3_template.qmd`

- Reused the cleaning block to ensure consistent numeric types and month ordering.
- Calculated monthly delay rates and average delay minutes; presented them in a formatted table.
- Identified September as the lowest-delay month and backed it up with a Lets-Plot column chart (x‑axis ordered chronologically).
- Narrative references only values shown in the rendered table/plot.

### 3. Unit 3 Task 4 – Comparing Delay Types

**File**: `Templates/Unit_3/assignment_4/unit3_task4_template.qmd` *(new template)*

- Created the shared preparation chunk plus the all-weather metric.
- Question 1 compares overall counts for Weather vs Carrier vs Security delays, including a percentage table and bar chart.
- Question 2 reshapes the per-airport delay mix, provides a percentage table, and renders a stacked bar chart illustrating how the mix shifts by airport (e.g., SAN/SLC with more carrier delays).
- Narrative summaries emphasise insights directly visible in the visuals.

## Rendering & Verification

- Ran `quarto render` for all three templates, producing HTML in each assignment directory.
- Playwright navigation confirmed the HTML content loads (headless check only — no system GUI is available in this environment).
- Analysis prose was cross-checked against tables/plots to ensure compliance with the “analysis must match visuals” rule.

## Updated Mapping

| Assignment | Canvas ID | Project File | Template File | Title |
|------------|-----------|--------------|---------------|-------|
| 1 | 15477831 | `Projects/Unit_3/assignment_1/unit3_task1.qmd` | `Templates/Unit_3/assignment_1/unit3_task1_template.qmd` | Missing Data & JSON |
| 2 | (Unknown) | `Projects/Unit_3/assignment_2/unit3_task2.qmd` | `Templates/Unit_3/assignment_2/unit3_task2_template.qmd` | Weather Delays |
| 3 | (Unknown) | `Projects/Unit_3/assignment_3/unit3_task3.qmd` | `Templates/Unit_3/assignment_3/unit3_task3_template.qmd` | If not now, when? |
| 4 | (Unknown) | `Projects/Unit_3/assignment_4/unit3_task4.qmd` | `Templates/Unit_3/assignment_4/unit3_task4_template.qmd` | Comparing Delay Types |

## Next Steps

1. Capture screenshots (optional) once a GUI-enabled environment is available, per MCP verification standards.
2. Keep Project navigation (`_quarto.yml`) aligned if additional Unit 3 adjustments are made.
