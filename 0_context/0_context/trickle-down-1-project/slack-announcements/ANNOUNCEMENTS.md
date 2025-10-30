# Slack Announcements Log - DS250 Fall 2025

Chronological log of all announcements from `#ds250_fa25_palmer` Slack channel.

---

## 2025-09-02

### Channel Created
- **Author**: David Palmer
- **Type**: System
- **Content**: Channel `#ds250_fa25_palmer` created
- **Entry**: See initial channel setup in entries directory

---

## 2025-09-XX (Early September)

### Welcome Message
- **Author**: David Palmer  
- **Time**: 12:39 PM
- **Type**: Announcement
- **Content**: "Welcome to the slack channel for Brother Palmer's DS250 class! :computer:"
- **Entry**: Not yet detailed

### Life Expectancy Dataset Introduction
- **Author**: David Palmer
- **Time**: 2:31 PM
- **Type**: Code Example
- **Content**: Shared code snippet for reading life expectancy CSV from URL
```python
import pandas as pd 
url = "https://byui-cse.github.io/cse110-course/lesson11/life-expectancy.csv"
df = pd.read_csv(url)
```
- **Entry**: See code examples index

### Week 2 Class 1 Code
- **Author**: David Palmer
- **Time**: 3:07 PM
- **Type**: Code Example
- **File**: `week2_class1.qmd` shared
- **Entry**: To be detailed

---

## 2025-10-XX (Mid-October)

### sort_values() Tool Reminder
- **Author**: David Palmer
- **Time**: 4:38 PM
- **Type**: Assignment Guidance
- **Content**: 
  - Reminder about `sort_values()` function for finding minimums/maximums
  - Important: Use `head()` instead of printing entire dataset in reports
  - Peer review troubleshooting request
- **Impact**: Common issue on assignments - students printing full datasets
- **Entry**: `2025-10-XX-XXXXX-sort-values-reminder.md`

### Peer Review Issue Resolution
- **Author**: David Palmer
- **Time**: 4:58 PM (reply)
- **Type**: System Fix
- **Content**: Peer evaluation fixed. If peer reviews don't work, likely because evaluation was already opened/started.
- **Note**: Will start peer reviews on Thursday (future)
- **Entry**: To be detailed

### Unit 1 Task 1 Question 5 Clarification
- **Author**: Mary Palmer (student question)
- **Time**: 1:25 PM
- **Type**: Q&A
- **Question**: How to find most common female name in Utah when dataset has no gender column?
- **Answer** (David Palmer, 1:32 PM): Use human judgment to scan sorted table and identify first predominantly female name from top results.
- **Impact**: Assignment clarification for Unit 1 Task 1
- **Entry**: `2025-10-XX-XXXXX-unit1-task1-q5-gender-clarification.md`

### Life Expectancy CSV File Attachment
- **Author**: David Palmer
- **Time**: 4:38 PM
- **Type**: Resource
- **Content**: 
  - Shared `life-expectancy.csv` file for students unable to read from URL
  - Instructions: Save in same folder as .qmd file, use `read.csv("life_expectancy.csv")`
  - File contains: Entity, Code, Year, Life expectancy (years) columns
- **Entry**: To be detailed

---

## 2025-10-XX (Late October)

### Starter Code for Class
- **Author**: David Palmer
- **Time**: 1:55 PM
- **Type**: Code Example
- **Content**: Standard imports and data reading setup
```python
import pandas as pd
import numpy as np
from lets_plot import *
LetsPlot.setup_html(isolated_frame=True)

url = "https://byui-cse.github.io/cse110-course/lesson11/life-expectancy.csv"
df = pd.read_csv(url)
```
- **Entry**: See code examples index

### Unit 1 Day 3 Code Shared
- **Author**: David Palmer
- **Time**: 2:56 PM
- **Type**: Code Example
- **File**: `Unit1_day3.qmd` (77 lines)
- **Entry**: To be detailed

### Custom Color Feature (Student Contribution)
- **Author**: Mary Palmer
- **Time**: 2:39 PM
- **Type**: Resource/Feature
- **Content**: Shared by Brian Walsh - custom color feature:
  - `+ scale_color_manual(values= ["#123"])` to add custom colors to ggplot
- **Entry**: To be detailed

### Color Picker Website Resource
- **Author**: David Palmer
- **Time**: 4:24 PM
- **Type**: Resource
- **Content**: 
  - Website: https://imagecolorpicker.com/
  - Allows uploading image/webpage/URL to get exact hex color codes
  - Useful for matching colors in visualizations
- **Entry**: `2025-10-XX-XXXXX-color-picker-resource.md`

### AI Citation Policy
- **Author**: David Palmer
- **Time**: 1:06 PM
- **Type**: Policy
- **Content**: Required citation format for AI usage:
  > "I used _(AI tool name?)___ to complete the assignment. Specifically, I used it to ___(explain)___. Use of the AI had the following effect on my learning _____"
- **Impact**: CRITICAL - All assignments must include this if AI was used
- **Entry**: `2025-10-XX-XXXXX-ai-citation-policy.md`

### Unit 2 Task 1 Class Demo Code
- **Author**: David Palmer
- **Time**: 3:03 PM
- **Type**: Code Example
- **File**: `unit2_task1_class_demo.qmd` (124 lines)
- **Content**: Demo code for SQL batting average queries
- **Note**: "You will have to find the table within the SQL database that allows you to calculate the batting average."
- **Entry**: To be detailed

### Visualization Library Requirement
- **Author**: Ethan Saline
- **Time**: 8:58 AM
- **Type**: Policy Enforcement
- **Content**: 
  - Many students using Matplotlib instead of Lets-Plot
  - Requirement: Must use `ggplot` from `lets_plot` library going forward
  - Past assignments acceptable, future assignments must use ggplot
- **Impact**: CRITICAL - Visualization standard for all future work
- **Entry**: `2025-10-XX-XXXXX-visualization-requirement.md`

### JSON/UFO Sightings Example
- **Author**: David Palmer
- **Time**: 2:18 PM
- **Type**: Code Example
- **Content**: Code for reading JSON data:
  - URL: `https://byuistats.github.io/DS250-Course/Skill%20Builders/json_missing.json`
  - Uses `pd.read_json(url)`
- **Entry**: See code examples index

### Unit 2 Task 2 Code Shared
- **Author**: David Palmer
- **Time**: 3:02 PM (reply)
- **Type**: Code Example
- **File**: `units2_task2.qmd` (84 lines)
- **Entry**: To be detailed

### Week 4 Peer Evaluation Fix
- **Author**: David Palmer
- **Time**: 12:14 PM
- **Type**: System Fix
- **Content**: Week 4 peer evaluation reconfigured - students can now complete it
- **Entry**: To be detailed

### GitHub Repository Invitation
- **Author**: David Palmer
- **Time**: 11:39 AM
- **Type**: Announcement
- **Content**: 
  - Students will receive GitHub invitation email (check spam/clutter)
  - Accept invite when received
  - Will connect assignments to GitHub next week
  - Repository: https://github.com/byui-math-dept
- **Entry**: `2025-10-XX-XXXXX-github-invitation.md`

### GitHub Desktop Login Fix
- **Author**: Emily Hatch
- **Time**: 2:47 PM
- **Type**: Technical Tip
- **Content**: After being added to Math Department GitHub, need to log out and back into GitHub Desktop app
- **Entry**: To be detailed

### Data Science Community Touch Points Reminder
- **Author**: David Palmer
- **Time**: 4:38 PM
- **Type**: Assignment Reminder
- **Content**: 
  - Part of grade guidance table in syllabus
  - Career Readiness Certification required component
  - Suggested working on it over weekend
- **Entry**: To be detailed

### Project 3 Day 1 Starter File
- **Author**: David Palmer
- **Time**: 2:03 PM
- **Type**: Code Example
- **File**: `P3_day1_flights_student_starter_file.qmd` (69 lines)
- **Entry**: To be detailed

### Unit 3 Day 1 Class Code
- **Author**: David Palmer
- **Time**: 3:36 PM
- **Type**: Code Example
- **File**: `unit3_day1_class_code.qmd` (133 lines)
- **Entry**: To be detailed

### P2B Conference Invitation
- **Author**: David Palmer
- **Time**: 8:14 AM
- **Type**: Announcement
- **Content**: 
  - P2B conference on November 7
  - Career Certified students get FREE ticket
  - Conference website for more info
- **Entry**: To be detailed

### Column Filtering Question (Student)
- **Author**: Kimber Zatylny
- **Time**: 8:39 PM
- **Type**: Q&A
- **Content**: Student asking how to filter/select columns after merging tables
- **Status**: No answer recorded yet
- **Entry**: To be detailed

---

## Announcement Categories

### Code Examples Shared
- `week2_class1.qmd`
- `Unit1_day3.qmd`
- `unit2_task1_class_demo.qmd`
- `units2_task2.qmd`
- `unit3_day1_class_code.qmd`
- `P3_day1_flights_student_starter_file.qmd`

### Policy Announcements
- AI Citation Policy (REQUIRED format provided)
- Visualization Library Requirement (ggplot from lets_plot, not Matplotlib)

### Assignment Clarifications
- Unit 1 Task 1, Question 5: Gender identification from name list
- sort_values() reminder with head() instead of full print

### Resources Shared
- Life expectancy CSV file
- Color picker website (imagecolorpicker.com)
- Custom color feature (`scale_color_manual`)

### Technical Issues Resolved
- Peer review system fixes (multiple instances)
- GitHub Desktop login requirement after organization join

---

*This log is maintained to track all important communications from the Slack channel. Each detailed entry should be created in the `entries/` directory.*

