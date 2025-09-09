---
name: update-repo
description: Stages changes, creates a detailed commit with conventional format, and pushes to remote repository
examples:
  - "Update repo after completing feature work"
  - "Push latest documentation updates"
  - "Commit and push bug fixes"
---

# /update-repo - Git Add, Commit, and Push with Detailed Comments

## Quick Action

Stages all changes, creates a detailed commit, and pushes to remote.

## Workflow Steps

### 1. Check Current Status

```bash
git status
git diff --name-only
```

### 2. Stage Changes

```bash
git add .
```

### 3. Create Detailed Commit

Use conventional commit format:

```bash
git commit -m "type(scope): brief description

- Detailed change 1
- Detailed change 2
- Key impact or purpose

Closes #issue-number (if applicable)"
```

### 4. Push to Remote

```bash
git push origin main
```

## Commit Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **refactor**: Code refactoring
- **test**: Adding tests
- **chore**: Maintenance tasks

## What This Command Does

- Provides structured git workflow
- Ensures conventional commit format
- Creates detailed commit messages
- Maintains clean git history
- Pushes changes to remote repository

## Integration with Project Context

After running this command, update:

```text
@CLAUDE.md (Current Status section)
@.claude/context/health/dashboard.md (if significant changes)
```
