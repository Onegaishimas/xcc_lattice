# Smart Context Clear and Resume

Execute the intelligent context clearing system with automatic resumption setup.

## Step 1: Run the Intelligent Clear Script

```bash
python3 .claude/scripts/intelligent_clear_resume.py
```

## Step 2: Copy the Resume Commands

The script will output resume commands. Copy them for use after `/clear`.

## Step 3: Clear Context

Once you have the resume commands, use:
```
/clear
```

## Step 4: Restore Context

Paste the resume commands that were generated in Step 1.

---

## What This Does:

1. 🧠 **Auto-detect** current project context and phase
2. 📸 **Capture** complete session snapshot with git state  
3. 📚 **Archive** current transcript for learning
4. 🎯 **Generate** instant resume commands
5. 📝 **Update** CLAUDE.md with checkpoint information
6. 🚀 **Create** quick resume script for immediate context recovery

## Troubleshooting:

If the script fails:
```bash
# Check if script exists in new location
ls -la .claude/scripts/intelligent_clear_resume.py

# Check if housekeeping module exists
ls -la .claude/scripts/housekeeping.py

# Check Python path
which python3

# Run with explicit path if needed
/usr/bin/python3 .claude/scripts/intelligent_clear_resume.py

# Check dependencies from script directory
cd .claude/scripts && python3 -c "import housekeeping; print('✅ Housekeeping module found')"
```

## Usage Notes:

Arguments passed: $ARGUMENTS

- `/smart-clear` - Auto-detect and clear context
- `/smart-clear with-notes` - Include additional notes in snapshot

The script outputs instant resume commands for copy-paste after `/clear`.