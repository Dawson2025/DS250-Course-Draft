# Assignment 2 Template Validation Checklist

**Template:** `Templates/Unit_2/assignment_2/unit2_task2_template.qmd`  
**Project File:** `Projects/Unit_2/assignment_2/unit2_task2.qmd`  
**Last Verified:** 2025-10-29

Use this checklist when verifying or completing Unit 2 Assignment 2 template, or as a template for other assignment validations.

## Pre-Completion Verification

### Source File Verification
- [ ] Project file exists at `Projects/Unit_2/assignment_2/unit2_task2.qmd`
- [ ] GitHub Pages version matches local project file
- [ ] Canvas assignment URL verified (if accessible)
- [ ] Template file exists at `Templates/Unit_2/assignment_2/unit2_task2_template.qmd`

### Title Format Verification
- [ ] Template title: `"Client Report - Basic aggregation and wrangling"`
- [ ] Subtitle: `"Unit 2 Task 2"`
- [ ] Title matches expected format ("Client Report - " prefix)
- [ ] Title text extracted correctly from project file (minus "Unit 2 Task 2: " prefix)

**Expected:**
```yaml
title: "Client Report - Basic aggregation and wrangling"
subtitle: "Unit 2 Task 2"
```

### Question Text Verification

#### Question 1
- [ ] Template question matches project file exactly (word-for-word)
- [ ] Includes: "Write an SQL query that pulls in the batting table"
- [ ] Includes: "Then, with Python Pandas code create a dataframe"
- [ ] Includes: "contains playerID, yearID, and batting average"
- [ ] Includes: "for players with at least 10 at持续推进bat that year"
- [ ] Includes: "Sort the dataframe from highest batting average to lowest"
- [ ] Includes: "then by playerid alphabetically"
- [ ] Includes: "Show the top 5 results in your report"

**Exact Expected Text:**
```
__Write an SQL query that pulls in the batting table. Then, with Python Pandas code create a dataframe that contains playerID, yearID, and batting average for players with at least 10 at bat that year. Sort the dataframe from highest batting average to lowest, and then by playerid alphabetically. Show the top 5 results in your report.__
```

#### Question 2
- [ ] Template question matches project file exactly (word-for-word)
- [ ] Includes: "Write an SQL query that pulls in the batting table"
- [ ] Includes: "Then, with Python Pandas calculate the batting average"
- [ ] Includes: "for each player over their entire career (all years combined)"
- [ ] Includes: "Only include players with at least 100 at bats over their entire career"
- [ ] Includes: "Sort the dataframe from highest batting average to lowest"
- [ ] Includes: "then by playerid alphabetically"
- [ ] Includes: "Show the top 5 results in your report"

**Exact Expected Text:**
```
__Write an SQL query that pulls in the batting table. Then, with Python Pandas calculate the batting average for each player over their entire career (all years combined). Only include players with at least 100 at bats over their entire career. Sort the dataframe from highest batting average to lowest, and then by playerid alphabetically. Show the top 5 results in your report.__
```

### Layout Structure Verification
- [ ] YAML frontmatter present with correct format
- [ ] Standard imports section present (pandas, numpy, sqlite3, lets_plot)
- [ ] Database connection code block present
- [ ] Each question has `## QUESTION N` header
- [ ] Each question has bold question text (`__text__`)
- [ ] Each question has text analysis section (italic placeholder or filled)
- [ ] Each question has code solution block

## During Completion

### Solution Writing Standards
- [ ] **ONLY** solution sections modified (never question text)
- [ ] Code executed to produce actual results
- [ ] Analysis written based on actual outputs/visuals
- [ ] Specific values referenced (player IDs, percentages, years)
- [ ] Patterns and trends explained
- [ ] Context provided where relevant

### Code Quality
- [ ] All code blocks execute without errors
- [ ] SQL queries use safe division (NULLIF where appropriate)
- [ ] Pandas code uses `.head()` for display (Slack policy)
- [ ] Code comments explain purpose
- [ ] Database path clearly documented

### Question 1 Solution
- [ ] SQL query pulls batting table correctly
- [ ] Pandas calculates batting average (H/AB) correctly
- [ ] Filters for at least 10 at-bats
- [ ] Sorts by batting average (desc) then playerID (asc)
- [ ] Displays top 5 results
- [ ] Analysis references specific player IDs
- [ ] Analysis references specific percentages/years
- [ ] Analysis explains patterns observed

### Question 2 Solution
- [ ] SQL query shown (even if data reused from Q1)
- [ ] Comment explains SQL query requirement
- [ ] Pandas groups by playerID for career totals
- [ ] Calculates career batting average correctly
- [ ] Filters for at least 100 career at-bats
- [ ] Sorts by career batting average (desc) then playerID (asc)
- [ ] Displays top 5 results
- [ ] Analysis references specific player IDs
- [ ] Analysis references specific career averages
- [ ] Analysis explains career-level patterns

## Post-Completion Verification

### Three-Way Verification
- [ ] **Canvas** → **Project File**: Questions match
- [ ] **Project File** → **GitHub Pages**: Content matches
- [ ] **Project File** → **Template**: Questions match exactly

### Code Execution Test
- [ ] Template renders: `quarto render Templates/Unit_2/assignment_2/unit2_task2_template.qmd`
- [ ] No rendering errors
- [ ] All code blocks execute
- [ ] Output displays correctly
- [ ] Top 5 results show for each question

### Content Verification
- [ ] Open rendered HTML in browser
- [ ] Title displays: "Client Report - Basic aggregation and wrangling"
- [ ] Subtitle displays: "Unit 2 Task 2"
- [ ] Question 1 text matches project file exactly
- [ ] Question 2 text matches project file exactly
- [ ] Solution sections display correctly
- [ ] Code outputs appear in rendered HTML

### Comparison Check
- [ ] Side-by-side: Project file vs Template
- [ ] Only solution sections differ
- [ ] Questions match exactly
- [ ] Title format correct (with "Client Report - " prefix)
- [ ] Layout structure matches

## Final Validation

### Document Integrity
- [ ] No questions modified
- [ ] No title/subtitle formatting errors
- [ ] All instructions included in questions
- [ ] Solution sections contain real data analysis
- [ ] Code runs successfully

### Standards Compliance
- [ ] Follows Assignment 1 success pattern
- [ ] Follows template verification guide
- [ ] Matches project file exactly (questions/structure)
- [ ] Solution analysis based on actual results
- [ ] References specific values in analysis

---

## Quick Reference: Expected Values

### Question 1 Top 5 Results (with ≥10 AB threshold)
Expected to show players with high single-season batting averages. Values will vary but should be realistic (likely 0.5-0.7 range).

### Question 2 Top 5 Results (with ≥100 AB threshold)
Expected career leaders:
- Ty Cobb (cobbty01): ~0.366
- Various other Hall of Famers: ~0.350-0.360 range

---

## Notes

- **Title Format**: Always "Client Report - [Title]" not "Unit N Task X: [Title]"
- **Question Text**: Must match project file word-for-word
- **Solution Only**: Never modify questions, only fill solution sections
- **Real Data**: Analysis must reference actual results, not generic descriptions

## Related Documentation

- **Template Verification Guide**: `template-verification-and-completion-guide.md`
- **Assignment 1 Success Pattern**: `2025-10-29-220000-assignment-1-success-pattern.md`
- **Assignment 2 Process**: `2025-10-29-223000-unit2-assignment-2-template-verification-process.md`

