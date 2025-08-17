# Intelligent Clear (iClear)

Run the intelligent context clearing system and then immediately clear the session.

Execute the intelligent clear script and process the output:

```bash
# Run the intelligent clear script
.claude/scripts/intelligent_clear_resume.py

# Display the resume commands file for easy copying
echo "📋 Resume commands:"
cat RESUME_COMMANDS.txt

echo ""
echo "🎯 Quick resume available at:"
echo "@.housekeeping/QUICK_RESUME.md"

echo ""
echo "✅ Ready to clear context. Use /clear when ready."
```

## Post-Clear Instructions:

After using `/clear`, paste these commands to resume:

```bash
# Load the quick resume commands
@.housekeeping/QUICK_RESUME.md

# Or manually load core context
@CLAUDE.md
@tasks/001_FTASKS|Phase1_Integrated_System.md  
@adrs/000_PADR|bin2nlp.md
```

Arguments: $ARGUMENTS

This command will:
1. Execute the intelligent clear script
2. Display resume commands for copying
3. Prepare you for using `/clear`
4. Provide quick resume instructions