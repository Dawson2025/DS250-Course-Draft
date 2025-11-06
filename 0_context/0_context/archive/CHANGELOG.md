# 0_context Change Log

Complete chronological record of changes to:
- **The 0_context documentation system itself** (structure, organization, meta-documentation)
- **Trickle-down levels < 1** (Level 0, 0.5, 0.75 - universal and environment documentation)

**Note**: Project-level changes (Level 1, 2, 3) are documented in their respective trickle-down folders. See `trickle-down-1-project/PROJECT_CHANGELOG.md` for project content changes.

## [2025-10-31]

### [Modified] - Universal Instructions Require Per-Turn Git Commit
**Type**: Level 0 Change  
- **Entry**: `entries/2025-10-31-121500-universal-instructions-mandatory-commit.md`  
- **Summary**: Added Section 7b to the universal instructions mandating that every AI agent turn ends with documentation updates and a best-practice git commit.

## [2025-10-30]

### [Added] - Analysis Must Match Rendered Visuals Rule
**Type**: Project Doc Update (Level 1)
- **Entry**: `entries/2025-10-30-065500-analysis-must-match-visuals.md`
- **Summary**: Documented the requirement that written analysis in course materials can only reference information visible within the rendered Quarto output (tables, charts, statistics).

---

## [2025-10-29]

### [Documented] - Unit 2 Assignment 3 Lets-Plot Fix
**Type**: Project Doc Update (Level 2)
- **Entry**: `entries/2025-10-30-064000-unit2-assignment3-graph-verification.md`
- **Summary**: Recorded the Yankees vs Red Sox line chart fix, explicit color scale, and Playwright screenshot fallback while chrome-devtools MCP remains unstable.

### [Reorganized] - Archive System Reorganization  
**Type**: System Change (Archive System)
- **Entry**: `entries/2025-10-29-211500-archive-system-reorganization.md`
- **Summary**: Reorganized archive to focus on 0_context system and Level < 1 changes only. Project changes moved to trickle-down folders. Archive entries now lightweight references.

### [Reorganized] - Unified Trickle-Down Documentation Structure  
**Type**: System Change (0_context structure)
- **Entry**: `entries/2025-10-29-210000-unified-trickle-down-structure.md`
- **Files Moved**: 
  - All levels moved to top-level with "trickle-down-" prefix
  - Removed nested `1_trickle_down/` directory structure
  - `0_universal_instructions/` → `trickle-down-0-universal-instructions/`
  - `0.75_universal_tools/` → `trickle-down-0.75-universal-tools/`
  - All `1_trickle_down/trickle-down-*` folders moved to top level
- **Files Modified**:
  - All documentation references updated to new unified paths
  - README.md updated with new structure
  - Cross-references fixed throughout
- **Summary**: Merged two parallel trickle-down systems into one unified structure. All documentation now uses consistent "trickle-down-" prefix naming at the top level. Removed nested `1_trickle_down/` directory. All levels (0, 0.5, 0.75, 1, 1.5, 2, 3) now at same hierarchical level with consistent naming.

### [Reorganized] - Documentation Structure Aligned by Trickle-Down Level  
**Type**: System Change (0_context structure)
- **Entry**: `entries/2025-10-29-200000-documentation-reorganization-by-trickle-down-level.md`
- **Files Moved**: 
  - Level 0: Consolidated `trickle-down-0-universal/` → `0_universal_instructions/`
  - Level 0.5: Moved `0.5_setup/*` → `trickle-down-0.5-environment/`
- **Files Modified**:
  - All documentation references updated to new paths
  - README files updated
  - Internal cross-references fixed
- **Summary**: Reorganized all documentation to proper trickle-down levels. Level 0 (Universal) consolidated into `0_universal_instructions/`. Level 0.5 (Environment) consolidated into `trickle-down-0.5-environment/`. All references updated. Duplicate structures eliminated. Each documentation level now has single authoritative location.

### [Reorganized] - Setup Tools Moved to 0_context and Quarto dotenv Fix  
**Type**: Level 0.5 Change
- **Entry**: `entries/2025-10-29-190000-moved-setup-tools-to-0-context-and-fixed-quarto-dotenv.md`
- **Files Moved**: 
  - `tools/canvas_authenticate.py` → `0_context/.../setup-scripts/canvas_authenticate.py`
  - `tools/setup_env_secure.sh` → `0_context/.../setup-scripts/setup_env_secure.sh`
- **Files Modified**:
  - `_quarto.yml` (added profiles.dotenv.allowEmptyValues: true)
  - `canvas-authentication-setup.md` (updated paths)
  - Archive entries (updated references)
- **Summary**: Moved Canvas authentication and .env setup tools to setup-scripts directory within 0_context environment section. Fixed Quarto preview error by configuring dotenv to allow empty values for optional Canvas credentials. Updated all path references in moved files and documentation.

### Note on Project-Level Changes

**Project-level changes** (Level 1, 2, 3) are now documented in their respective trickle-down folders:
- **Unit_2 changes**: See `trickle-down-2-features/templates/unit-2-changes/` and `trickle-down-1-project/PROJECT_CHANGELOG.md`
- **Project changelog**: See `trickle-down-1-project/PROJECT_CHANGELOG.md` for all project content changes

### [Added] - Archive System Implementation
- **Entry**: `entries/2025-10-29-154230-archive-system-implementation.md`
- **Files**: 
  - `archive/README.md` (new)
  - `archive/CHANGELOG.md` (new)
  - `1_trickle_down/trickle-down-0-universal/universal_instructions.md` (modified)
- **Summary**: Created archive system to track all changes to 0_context documentation. Updated universal instructions to require archiving all changes.

### [Modified] - Universal Instructions: Archive Requirement Added
- **Entry**: `entries/2025-10-29-154500-universal-instructions-archive-requirement.md`
- **Files**: 
  - `1_trickle_down/trickle-down-0-universal/universal_instructions.md`
- **Summary**: Added Principle #7 requiring documentation updates and archiving before ending each AI agent turn.

### [Modified] - Universal Instructions: Archiving Integration Details
- **Entry**: `entries/2025-10-29-154938-universal-instructions-archiving-integration.md`
- **Files**: 
  - `1_trickle_down/trickle-down-0-universal/universal_instructions.md`
- **Summary**: Enhanced Principle #7 and workflow sections with detailed archive system requirements, file paths, formats, and mandatory checklist items for complete archiving integration.


---

*This changelog is maintained automatically as part of the archive system requirements.*
