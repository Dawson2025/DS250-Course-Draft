# Policies Index - Slack Announcements

Quick reference to all policy announcements and course requirements from `#ds250_fa25_palmer`.

---

## Critical Policies

### AI Usage Citation (REQUIRED)
- **Announced**: October 2025, 1:06 PM
- **Author**: David Palmer
- **Status**: MANDATORY for all assignments using AI
- **Required Format**:
  > "I used _(AI tool name?)___ to complete the assignment. Specifically, I used it to ___(explain)___. Use of the AI had the following effect on my learning _____"
- **Impact**: All assignments using AI must include this statement
- **Entry**: `2025-10-XX-XXXXX-ai-citation-policy.md`

### Visualization Library Requirement
- **Announced**: October 2025, 8:58 AM
- **Author**: Ethan Saline (on behalf of instructor)
- **Status**: ENFORCED going forward
- **Requirement**: 
  - Must use `ggplot` from `lets_plot` library
  - Matplotlib NOT allowed for future assignments
  - Past assignments using Matplotlib are acceptable
- **Code Pattern**:
  ```python
  from lets_plot import *
  LetsPlot.setup_html(isolated_frame=True)
  ```
- **Impact**: All visualizations must use Lets-Plot ggplot syntax
- **Entry**: `2025-10-XX-XXXXX-visualization-requirement.md`

---

## Assignment Guidelines

### Report Format
- **Key Rule**: Use `head()` instead of printing entire datasets
- **Tool**: `sort_values()` for finding minimums/maximums
- **Announced**: October 2025, 4:38 PM
- **Purpose**: Prevent full dataset dumps in assignment reports

### Peer Evaluations
- **Multiple fixes documented**: System configuration issues resolved
- **Note**: If peer review doesn't work, may be because evaluation was already opened/started
- **Status**: Multiple iterations of fixes documented

---

## Submission Guidelines

### File Formats
- **Assignment Reports**: Quarto Markdown (`.qmd`) files rendered to HTML
- **Visualization**: Must use Lets-Plot (ggplot syntax)
- **Code Output**: Use `head()` for displaying results, not full datasets

### GitHub Integration
- **Timeline**: Students receive GitHub invitation via email
- **Action Required**: Accept invitation (check spam/clutter folders)
- **Repository**: https://github.com/byui-math-dept
- **Future**: Assignments will connect to GitHub (next week)

---

## Course Components

### Data Science Community Touch Points
- **Part of**: Grade guidance table in syllabus
- **Component**: Career Readiness Certification (required)
- **Reminder**: October 2025, 4:38 PM
- **Suggestion**: Dedicate weekend time to this aspect

---

## Policy Summary Table

| Policy | Status | Effective Date | Impact |
|--------|--------|----------------|--------|
| AI Citation Required | MANDATORY | Oct 2025 | All assignments |
| Lets-Plot Only | ENFORCED | Oct 2025 | Future assignments |
| Use head() not full print | GUIDELINE | Oct 2025 | All reports |
| GitHub Integration | PLANNED | Oct 2025 | Future workflow |

---

*This index provides quick reference to all course policies announced via Slack. For detailed announcements, see `ANNOUNCEMENTS.md` and individual entries.*

