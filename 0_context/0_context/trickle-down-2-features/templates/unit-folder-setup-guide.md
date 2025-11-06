# Unit Folder Setup Guide
**Creating Unit Folders with Canvas and GitHub Pages Alignment**

This guide documents the process used for Unit_2 and provides step-by-step instructions for setting up future units with proper folder structure aligned to Canvas assignments and GitHub Pages.

## Overview

When a unit has multiple assignments that should be organized in their own folders, follow this pattern established in Unit_2:

```
Projects/Unit_N/
  ├── assignment_1/
  │   └── unitN_taskX.qmd
  ├── assignment_2/
  │   └── unitN_taskY.qmd
  └── assignment_N/
      └── unitN_taskZ.qmd

Templates/Unit_N/
  ├── assignment_1/
  │   └── unitN_taskX_template.qmd
  ├── assignment_2/
  │   └── unitN_taskY_template.qmd
  └── assignment_N/
      └── unitN_taskZ_template.qmd
```

## Automated Workflow Option (RECOMMENDED)

**NEW**: Use the DS250 assignment agent workflow for automated setup!

Instead of following all 12 steps manually, you can use the specialized `assignment-planner` and `assignment-executor` agents:

1. **Invoke planning agent**: Creates comprehensive plan following all steps below
2. **Review and approve**: User verifies plan matches requirements
3. **Invoke execution agent**: Automatically executes all 12 steps with progress tracking

**See**: `0_context/0_context/0_universal_instructions/agent-patterns/assignment-quick-start.md` for quick start guide.

**Benefits**:
- ✅ All 0_context rules enforced automatically
- ✅ Canvas authentication handled securely (canvas_authenticate.py)
- ✅ Progress tracked with todos
- ✅ MCP visual verification included
- ✅ Documentation created automatically
- ✅ Hands-off after approval

**When to use manual process**: When learning the pattern, making custom modifications, or troubleshooting.

## Step-by-Step Process (Manual)

If not using the automated agent workflow, follow these steps manually:

### Step 1: Identify Canvas Assignments

**Objective**: Get all Canvas assignment URLs for the unit.

1. **Access Canvas Course**
   ```python
   # Use Canvas authentication script
   from 0_context/0_context/trickle-down-0.5-environment/setup-scripts/canvas_authenticate import load_canvas_credentials
   ```
   - Or navigate to Canvas manually: `https://byui.instructure.com/courses/COURSE_ID`
   - Or use browser automation to extract assignment URLs

2. **Extract Assignment URLs**
   - Canvas assignment URLs follow pattern:
     ```
     https://byui.instructure.com/courses/COURSE_ID/assignments/ASSIGNMENT_ID
     ```
   - **Example for Unit_2**:
     - Assignment 15477823: Unit 2 Task 1: Batting Averages
     - Assignment 15477825: Unit 2 Task 2: Basic aggregation and wrangling
     - Assignment 15477827: Unit 2 Task 3: Joins
     - Assignment 15477821: Unit 2 STRETCH: Longevity

3. **Record Assignment Details**
   - Assignment ID
   - Assignment title/name
   - Due date (for ordering)
   - Canvas module display order

### Step 2: Match with GitHub Pages

**Objective**: Find the GitHub Pages URLs that Canvas assignments link to.

**GitHub Pages Base URL**: `https://byuidatascience.github.io/DS250-Course-Draft/`

**Process:**
1. **Access each Canvas assignment** and find the embedded link or iframe
2. **Extract GitHub Pages URL** from Canvas content
   - Canvas assignments often embed GitHub Pages in iframes
   - Look for links like: `Projects/unitN_taskX.html`
3. **Map Canvas → GitHub Pages**
   ```
   Canvas Assignment 15477823 → Projects/unit2_task1.html
   Canvas Assignment 15477825 → Projects/unit2_task2.html
   Canvas Assignment 15477827 → Projects/unit2_task3_validation_in_py.html
   Canvas Assignment 15477821 → Projects/unit2_task3.html
   ```

4. **Extract Template Links** from GitHub Pages
   - On each GitHub Pages assignment page, find the template download link
   - Template links follow pattern: `Templates/unitN_taskX_template.qmd`
   - **Example for Unit_2**:
     - Task 1: `Templates/unit2_task1_template.qmd`
     - Task 2: `Templates/unit2_task2_template.qmd`
     - Task 3: `Templates/unit2_task3_validation_template.qmd`
     - Task 4: `Templates/unit2_task3_template.qmd`

### Step 3: Create Unit Folders

**Objective**: Create folder structure for Projects and Templates.

```bash
# Create unit folders
mkdir -p Projects/Unit_N
mkdir -p Templates/Unit_N
```

**Example for Unit_2**:
```bash
mkdir -p Projects/Unit_2
mkdir -p Templates/Unit_2
```

### Step 4: Determine Assignment Order

**Objective**: Number assignments in Canvas module display order (not necessarily by due date).

**Critical**: Assignment folders must match Canvas module display order, not assignment IDs or due dates.

**Process:**
1. Check Canvas module to see assignment display order
2. Number assignments sequentially as they appear: `assignment_1`, `assignment_2`, etc.
3. **Example for Unit_2**:
   - Canvas module shows:
     1. Unit 2 Task 1 (Assignment 15477823) → `assignment_1`
     2. Unit 2 Task 2 (Assignment 15477825) → `assignment_2`
     3. Unit 2 Task 3 (Assignment 15477827) → `assignment_3`
     4. Unit 2 STRETCH (Assignment 15477821) → `assignment_4`

### Step 5: Create Assignment Folders

**Objective**: Create numbered assignment folders matching Canvas order.

```bash
# For each assignment in Canvas order
mkdir -p Projects/Unit_N/assignment_1
mkdir -p Projects/Unit_N/assignment_2
# ... etc

mkdir -p Templates/Unit_N/assignment_1
mkdir -p Templates/Unit_N/assignment_2
# ... etc
```

**Example for Unit_2**:
```bash
mkdir -p Projects/Unit_2/assignment_{1,2,3,4}
mkdir -p Templates/Unit_2/assignment_{1,2,3,4}
```

### Step 6: Extract Project Files from GitHub Pages

**Objective**: Get the `.qmd` source files that generate the GitHub Pages HTML.

**Option A: From Local Repository (if files already exist)**
1. Find existing files matching GitHub Pages HTML names
2. Move/copy to appropriate assignment folder
3. Update paths if needed

**Option B: Extract from GitHub Pages (if files don't exist locally)**
1. Download `.qmd` source from GitHub repository
2. Or extract content from GitHub Pages HTML (less reliable)
3. Save to appropriate assignment folder

**Naming Convention:**
- GitHub Pages: `Projects/unitN_taskX.html`
- Local file: `Projects/Unit_N/assignment_K/unitN_taskX.qmd`

**Example for Unit_2**:
- GitHub Pages: `Projects/unit2_task1.html`
- Local: `Projects/Unit_2/assignment_1/unit2_task1.qmd`

### Step 7: Extract Templates from GitHub Pages

**Objective**: Download template files referenced in GitHub Pages.

**Process:**
1. For each GitHub Pages assignment page, identify template link
2. Download template from GitHub Pages using direct URL:
   ```
   https://byuidatascience.github.io/DS250-Course-Draft/Templates/unitN_taskX_template.qmd
   ```
3. Save to matching assignment folder:
   ```
   Templates/Unit_N/assignment_K/unitN_taskX_template.qmd
   ```

**Example for Unit_2**:
- Template URL: `https://byuidatascience.github.io/DS250-Course-Draft/Templates/unit2_task1_template.qmd`
- Local: `Templates/Unit_2/assignment_1/unit2_task1_template.qmd`

**Automation Option** (using browser or web extraction):
```python
import requests
template_url = "https://byuidatascience.github.io/DS250-Course-Draft/Templates/unit2_task1_template.qmd"
response = requests.get(template_url)
with open("Templates/Unit_2/assignment_1/unit2_task1_template.qmd", "w") as f:
    f.write(response.text)
```

### Step 8: Update Project File Template References

**Objective**: Fix template path references in project files.

**Process:**
1. Open each project file in `Projects/Unit_N/assignment_K/`
2. Find template download/reference links
3. Update paths to match new folder structure

**Path Update Examples:**

**Old path** (if files were in root):
```markdown
Download the [Unit N Task X Template](../../Templates/unitN_taskX_template.qmd).
```

**New path** (assignment folder structure):
```markdown
Download the [Unit N Task X Template](../../../Templates/Unit_N/assignment_K/unitN_taskX_template.qmd).
```

**Relative path calculation:**
- From: `Projects/Unit_N/assignment_K/unitN_taskX.qmd`
- To: `Templates/Unit_N/assignment_K/unitN_taskX_template.qmd`
- Path: `../../../Templates/Unit_N/assignment_K/unitN_taskX_template.qmd`

### Step 9: Update _quarto.yml Navigation

**Objective**: Update site navigation to reflect new folder structure.

**Location**: Root `_quarto.yml` file

**Before** (flat structure):
```yaml
navbar:
  right:
    - text: "Unit N Title"
      menu:
        - text: "Task 1"
          file: Projects/unitN_task1.qmd
        - text: "Task 2"
          file: Projects/unitN_task2.qmd
```

**After** (assignment folder structure):
```yaml
navbar:
  right:
    - text: "Unit N Title"
      menu:
        - text: "Task 1"
          file: Projects/Unit_N/assignment_1/unitN_task1.qmd
        - text: "Task 2"
          file: Projects/Unit_N/assignment_2/unitN_task2.qmd
```

**Match Menu Order to Canvas Order:**
- Menu item 1 → `assignment_1/`
- Menu item 2 → `assignment_2/`
- etc.

### Step 10: Verify Three-Way Alignment

**Objective**: Ensure Canvas, GitHub Pages, and local files are aligned.

**Verification Checklist:**

**Canvas → GitHub Pages:**
- [ ] Each Canvas assignment links to correct GitHub Pages URL
- [ ] GitHub Pages URL corresponds to expected assignment

**GitHub Pages → Local Projects:**
- [ ] GitHub Pages HTML file name matches local `.qmd` file name
- [ ] Content matches (verify key sections)
- [ ] Template links in GitHub Pages match local template files

**Local Projects → Local Templates:**
- [ ] Template paths in project files are correct
- [ ] All referenced templates exist in `Templates/Unit_N/assignment_K/`
- [ ] Template filenames match references

**Canvas Order → Assignment Folders:**
- [ ] `assignment_1` corresponds to first Canvas assignment in module
- [ ] `assignment_2` corresponds to second Canvas assignment in module
- [ ] Folder numbering matches Canvas module display order

### Step 11: Verify File Counts

**Objective**: Ensure no files are missing or extra.

**Expected Structure:**
```
Projects/Unit_N/
  ├── assignment_1/unitN_taskX.qmd
  ├── assignment_2/unitN_taskY.qmd
  └── assignment_N/unitN_taskZ.qmd
  (Should have exactly N files, one per assignment)

Templates/Unit_N/
  ├── assignment_1/unitN_taskX_template.qmd
  ├── assignment_2/unitN_taskY_template.qmd
  └── assignment_N/unitN_taskZ_template.qmd
  (Should have exactly N templates, one per assignment)
```

**Verification Commands:**
```bash
# Count project files
find Projects/Unit_N -name "*.qmd" -type f | wc -l
# Should equal number of assignments

# Count template files
find Templates/Unit_N -name "*_template.qmd" -type f | wc -l
# Should equal number of assignments

# Verify each assignment folder has one project file
ls Projects/Unit_N/assignment_*/unit*.qmd
# Should list exactly N files

# Verify each assignment folder has one template
ls Templates/Unit_N/assignment_*/*template.qmd
# Should list exactly N files
```

### Step 12: Test Rendering

**Objective**: Verify all files render correctly.

**Test Each File:**
```bash
# Test project files
quarto render Projects/Unit_N/assignment_1/unitN_task1.qmd
quarto render Projects/Unit_N/assignment_2/unitN_task2.qmd
# ... etc

# Test navigation
quarto preview
# Navigate to Unit N in navbar, verify all tasks accessible
```

**Check for Errors:**
- [ ] No path errors in rendering
- [ ] All template links work
- [ ] Navigation menu displays correctly
- [ ] All images/data files load (check relative paths)

## Unit_2 Reference Example

### Unit_2 Structure Created

**Canvas Assignments:**
1. Assignment 15477823: Unit 2 Task 1: Batting Averages → `assignment_1`
2. Assignment 15477825: Unit 2 Task 2: Basic aggregation → `assignment_2`
3. Assignment 15477827: Unit 2 Task 3: Joins → `assignment_3`
4. Assignment 15477821: Unit 2 STRETCH: Longevity → `assignment_4`

**GitHub Pages Mapping:**
- `Projects/unit2_task1.html` → `Projects/Unit_2/assignment_1/unit2_task1.qmd`
- `Projects/unit2_task2.html` → `Projects/Unit_2/assignment_2/unit2_task2.qmd`
- `Projects/unit2_task3_validation_in_py.html` → `Projects/Unit_2/assignment_3/unit2_task3_validation_in_py.qmd`
- `Projects/unit2_task3.html` → `Projects/Unit_2/assignment_4/unit2_task3.qmd`

**Templates:**
- `Templates/unit2_task1_template.qmd` → `Templates/Unit_2/assignment_1/unit2_task1_template.qmd`
- `Templates/unit2_task2_template.qmd` → `Templates/Unit_2/assignment_2/unit2_task2_template.qmd`
- `Templates/unit2_task3_validation_template.qmd` → `Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd`
- `Templates/unit2_task3_template.qmd` → `Templates/Unit_2/assignment_4/unit2_task3_template.qmd`

### Unit_2 _quarto.yml Update

**Before:**
```yaml
- text: "Unit 2 SQLite"
  menu:
    - text: "Task 1"
      file: Projects/unit2_task1.qmd
    - text: "Task 2"
      file: Projects/unit2_task2.qmd
    - text: "Task 3"
      file: Projects/unit2_task3_validation_in_py.qmd
    - text: "Task 4"
      file: Projects/unit2_task3.qmd
```

**After:**
```yaml
- text: "Unit 2 SQLite"
  menu:
    - text: "Task 1"
      file: Projects/Unit_2/assignment_1/unit2_task1.qmd
    - text: "Task 2"
      file: Projects/Unit_2/assignment_2/unit2_task2.qmd
    - text: "Task 3"
      file: Projects/Unit_2/assignment_3/unit2_task3_validation_in_py.qmd
    - text: "Task 4"
      file: Projects/Unit_2/assignment_4/unit2_task3.qmd
```

## Troubleshooting

### Issue: Template path not working in project file

**Solution**: Calculate relative path correctly
- From: `Projects/Unit_N/assignment_K/unitN_taskX.qmd`
- To: `Templates/Unit_N/assignment_K/unitN_taskX_template.qmd`
- Relative: `../../../Templates/Unit_N/assignment_K/unitN_taskX_template.qmd`
- Go up 3 levels: `../../..`
- Then down: `Templates/Unit_N/assignment_K/unitN_taskX_template.qmd`

### Issue: Canvas assignment order unclear

**Solution**: Check Canvas module view
- Go to Canvas course → Modules
- See order assignments appear in module
- Number accordingly: first = `assignment_1`, second = `assignment_2`, etc.
- **Do NOT** use assignment IDs or due dates for ordering

### Issue: GitHub Pages template link not found

**Solution**: 
1. Check if template is linked in GitHub Pages assignment HTML
2. Try direct URL pattern: `https://byuidatascience.github.io/DS250-Course-Draft/Templates/unitN_taskX_template.qmd`
3. Check GitHub repository directly for template files
4. Template may not exist yet - create one following naming convention

### Issue: Assignment count mismatch

**Solution**: Verify against Canvas
1. Count assignments in Canvas module
2. Verify all assignments are intended for this unit
3. Check for drafts or deleted assignments
4. Ensure local files match Canvas count exactly

## Related Documentation

- **Unit_2 Archive Entry**: `unit-2-changes/2025-10-29-161500-unit2-assignment-folder-reorganization.md`
- **Canvas Verification**: `unit-2-changes/2025-10-29-155229-unit2-canvas-assignment-verification.md`
- **GitHub Pages Alignment**: `unit-2-changes/2025-10-29-160500-unit2-folders-github-pages-canvas-alignment.md`
- **Template Extraction**: `unit-2-changes/2025-10-29-160430-unit2-templates-updated-from-github-pages.md`
- **Canvas Authentication**: `trickle-down-0.5-environment/canvas-authentication-setup.md`

## Summary Checklist for New Unit Setup

**Complete these steps in order:**

- [ ] **Step 1**: Identify Canvas assignments (get URLs)
- [ ] **Step 2**: Match with GitHub Pages (find HTML URLs and template links)
- [ ] **Step 3**: Create `Projects/Unit_N/` and `Templates/Unit_N/` folders
- [ ] **Step 4**: Determine Canvas module display order
- [ ] **Step 5**: Create assignment folders (`assignment_1/`, `assignment_2/`, etc.)
- [ ] **Step 6**: Extract/download project files to assignment folders
- [ ] **Step 7**: Extract/download templates to matching assignment folders
- [ ] **Step 8**: Update template path references in project files
- [ ] **Step 9**: Update `_quarto.yml` navigation
- [ ] **Step 10**: Verify three-way alignment (Canvas → GitHub Pages → Local)
- [ ] **Step 11**: Verify file counts match assignment count
- [ ] **Step 12**: Test rendering of all files
- [ ] **Document**: Create archive entry documenting the process

---

**Last Updated**: 2025-10-29  
**Reference**: Unit_2 implementation  
**Maintained By**: AI Agent documentation system

