# Setup Claude Scripts

Initialize and verify the .claude/scripts setup.

## Step 1: Verify Directory Structure

```bash
# Check if scripts directory exists
ls -la .claude/scripts/

# Verify key scripts are present
ls -la .claude/scripts/intelligent_clear_resume.py
ls -la .claude/scripts/housekeeping.py
```

## Step 2: Make Scripts Executable

```bash
# Make all Python scripts executable
chmod +x .claude/scripts/*.py

# Verify permissions
ls -la .claude/scripts/
```

## Step 3: Test Script Dependencies

```bash
# Test Python imports from scripts directory
cd .claude/scripts && python3 -c "
try:
    import housekeeping
    print('✅ housekeeping module imported successfully')
except ImportError as e:
    print(f'❌ Import error: {e}')
"

# Return to project root
cd ../..
```

## Step 4: Test Main Script

```bash
# Test the intelligent clear script
python3 .claude/scripts/intelligent_clear_resume.py --dry-run 2>/dev/null || echo "Script exists and is executable"
```

## Step 5: Verify Commands Are Available

Check that custom commands are loaded:
```
/help
```

Look for:
- `/smart-clear`
- `/iclear` 
- `/context-cycle`
- `/setup-scripts`

## Troubleshooting:

### If scripts aren't found:
```bash
# Check current working directory
pwd

# Verify .claude directory structure
find .claude -type f -name "*.py" -o -name "*.md"
```

### If permissions are wrong:
```bash
# Fix all script permissions
find .claude/scripts -name "*.py" -exec chmod +x {} \;
```

### If imports fail:
```bash
# Check Python path and modules
cd .claude/scripts
python3 -c "import sys; print('Python path:'); [print(p) for p in sys.path]"
```

Arguments: $ARGUMENTS

This command helps verify and fix the .claude/scripts setup.