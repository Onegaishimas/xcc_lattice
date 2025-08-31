# Project: [Your Project Name]

## Current Status
- **Phase:** Project Setup
- **Last Session:** [Date] - Initial project setup and CLAUDE.md creation
- **Next Steps:** Create Project PRD using @!xcc/instruct/001_create-project-prd.md
- **Active Document:** None (starting workflow)
- **Current Feature:** N/A (project foundation phase)

## Quick Resume Commands
```bash
# Enhanced XCC session start sequence
"Please help me resume where I left off"
# Or manual if needed:
@CLAUDE.md
@0xcc/session_state.json
ls -la 0xcc/*/

# Research integration (when ref MCP server available)
# Format: "Use /mcp ref search '[context-specific search term]'"

# Load project context (after Project PRD exists)
@!xcc/prds/000_PPRD|[project-name].md
@!xcc/adrs/000_PADR|[project-name].md

# Load current work area based on phase
@!xcc/prds/      # For PRD work
@!xcc/tdds/      # For TDD work  
@!xcc/tids/      # For TID work
@!xcc/tasks/     # For task execution
```

## Housekeeping Commands
```bash
"Please create a checkpoint"        # Save complete state
"Please help me resume"            # Restore context for new session
"My context is getting too large"  # Clean context, restore essentials
"Please save the session transcript" # Save session transcript
"Please show me project status"    # Display current state
```

## Project Standards
*[This section will be populated from ADR - Technology Stack, Development Standards, Architecture Principles, etc.]*

**NOTE:** After creating the ADR using @!xcc/instruct/002_create-adr.md, copy the generated "Project Standards" section here to replace this placeholder.

## AI Dev Tasks Framework Workflow

### Document Creation Sequence
1. **Project Foundation**
   - `000_PPRD|[project-name].md` → `!xcc/prds/` (Project PRD)
   - `000_PADR|[project-name].md` → `!xcc/adrs/` (Architecture Decision Record)
   - Update this CLAUDE.md with Project Standards from ADR

2. **Feature Development** (repeat for each feature)
   - `[###]_FPRD|[feature-name].md` → `!xcc/prds/` (Feature PRD)
   - `[###]_FTDD|[feature-name].md` → `!xcc/tdds/` (Technical Design Doc)
   - `[###]_FTID|[feature-name].md` → `!xcc/tids/` (Technical Implementation Doc)
   - `[###]_FTASKS|[feature-name].md` → `!xcc/tasks/` (Task List)

### Instruction Documents Reference
- `@!xcc/instruct/001_create-project-prd.md` - Creates project vision and feature breakdown
- `@!xcc/instruct/002_create-adr.md` - Establishes tech stack and standards
- `@!xcc/instruct/003_create-feature-prd.md` - Details individual feature requirements
- `@!xcc/instruct/004_create-tdd.md` - Creates technical architecture and design
- `@!xcc/instruct/005_create-tid.md` - Provides implementation guidance and coding hints
- `@!xcc/instruct/006_generate-tasks.md` - Generates actionable development tasks
- `@!xcc/instruct/007_process-task-list.md` - Guides task execution and progress tracking
- `@!xcc/instruct/008_housekeeping.md` - Session management and context preservation

## Document Inventory

### Project Level Documents
- ❌ !xcc/prds/000_PPRD|[project-name].md (Project PRD)
- ❌ !xcc/adrs/000_PADR|[project-name].md (Architecture Decision Record)

### Feature Documents
*[Add as features are identified and developed]*

**Example format:**
- ❌ !xcc/prds/001_FPRD|Feature_A.md (Feature PRD)
- ❌ !xcc/tdds/001_FTDD|Feature_A.md (Technical Design Doc)
- ❌ !xcc/tids/001_FTID|Feature_A.md (Technical Implementation Doc)
- ❌ !xcc/tasks/001_FTASKS|Feature_A.md (Task List)

### Status Indicators
- ✅ **Complete:** Document finished and reviewed
- ⏳ **In Progress:** Currently being worked on
- ❌ **Pending:** Not yet started
- 🔄 **Needs Update:** Requires revision based on changes

## Housekeeping Status
- **Last Checkpoint:** [Date/Time] - [Brief description]
- **Last Transcript Save:** [Date/Time] - [File location in !xcc/transcripts/]
- **Context Health:** Good/Moderate/Needs Cleanup
- **Session Count:** [Number] sessions since project start
- **Total Development Time:** [Estimated hours]

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
- Framework files in `!xcc/` directory, project files in standard locations

## Context Management

### Session End Protocol
```bash
# 1. Update CLAUDE.md status section
# 2. Create session summary
"Please create a checkpoint"
# 3. Commit progress
git add .
git commit -m "docs: completed [task] - Next: [specific action]"
```

### Context Recovery (If Lost)
```bash
# Mild context loss
@CLAUDE.md
@0xcc/session_state.json
ls -la 0xcc/*/
@!xcc/instruct/[current-phase].md

# Severe context loss  
@CLAUDE.md
@!xcc/prds/000_PPRD|[project-name].md
@!xcc/adrs/000_PADR|[project-name].md
ls -la 0xcc/*/
@!xcc/instruct/
```

### Resume Commands for Next Session
```bash
# Standard resume sequence
"Please help me resume where I left off"
# Or manual if needed:
@CLAUDE.md
@0xcc/session_state.json
@[specific-file-currently-working-on]
# Specific next action: [detailed action]
```

## Progress Tracking

### Task List Maintenance
- Update task list file after each sub-task completion
- Add newly discovered tasks as they emerge
- Update "Relevant Files" section with any new files created/modified
- Include one-line description for each file's purpose
- Distinguish between framework files (!xcc/) and project files (src/, tests/, etc.)

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
- Files modified in this session (both !xcc/ and project files)

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
- **Next:** Create Project PRD using @!xcc/instruct/001_create-project-prd.md
- **Files Created:** CLAUDE.md, !xcc/ folder structure
- **Duration:** [X hours]

*[Add new sessions as they occur]*

## Research Integration

### MCP Research Support
When available, the framework supports research integration via:
```bash
# Use MCP ref server for contextual research
/mcp ref search "[context-specific query]"

# Research is integrated into all instruction documents as option B
# Example: "🔍 Research first: Use /mcp ref search 'MVP development timeline'"
```

### Research History Tracking
- Research queries and findings captured in session transcripts
- Key research decisions documented in session state
- Research context preserved across sessions for consistency

## Quick Reference

### !xcc Folder Structure
```
project-root/
├── CLAUDE.md                       # This file (project memory)
├── !xcc/                           # XCC Framework directory
│   ├── adrs/                       # Architecture Decision Records
│   ├── docs/                       # Additional documentation
│   ├── instruct/                   # Framework instruction files
│   ├── prds/                       # Product Requirements Documents
│   ├── tasks/                      # Task Lists
│   ├── tdds/                       # Technical Design Documents
│   ├── tids/                       # Technical Implementation Documents
│   ├── transcripts/                # Session transcripts
│   ├── checkpoints/                # Automated state backups
│   ├── scripts/                    # Optional automation scripts
│   ├── session_state.json          # Current session tracking
│   └── research_context.json       # Research history and context
├── src/                            # Your project code
├── tests/                          # Your project tests
└── README.md                       # Project README
```

### File Naming Convention
- **Project Level:** `000_PPRD|ProjectName.md`, `000_PADR|ProjectName.md`
- **Feature Level:** `001_FPRD|FeatureName.md`, `001_FTDD|FeatureName.md`, etc.
- **Sequential:** Use 001, 002, 003... for features in priority order
- **Framework Files:** All in `!xcc/` directory for clear organization
- **Project Files:** Standard locations (src/, tests/, package.json, etc.)

### Emergency Contacts & Resources
- **Framework Documentation:** @!xcc/instruct/000_README.md
- **Current Project PRD:** @!xcc/prds/000_PPRD|[project-name].md (after creation)
- **Tech Standards:** @!xcc/adrs/000_PADR|[project-name].md (after creation)
- **Housekeeping Guide:** @!xcc/instruct/008_housekeeping.md

---

**Framework Version:** 1.1 (with !xcc organization)  
**Last Updated:** [Current Date]  
**Project Started:** [Start Date]  
**Structure:** !xcc framework with MCP research integration support