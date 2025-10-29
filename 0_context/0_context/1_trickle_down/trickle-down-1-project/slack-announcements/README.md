# Slack Announcements Tracking System

## Purpose

This system tracks all announcements, code examples, and important communications from the DS250 Fall 2025 Slack channel (`#ds250_fa25_palmer`) to ensure AI agents and course maintainers have access to:

- Class announcements and policy updates
- Code examples shared by the instructor
- Student questions and answers
- Course material clarifications
- Assignment instructions and changes

## Structure

```
slack-announcements/
├── README.md              # This file - system documentation
├── ANNOUNCEMENTS.md       # Chronological log of all announcements
├── entries/               # Individual detailed announcement entries
│   ├── YYYY-MM-DD-HHMMSS-description.md
│   └── ...
└── index/                 # Categorized index for quick reference
    ├── code-examples.md    # All shared code files indexed
    ├── policies.md        # Policy announcements
    ├── assignments.md     # Assignment-related announcements
    └── q-and-a.md         # Questions and answers
```

## Channel Information

- **Channel Name**: `#ds250_fa25_palmer`
- **Channel ID**: `C09D601NET0`
- **Workspace/Team ID**: `T76BPT8UT`
- **Instructor**: David Palmer
- **Academic Term**: Fall 2025
- **Course**: DS 250 - Data Science Programming

## How to Use

### Adding New Announcements

When a new announcement is received from Slack:

1. **Create an entry file** in `entries/` with format: `YYYY-MM-DD-HHMMSS-description.md`
2. **Update ANNOUNCEMENTS.md** with a summary entry
3. **Update relevant index files** if applicable (code examples, policies, etc.)
4. **Tag by category**: Code, Policy, Assignment, Q&A, Resource

### Entry Template

Each announcement entry should include:
- Date and time (if available)
- Author (usually David Palmer, but note if student)
- Type (announcement, code example, Q&A, resource)
- Content (full text or summary with key points)
- Relevant files/links
- Impact on course materials or assignments
- Related announcements

### Categories

- **Code Examples**: Class code files, starter templates
- **Policies**: AI usage, visualization requirements, submission guidelines
- **Assignments**: Task clarifications, common issues, due dates
- **Resources**: Links to external resources, tools, websites
- **Q&A**: Student questions and instructor responses

## Quick Reference

- **AI Citation Policy**: See entry `2025-10-XX-XXXXX-ai-citation-policy.md`
- **Visualization Requirement**: Use `ggplot` from `lets_plot`, not Matplotlib
- **Code Files**: See `index/code-examples.md` for all shared code files

## Future Enhancement

Future system may include automated Slack integration to pull announcements directly while maintaining security of authentication credentials.

