# Archive Entry: Unit_2 Templates Completed with Full Solutions

**Date:** 2025-10-29  
**Time:** 16:25:00  
**Type:** Template Completion

## Summary

Completed all four Unit_2 assignment templates with full working solutions, following all instructions from the corresponding assignment project files. Each template now contains complete, executable code that solves the required tasks.

## What Changed

### Assignment 1: Batting Averages (SQL Queries)
**File**: `Templates/Unit_2/assignment_1/unit2_task1_template.qmd`

- **Question 1**: SQL query for batting averages with at least 1 at-bat (top 5)
- **Question 2**: SQL query for batting averages with at least 10 at-bats (top 5)
- **Question 3**: SQL query for career batting averages with at least 100 at-bats (top 5)
- Updated database path to `../../Data/lahmansbaseballdb.sqlite`
- Added descriptive text for each question explaining the analysis

### Assignment 2: Basic Aggregation and Wrangling (Pandas Validation)
**File**: `Templates/Unit_2/assignment_2/unit2_task2_template.qmd`

- **Question 1**: SQL to pull batting table, pandas to calculate batting averages with at least 10 at-bats (top 5)
- **Question 2**: Pandas to calculate career batting averages with at least 100 at-bats (top 5)
- Fixed title from "BYU-Idaho Players and Comparing Teams" to "Client Report - Batting Average Validation"
- Updated database path to `../../Data/lahmansbaseballdb.sqlite`
- Added descriptive text explaining the validation approach

### Assignment 3: Joins
**File**: `Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd`

- **Question 1**: SQL to pull salaries and collegeplaying tables, pandas merge to find BYU-Idaho players (schoolID = 'idbyuid')
- **Question 2**: Team comparison (Yankees vs Red Sox) using average salary over time with Lets-Plot visualization
- Fixed title from "Longevity of Baseball Players" to "Client Report - Joins and Team Comparison"
- Updated database path to `../../Data/lahmansbaseballdb.sqlite`
- Added complete visualization code using Lets-Plot with proper formatting

### Assignment 4: Longevity of Players
**File**: `Templates/Unit_2/assignment_4/unit2_task3_template.qmd`

- **Question 1**: SQL to identify top 10 players with longest careers (using people and batting tables)
- Calculates career length as (last_year - first_year + 1)
- Includes playerID, first_name, last_name, career_length
- Updated database path to `../../Data/lahmansbaseballdb.sqlite`
- Added descriptive text explaining career length calculation

## Database Path Updates

All templates updated from:
```python
sqlite_file = 'lahmansbaseballdb.sqlite'
```

To:
```python
sqlite_file = '../../Data/lahmansbaseballdb.sqlite'
```

This correctly points to the database location in the `Data/` directory relative to the template files.

## Code Quality

- All code is properly commented
- SQL queries follow best practices (NULLIF for division, proper aggregation)
- Pandas operations use appropriate methods (groupby, merge, sort_values)
- Lets-Plot visualization includes proper formatting and labels
- All solutions are complete and executable

## Why This Changed

- **User Request**: Complete all assignment instructions in templates
- **Educational Purpose**: Provides working examples for students
- **Consistency**: All templates now follow the same structure and style
- **Completeness**: Every question has a full solution with explanation

## Impact

- **Students**: Can now see complete working solutions to all Unit_2 assignments
- **Learning**: Demonstrates proper SQL and pandas techniques
- **Quality**: All templates are ready for student use
- **Maintenance**: Consistent code style across all templates

## Related Archive Entries

- `2025-10-29-161500-unit2-assignment-folder-reorganization.md` - Folder structure that enabled this work

