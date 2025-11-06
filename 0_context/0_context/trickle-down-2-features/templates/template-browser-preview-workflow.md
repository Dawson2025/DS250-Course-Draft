# Template Browser Preview Workflow

**Viewing Rendered Assignment Templates in Browser with Multiple Tabs**

This guide documents the correct workflow for opening and viewing rendered assignment templates in a browser using MCP browser automation tools.

## Key Principle

**When asked to view rendered assignments from a specific unit:**
- Look in `Templates/Unit_N/` directory (NOT `Projects/Unit_N/`)
- Open all assignment HTML files in separate browser tabs simultaneously
- Template HTML files are already rendered and ready to view

## Directory Structure

```
DS250-Course-Draft/
├── Templates/
│   ├── Unit_2/
│   │   ├── assignment_1/
│   │   │   ├── unit2_task1_template.qmd
│   │   │   └── unit2_task1_template.html  ← Already rendered
│   │   ├── assignment_2/
│   │   │   ├── unit2_task2_template.qmd
│   │   │   └── unit2_task2_template.html  ← Already rendered
│   ├── Unit_3/
│   │   ├── assignment_1/
│   │   │   ├── unit3_task1_template.qmd
│   │   │   └── unit3_task1_template.html  ← Already rendered
│   │   ├── assignment_2/
│   │   │   ├── unit3_task2_template.qmd
│   │   │   └── unit3_task2_template.html  ← Already rendered
│   │   ├── assignment_3/
│   │   │   ├── unit3_task3_template.qmd
│   │   │   └── unit3_task3_template.html  ← Already rendered
│   │   ├── assignment_4/
│   │   │   ├── unit3_task4_template.qmd
│   │   │   └── unit3_task4_template.html  ← Already rendered
```

## Standard Workflow

### Request Interpretation

When the user asks to:
- "Show me the rendered assignments in Unit 3"
- "Open all Unit 2 assignments in browser"
- "View the finished templates for Unit 3"

**Interpret this as:**
1. Look in `Templates/Unit_N/` (NOT `Projects/`)
2. Find all `unitN_taskX_template.html` files
3. Open each in a separate browser tab

### Step-by-Step Process

**Step 1: Identify Template HTML Files**

```bash
# For Unit 3 example
Templates/Unit_3/assignment_1/unit3_task1_template.html
Templates/Unit_3/assignment_2/unit3_task2_template.html
Templates/Unit_3/assignment_3/unit3_task3_template.html
Templates/Unit_3/assignment_4/unit3_task4_template.html
```

**Step 2: Open First File in Current Tab**

Use any available MCP browser tool (playwright, chrome-devtools, or browser):

```python
# Navigate to first template
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_1/unit3_task1_template.html"
)
```

**Step 3: Create New Tabs for Remaining Files**

For each additional template:

```python
# Create new tab
mcp_playwright_browser_tabs(action="new")

# Navigate to next template
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_2/unit3_task2_template.html"
)

# Repeat for all remaining templates
```

**Step 4: Verify All Tabs Open**

```python
# List all open tabs
mcp_playwright_browser_tabs(action="list")
```

Expected output:
```
### Open tabs
- 0: [Client Report - Missing Data and JSON] (file://.../unit3_task1_template.html)
- 1: [Client Report - Weather Delays] (file://.../unit3_task2_template.html)
- 2: [Client Report - If not now, when?] (file://.../unit3_task3_template.html)
- 3: (current) [Client Report - Comparing Delay Types] (file://.../unit3_task4_template.html)
```

## Complete Example: Unit 3 Templates

```python
# Step 1: Open first template in current tab
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_1/unit3_task1_template.html"
)

# Step 2: Create tab 2 and open template 2
mcp_playwright_browser_tabs(action="new")
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_2/unit3_task2_template.html"
)

# Step 3: Create tab 3 and open template 3
mcp_playwright_browser_tabs(action="new")
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_3/unit3_task3_template.html"
)

# Step 4: Create tab 4 and open template 4
mcp_playwright_browser_tabs(action="new")
mcp_playwright_browser_navigate(
    url="file:///home/dawson/code/DS250-Course-Draft/Templates/Unit_3/assignment_4/unit3_task4_template.html"
)

# Step 5: Verify all tabs
mcp_playwright_browser_tabs(action="list")
```

## Common Mistakes to Avoid

### ❌ WRONG: Looking in Projects Directory First

```python
# DON'T DO THIS
Projects/Unit_3/assignment_1/unit3_task1.qmd  # Wrong location
Projects/Unit_3/assignment_1/unit3_task1.html  # May not exist
```

**Why Wrong:**
- Project files are the assignment specifications (questions only)
- May not be rendered to HTML
- Templates are the completed examples with solutions

### ❌ WRONG: Attempting to Render Before Opening

```python
# DON'T DO THIS
quarto render Templates/Unit_3/assignment_1/unit3_task1_template.qmd
```

**Why Wrong:**
- Templates are already rendered
- No need to re-render unless specifically requested
- Wastes time and may cause errors

### ❌ WRONG: Opening in Same Tab

```python
# DON'T DO THIS - overwrites previous content
mcp_playwright_browser_navigate(url="file://.../unit3_task1_template.html")
mcp_playwright_browser_navigate(url="file://.../unit3_task2_template.html")  # Replaces task 1!
```

**Why Wrong:**
- Only one assignment visible at a time
- User cannot switch between assignments
- Not the requested behavior

### ✅ CORRECT: Open All in Separate Tabs

```python
# DO THIS
# First assignment in current tab
mcp_playwright_browser_navigate(url="file://.../unit3_task1_template.html")

# Each additional assignment in new tab
mcp_playwright_browser_tabs(action="new")
mcp_playwright_browser_navigate(url="file://.../unit3_task2_template.html")

mcp_playwright_browser_tabs(action="new")
mcp_playwright_browser_navigate(url="file://.../unit3_task3_template.html")
```

## Quick Reference Commands

### Playwright (Recommended)

```python
# Navigate to template
mcp_playwright_browser_navigate(url="file:///absolute/path/to/template.html")

# Create new tab
mcp_playwright_browser_tabs(action="new")

# List all tabs
mcp_playwright_browser_tabs(action="list")

# Switch to specific tab
mcp_playwright_browser_tabs(action="select", index=0)

# Take screenshot
mcp_playwright_browser_take_screenshot(filename="preview.png", fullPage=True)
```

### Chrome DevTools

```python
# Navigate
mcp_chrome-devtools_navigate_page(url="file:///path/to/template.html")

# Create new tab
mcp_chrome-devtools_new_page(url="file:///path/to/template.html")

# List tabs
mcp_chrome-devtools_list_pages()

# Take screenshot
mcp_chrome-devtools_take_screenshot(fullPage=True)
```

### Generic Browser

```python
# Navigate
mcp_browser_browser_navigate(url="file:///path/to/template.html")

# Create new tab
mcp_browser_browser_new_tab(url="file:///path/to/template.html")

# List tabs
mcp_browser_browser_tab_list()
```

## Unit-Specific Quick Access

### Unit 2 (2 Assignments)

```bash
Templates/Unit_2/assignment_1/unit2_task1_template.html
Templates/Unit_2/assignment_2/unit2_task2_template.html
```

### Unit 3 (4 Assignments)

```bash
Templates/Unit_3/assignment_1/unit3_task1_template.html
Templates/Unit_3/assignment_2/unit3_task2_template.html
Templates/Unit_3/assignment_3/unit3_task3_template.html
Templates/Unit_3/assignment_4/unit3_task4_template.html
```

### Unit 4 (4 Assignments)

```bash
Templates/Unit_4/assignment_1/unit4_task1_template.html
Templates/Unit_4/assignment_2/unit4_task2_template.html
Templates/Unit_4/assignment_3/unit4_task3_template.html
Templates/Unit_4/assignment_4/unit4_task4_template.html
```

### Unit 5 (4 Assignments)

```bash
Templates/Unit_5/assignment_1/unit5_task1_template.html
Templates/Unit_5/assignment_2/unit5_task2_template.html
Templates/Unit_5/assignment_3/unit5_task3_template.html
Templates/Unit_5/assignment_4/unit5_task4_template.html
```

## Verification Checklist

After opening templates in browser:

- [ ] All assignment HTML files opened in separate tabs
- [ ] Each tab shows different assignment title
- [ ] Can switch between tabs without losing content
- [ ] All content displays correctly in each tab
- [ ] Tab titles match assignment names
- [ ] Screenshots captured if needed for documentation

## Related Documentation

- **Template Verification Guide**: `template-verification-and-completion-guide.md`
- **Browser Automation README**: `../../trickle-down-0.75-universal-tools/browser-automation/README.md`
- **MCP Configuration**: `../../trickle-down-0.5-environment/universal-mcp-configuration/`

## Success Pattern

**User Request:**
> "Show me the rendered assignments in Unit 3 in the browser"

**Correct Response:**
1. ✅ Look in `Templates/Unit_3/` directory
2. ✅ Identify 4 HTML files (unit3_task1_template.html through unit3_task4_template.html)
3. ✅ Open first file in current browser tab
4. ✅ Create 3 additional tabs and open remaining files
5. ✅ Verify all 4 tabs are open with correct content
6. ✅ Inform user all assignments are now viewable in separate tabs

**Result:**
- All 4 assignments visible in browser
- User can easily switch between tabs
- No unnecessary rendering steps
- Completed on first request

---

**Remember:** Templates are already rendered and live in `Templates/Unit_N/` directories. Simply open the HTML files in separate browser tabs. No rendering required!

