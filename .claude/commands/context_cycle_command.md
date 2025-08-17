# Complete Context Cycle

Perform intelligent context preservation, clearing, and resumption in one workflow.

## Phase 1: Capture Context

```bash
# Run intelligent clear system
python3 .claude/scripts/intelligent_clear_resume.py
```

Wait for the script to complete and display the resume commands.

## Phase 2: Clear Session

Now execute:
```
/clear
```

## Phase 3: Immediate Resume

Execute the resume commands that were displayed (they're also saved in RESUME_COMMANDS.txt):

```bash
# 🚀 INSTANT RESUME - Session [ID]

# 1. Load core project context
@CLAUDE.md
@tasks/001_FTASKS|Phase1_Integrated_System.md
@adrs/000_PADR|bin2nlp.md

# 2. Load session resume script
@.housekeeping/resume_[SESSION_ID].md

# 3. Check current status
ls -la src/
git status

# 4. Quick project overview
/compact

# ✅ READY TO CONTINUE!
```

## What This Accomplishes:

1. **🧠 Intelligent Analysis** - Auto-detects current work context
2. **📸 Complete Snapshot** - Captures all session state and progress  
3. **🗃️ Archive Creation** - Preserves transcript for learning
4. **🚀 Instant Resume** - Generates copy-paste commands for immediate recovery
5. **📝 Documentation** - Updates CLAUDE.md with checkpoint
6. **🔄 Clean Cycle** - Fresh context with preserved memory

## Manual Resume (if needed):

If automatic resume fails:
```bash
@.housekeeping/QUICK_RESUME.md
```

Or step-by-step:
```bash
@CLAUDE.md
git status
ls -la tasks/
@tasks/[current-task-file].md
```

Arguments: $ARGUMENTS

This creates a complete cycle: capture → clear → resume with zero context loss.