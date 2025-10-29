# Code Examples Index - Slack Announcements

Quick reference index of all code examples and files shared in `#ds250_fa25_palmer` Slack channel.

---

## Class Code Files (Chronological)

### Week 2, Class 1
- **File**: `week2_class1.qmd`
- **Shared**: Early September 2025, 3:07 PM
- **Author**: David Palmer
- **Lines**: 120
- **Entry**: To be detailed

### Unit 1, Day 3
- **File**: `Unit1_day3.qmd`
- **Shared**: October 2025, 2:56 PM
- **Author**: David Palmer
- **Lines**: 77
- **Entry**: To be detailed

### Unit 2, Task 1 Demo
- **File**: `unit2_task1_class_demo.qmd`
- **Shared**: October 2025, 3:03 PM
- **Author**: David Palmer
- **Lines**: 124
- **Content**: SQL batting average queries demonstration
- **Note**: "You will have to find the table within the SQL database that allows you to calculate the batting average."
- **Entry**: To be detailed

### Unit 2, Task 2
- **File**: `units2_task2.qmd`
- **Shared**: October 2025, 3:02 PM (reply)
- **Author**: David Palmer
- **Lines**: 84
- **Entry**: To be detailed

### Unit 3, Day 1
- **File**: `unit3_day1_class_code.qmd`
- **Shared**: October 2025, 3:36 PM
- **Author**: David Palmer
- **Lines**: 133
- **Entry**: To be detailed

### Project 3, Day 1 Starter
- **File**: `P3_day1_flights_student_starter_file.qmd`
- **Shared**: October 2025, 2:03 PM
- **Author**: David Palmer
- **Lines**: 69
- **Entry**: To be detailed

---

## Code Snippets

### Life Expectancy Dataset
```python
import pandas as pd 
url = "https://byui-cse.github.io/cse110-course/lesson11/life-expectancy.csv"
df = pd.read_csv(url)
```
- **Shared**: September 2025, 2:31 PM
- **Variation**: Can use local file `read.csv("life_expectancy.csv")` if URL fails
- **Dataset**: Entity, Code, Year, Life expectancy (years)

### Standard Starter Code
```python
import pandas as pd
import numpy as np
from lets_plot import *

LetsPlot.setup_html(isolated_frame=True)

url = "https://byui-cse.github.io/cse110-course/lesson11/life-expectancy.csv"
df = pd.read_csv(url)
# pd.read_csv("life_expectancy.csv") #as long the file is in the same folder
```
- **Shared**: October 2025, 1:55 PM
- **Usage**: Standard imports and setup for class work

### JSON Data Reading
```python
import pandas as pd 
import numpy as np
from lets_plot import *
LetsPlot.setup_html(isolated_frame=True)

# UFO Sightings
url = "https://byuistats.github.io/DS250-Course/Skill%20Builders/json_missing.json"
df2 = pd.read_json(url)
```
- **Shared**: October 2025, 2:18 PM
- **Purpose**: Demonstrate JSON data reading with pandas
- **Dataset**: UFO sightings data

---

## Code Tips & Features

### Custom Colors in ggplot
```python
+ scale_color_manual(values= ["#123"])
```
- **Shared**: October 2025, 2:39 PM
- **Contributor**: Mary Palmer (feature discovered by Brian Walsh)
- **Purpose**: Add custom colors to Lets-Plot visualizations

### sort_values() Reminder
- **Function**: `sort_values()` for finding minimums/maximums
- **Important**: Use `head()` instead of printing entire dataset
- **Shared**: October 2025, 4:38 PM

---

## Quick Reference

| Topic | File/Link | Author | Date |
|-------|-----------|--------|------|
| Life Expectancy | URL or CSV file | David Palmer | Sep 2025 |
| Standard Setup | Starter code snippet | David Palmer | Oct 2025 |
| JSON Data | `json_missing.json` | David Palmer | Oct 2025 |
| Unit 1 Code | `Unit1_day3.qmd` | David Palmer | Oct 2025 |
| Unit 2 Task 1 | `unit2_task1_class_demo.qmd` | David Palmer | Oct 2025 |
| Unit 2 Task 2 | `units2_task2.qmd` | David Palmer | Oct 2025 |
| Unit 3 Code | `unit3_day1_class_code.qmd` | David Palmer | Oct 2025 |
| Project 3 | `P3_day1_flights_student_starter_file.qmd` | David Palmer | Oct 2025 |

---

*This index is maintained to provide quick reference to code examples shared in Slack. For detailed content, see individual entries in `entries/` directory.*

