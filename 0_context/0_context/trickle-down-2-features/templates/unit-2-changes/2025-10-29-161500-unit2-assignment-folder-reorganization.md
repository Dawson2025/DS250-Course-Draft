# Archive Entry: Unit_2 Assignment Folder Reorganization

**Date:** 2025-10-29  
**Time:** 16:15:00  
**Type:** Structure Reorganization

## Summary

Reorganized the `Projects/Unit_2/` and `Templates/Unit_2/` directories to create individual assignment folders that reflect the Canvas assignment order. Each project and template file now resides in its own folder named after the assignment number within the unit (assignment_1, assignment_2, assignment_3, assignment_4).

## What Changed

### Directory Structure

**Before:**
```
Projects/Unit_2/
  ├── unit2_task1.qmd
  ├── unit2_task2.qmd
  ├── unit2_task3_validation_in_py.qmd
  └── unit2_task3.qmd

Templates/Unit_2/
  ├── unit2_task1_template.qmd
  ├── unit2_task2_template.qmd
  ├── unit2_task3_validation_template.qmd
  └── unit2_task3_template.qmd
```

**After:**
```
Projects/Unit_2/
  ├── assignment_1/
  │   └── unit2_task1.qmd (Task 1: Batting Averages)
  ├── assignment_2/
  │   └── unit2_task2.qmd (Task 2: Basic aggregation and wrangling)
  ├── assignment_3/
  │   └── unit2_task3_validation_in_py.qmd (Task 3: Joins)
  └── assignment_4/
      └── unit2_task3.qmd (Task 4: STRETCH: Longevity)

Templates/Unit_2/
  ├── assignment_1/
  │   └── unit2_task1_template.qmd
  ├── assignment_2/
  │   └── unit2_task2_template.qmd
  ├── assignment_3/
  │   └── unit2_task3_validation_template.qmd
  └── assignment_4/
      └── unit2_task3_template.qmd
```

### Canvas Assignment Order Mapping

The assignment folders follow the Canvas module display order:
1. **assignment_1**: Unit 2 Task 1: Batting Averages (Due Oct 8) - Assignment ID 15477823
2. **assignment_2**: Unit 2 Task 2: Basic aggregation and wrangling (Due Oct 11) - Assignment ID 15477825
3. **assignment_3**: Unit 2 Task 3: Joins (Due Oct 15) - Assignment ID 15477827
4. **assignment_4**: Unit 2 STRETCH: Longevity (Due Oct 18) - Assignment ID 15477821

### Files Modified

1. **Project Files** - Updated template path references:
   - `Projects/Unit_2/assignment_1/unit2_task1.qmd`
   - `Projects/Unit_2/assignment_2/unit2_task2.qmd`
   - `Projects/Unit_2/assignment_3/unit2_task3_validation_in_py.qmd`
   - `Projects/Unit_2/assignment_4/unit2_task3.qmd`
   
   All template links changed from `../Templates/...` to `../../Templates/Unit_2/assignment_X/...`

2. **Configuration Files**:
   - `_quarto.yml` - Updated navigation paths to reflect new folder structure:
     - Changed `Projects/unit2_task1.qmd` → `Projects/Unit_2/assignment_1/unit2_task1.qmd`
     - Changed `Projects/unit2_task2.qmd` → `Projects/Unit_2/assignment_2/unit2_task2.qmd`
     - Changed `Projects/unit2_task3_validation_in_py.qmd` → `Projects/Unit_2/assignment_3/unit2_task3_validation_in_py.qmd`
     - Changed `Projects/unit2_task3.qmd` → `Projects/Unit_2/assignment_4/unit2_task3.qmd`

## Why This Changed

- **User Request**: Reorganize files to match Canvas assignment order
- **Consistency**: Each assignment should have its own folder for better organization
- **Alignment**: Folders now explicitly reflect the assignment sequence as displayed in Canvas modules

## Impact

- **Navigation**: Site navigation updated in `_quarto.yml` to use new paths
- **Links**: All template references in project files updated to correct relative paths
- **Structure**: Cleaner organization with each assignment in its own folder
- **Canvas Alignment**: Folder numbering now matches Canvas module display order exactly

## Related Archive Entries

- `2025-10-29-160500-unit2-folders-github-pages-canvas-alignment.md` - Previous alignment verification

