# Project: [Your Project Name]

## Current Status
- **Phase:** Project Setup
- **Last Session:** [Date] - Initial project setup and CLAUDE.md creation
- **Next Steps:** Create Project PRD using @instruct/001_create-project-prd.md
- **Active Document:** None (starting workflow)
- **Current Feature:** N/A (project foundation phase)

## Quick Resume Commands
```bash
# Standard session start sequence
/compact
@CLAUDE.md
ls -la */

# Load project context (after Project PRD exists)
@prds/000_PPRD|[project-name].md
@adrs/000_PADR|[project-name].md

# Load current work area based on phase
@prds/      # For PRD work
@tdds/      # For TDD work  
@tids/      # For TID work
@tasks/     # For task execution
```

## Project Standards
*[This section will be populated from ADR - Technology Stack, Development Standards, Architecture Principles, etc.]*

**NOTE:** After creating the ADR using @instruct/002_create-adr.md, copy the generated "Project Standards" section here to replace this placeholder.

## AI Dev Tasks Framework Workflow

### Document Creation Sequence
1. **Project Foundation**
   - `000_PPRD|[project-name].md` → `/prds/` (Project PRD)
   - `000_PADR|[project-name].md` → `/adrs/` (Architecture Decision Record)
   - Update this CLAUDE.md with Project Standards from ADR

2. **Feature Development** (repeat for each feature)
   - `[###]_FPRD|[feature-name].md` → `/prds/` (Feature PRD)
   - `[###]_FTDD|[feature-name].md` → `/tdds/` (Technical Design Doc)
   - `[###]_FTID|[feature-name].md` → `/tids/` (Technical Implementation Doc)
   - `[###]_FTASKS|[feature-name].md` → `/tasks/` (Task List)

### Instruction Documents Reference
- `@instruct/001_create-project-prd.md` - Creates project vision and feature breakdown
- `@instruct/002_create-adr.md` - Establishes tech stack and standards
- `@instruct/003_create-feature-prd.md` - Details individual feature requirements
- `@instruct/004_create-tdd.md` - Creates technical architecture and design
- `@instruct/005_create-tid.md` - Provides implementation guidance and coding hints
- `@instruct/006_generate-tasks.md` - Generates actionable development tasks
- `@instruct/007_process-task-list.md` - Guides task execution and progress tracking

## Document Inventory

### Project Level Documents
- ❌ 000_PPRD|[project-name].md (Project PRD)
- ❌ 000_PADR|[project-name].md (Architecture Decision Record)

### Feature Documents
*[Add as features are identified and developed]*

**Example format:**
- ❌ 001_FPRD|Feature_A.md (Feature PRD)
- ❌ 001_FTDD|Feature_A.md (Technical Design Doc)
- ❌ 001_FTID|Feature_A.md (Technical Implementation Doc)
- ❌ 001_FTASKS|Feature_A.md (Task List)

### Status Indicators
- ✅ **Complete:** Document finished and reviewed
- ⏳ **In Progress:** Currently being worked on
- ❌ **Pending:** Not yet started
- 🔄 **Needs Update:** Requires revision based on changes

## Task Execution Standards

### Completion Protocol
- ✅ One sub-task at a time, ask permission before next
- ✅ Mark sub-tasks complete immediately: `[ ]` → `[x]`
- ✅ When parent task complete: Run tests → Stage → Clean → Commit → Mark parent complete
- ✅ Never commit without passing tests
- ✅ Always clean up temporary files before commit

### Commit Message Format
```bash
git commit -m "feat: [brief description]" -m "- [key change 1]" -m "- [key change 2]" -m "Related to [Task#] in [PRD]"
```

### Test Commands
*[Will be defined in ADR, examples:]*
- **Frontend:** `npm test` or `npm run test:unit`
- **Backend:** `pytest` or `python -m pytest` 
- **Full Suite:** `[project-specific command]`

## Code Quality Checklist

### Before Any Commit
- [ ] All tests passing
- [ ] No console.log/print debugging statements
- [ ] No commented-out code blocks
- [ ] No temporary files (*.tmp, .cache, etc.)
- [ ] Code follows project naming conventions
- [ ] Functions/methods have docstrings if required
- [ ] Error handling implemented per ADR standards

### File Organization Rules
*[Will be defined in ADR, examples:]*
- Place test files alongside source files: `Component.tsx` + `Component.test.tsx`
- Follow directory structure from ADR
- Use naming conventions: `[Feature][Type].extension`
- Import statements organized: external → internal → relative

## Context Management

### Session End Protocol
```bash
# 1. Update CLAUDE.md status section
# 2. Create session summary
/compact "Completed [specific accomplishments]. Next: [specific next action]."
# 3. Commit progress
git add .
git commit -m "docs: completed [task] - Next: [specific action]"
```

### Context Recovery (If Lost)
```bash
# Mild context loss
@CLAUDE.md
ls -la */
@instruct/[current-phase].md

# Severe context loss  
@CLAUDE.md
@prds/000_PPRD|[project-name].md
@adrs/000_PADR|[project-name].md
ls -la */
@instruct/
```

## Progress Tracking

### Task List Maintenance
- Update task list file after each sub-task completion
- Add newly discovered tasks as they emerge
- Update "Relevant Files" section with any new files created/modified
- Include one-line description for each file's purpose

### Status Indicators for Tasks
- `[ ]` = Not started
- `[x]` = Completed
- `[~]` = In progress (use sparingly, only for current sub-task)
- `[?]` = Blocked/needs clarification

### Session Documentation
After each development session, update:
- Current task position in this CLAUDE.md
- Any blockers or questions encountered
- Next session starting point
- Files modified in this session

## Implementation Patterns

### Error Handling
*[Will be defined in ADR - placeholder for standards]*
- Use project-standard error handling patterns from ADR
- Always handle both success and failure cases
- Log errors with appropriate level (error/warn/info)
- User-facing error messages should be friendly

### Testing Patterns
*[Will be defined in ADR - placeholder for standards]*
- Each function/component gets a test file
- Test naming: `describe('[ComponentName]', () => { it('should [behavior]', () => {})})`
- Mock external dependencies
- Test both happy path and error cases
- Aim for [X]% coverage per ADR standards

## Debugging Protocols

### When Tests Fail
1. Read error message carefully
2. Check recent changes for obvious issues
3. Run individual test to isolate problem
4. Use debugger/console to trace execution
5. Check dependencies and imports
6. Ask for help if stuck > 30 minutes

### When Task is Unclear
1. Review original PRD requirements
2. Check TDD for design intent
3. Look at TID for implementation hints
4. Ask clarifying questions before proceeding
5. Update task description for future clarity

## Feature Priority Order
*[Will be populated from Project PRD]*

**Placeholder - Update after Project PRD creation:**
1. [Feature A] (Core/MVP)
2. [Feature B] (Important)
3. [Feature C] (Future)

## Session History Log

### Session 1: [Date] - Project Initialization
- **Accomplished:** Created project structure, initial CLAUDE.md, began framework setup
- **Next:** Create Project PRD using @instruct/001_create-project-prd.md
- **Files Created:** CLAUDE.md, folder structure (prds/, adrs/, tdds/, tids/, tasks/, docs/, instruct/)
- **Duration:** [X hours]

*[Add new sessions as they occur]*

## Quick Reference

### Folder Structure
```
project-root/
├── CLAUDE.md                    # This file
├── adrs/                        # Architecture Decision Records
├── docs/                        # Additional documentation
├── instruct/                    # Framework instruction files
├── prds/                        # Product Requirements Documents
├── tasks/                       # Task Lists
├── tdds/                        # Technical Design Documents
└── tids/                        # Technical Implementation Documents
```

### File Naming Convention
- **Project Level:** `000_PPRD|ProjectName.md`, `000_PADR|ProjectName.md`
- **Feature Level:** `001_FPRD|FeatureName.md`, `001_FTDD|FeatureName.md`, etc.
- **Sequential:** Use 001, 002, 003... for features in priority order

### Emergency Contacts & Resources
- **Framework Documentation:** @instruct/000_README.md
- **Current Project PRD:** @prds/000_PPRD|[project-name].md (after creation)
- **Tech Standards:** @adrs/000_PADR|[project-name].md (after creation)

---

**Framework Version:** 1.0  
**Last Updated:** [Current Date]  
**Project Started:** [Start Date]