---
title: "Unit 2 Assignment 3 – Simple Yankees/Red Sox Salary Comparison"
date: 2025-10-30 06:35:00
level: 2
type: bugfix
related_templates:
  - Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd
verification:
  - Rendered template to HTML with Quarto (`quarto render Templates/Unit_2/assignment_3/unit2_task3_validation_template.qmd`)
  - Captured screenshot via Playwright fallback (`verification/unit2_task3_validation_template_playwright.png`)
notes:
  - Chrome DevTools MCP currently failing to stay connected; Playwright MCP (direct Python call) used for visual confirmation.
---

## Summary

Simplified the Unit 2 Assignment 3 validation template by summarizing Yankees vs Red Sox salaries by decade (1980s–2010s). This keeps the graph minimal (four grouped bars) while still showing how the teams diverged in each era. The fix still includes the earlier `NYA` team ID correction and now prints a decade-level gap table so students see the exact numeric differences.

## Changes

- Updated salary filter to `['NYA', 'BOS']` and merged names on `['teamID', 'yearID']`.
- Replaced time-series line chart with a grouped bar chart of average salary by decade.
- Added per-decade salary gap summary table so differences are explicit.
- Confirmed Quarto render succeeds after change (Canvas env vars spoofed locally).
- Exported reference screenshot with Playwright because chrome-devtools MCP is still unstable (`verification/unit2_task3_validation_template_playwright.png`).

## Follow-up

- Chrome DevTools MCP still closes immediately despite Chrome binary installation. Continue diagnostics separately before relying on it for verification workflows.
