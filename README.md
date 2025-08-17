# XCC Framework

## Quick Setup: From Template to Your Project

### Prerequisites
- Git installed
- GitHub account
- **VS Code with Claude Code extension** (Primary development environment)
- Node.js (for optional automation scripts and MCP servers)

---

## Enhanced Features

### 🗂️ Organized Structure
All framework files are now organized under the `!xcc/` directory, providing:
- **Clean separation** between framework and project files
- **Easy navigation** with `!` prefix sorting to top of file explorer
- **Portable framework** that can be easily updated or copied

### 🔍 Research Integration
The framework includes contextual research suggestions in all decision points via MCP server integration:
- **Context-aware research queries** tailored to your project phase
- **Seamless workflow integration** using `/mcp ref search` commands
- **Informed decision making** without breaking your development flow

### 🏠 Advanced Housekeeping
Automated session management and context preservation:
- **Smart session tracking** with automatic state preservation
- **Context cleanup** when conversations get too large
- **Transcript capture** for learning and team collaboration
- **Intelligent resumption** that knows exactly where you left off

---

## Step-by-Step Setup

### 1. Clone the Template
```bash
git clone https://github.com/Onegaishmas/xcc_lattice.git
```

### 2. Remove Template Git History
```bash
rm -rf xcc_lattice/.git
```

### 3. Rename to Your Project
```bash
mv xcc_lattice your-project-name
cd your-project-name
```

### 4. Initialize XCC Framework
```bash
# Create complete !xcc framework structure
mkdir -p !xcc/adrs !xcc/docs !xcc/instruct !xcc/prds !xcc/tasks !xcc/tdds !xcc/tids
mkdir -p !xcc/transcripts !xcc/checkpoints !xcc/scripts

# Initialize session state
echo '{"sessionNumber": 0, "currentPhase": "setup", "totalSessionTime": "0 hours"}' > !xcc/session_state.json

# Initialize research context
echo '{"projectContext": {}, "researchHistory": [], "researchPatterns": {}}' > !xcc/research_context.json

# Optional: Add transcripts to .gitignore if you want to keep them private
echo "!xcc/transcripts/" >> .gitignore
```

### 5. Create New GitHub Repository
1. Go to [github.com](https://github.com)
2. Click **"+"** → **"New repository"**
3. Repository name: `your-project-name`
4. Set to **Public** or **Private**
5. **DO NOT** check "Add a README file"
6. Click **"Create repository"**

### 6. Initialize New Git Repository
```bash
git init
git add .
git commit -m "Initial commit: XCC Framework with !xcc organization and enhanced housekeeping"
git branch -M main
```

### 7. Connect to GitHub and Push
```bash
git remote add origin https://github.com/yourusername/your-project-name.git
git push -u origin main
```

**Authentication:** GitHub will prompt for:
- **Username:** `yourusername`
- **Password:** Use your Personal Access Token (not your GitHub password)

---

## MCP Server Setup (Optional but Recommended)

The XCC framework can be enhanced with MCP servers for research capabilities:

### Install ref MCP Server
```bash
# Install globally for easy access across projects
npm install -g @modelcontextprotocol/server-ref

# Verify installation
ref --version
```

### Using MCP in Claude Code
Claude Code has built-in MCP support via the `/mcp` command:
```bash
# Basic usage
/mcp ref search "your search query"

# Example research query
/mcp ref search "React vs Vue comparison 2024"
```

### Test MCP Integration
```bash
# In Claude Code chat window, test the connection:
/mcp ref search "test query"

# Should return search results if properly configured
```

---

## Claude Code Integration

### 1. Open Project in VS Code
```bash
code .
```

### 2. Start Claude Code Session
- Open Command Palette: `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
- Type: **"Claude Code: Start Chat"**
- Or use the Claude Code icon in the Activity Bar

### 3. Initialize XCC Framework Context
```bash
# In Claude Code chat:
@CLAUDE.md

@!xcc/instruct/001_create-project-prd.md

I want to build [describe your project idea in detail]

# The framework will guide you through strategic questions with research options
```

### 4. Using Research Integration
When you see research options like:
```
B) 🔍 Research first: Use /mcp ref search "MVP vs full application development approaches"
```

Select this option to get:
- **Contextual research suggestions** tailored to your project type and phase
- **Guided research questions** to focus your investigation  
- **Structured application** of research findings back to your project decisions
- **Seamless workflow continuation** with informed choices

### 5. Housekeeping Commands for Claude Code

#### Session Management
```bash
# Create comprehensive checkpoint (save current state)
"Please create a checkpoint"

# Resume previous session with full context
"Please help me resume where I left off"

# Clean up context when it gets too large
"My context is getting too large, please clean up"

# Save current session transcript for learning
"Please save the session transcript"

# Check overall project status and progress
"Please show me the current project status"
```

#### Quick Context Loading
```bash
# Standard session start sequence
@CLAUDE.md
@!xcc/session_state.json

# Load current work area based on phase
@!xcc/prds/     # For PRD work
@!xcc/tdds/     # For TDD work
@!xcc/tids/     # For TID work  
@!xcc/tasks/    # For task execution

# Research context when needed
@!xcc/research_context.json
```

---

## Enhanced Workflow Process

### Phase 1: Project Foundation
```bash
# Session 1: Project Vision with Research Support
@!xcc/instruct/001_create-project-prd.md
# Use research options to inform project scope and user decisions
# Output: !xcc/prds/000_PPRD|[project-name].md

# Session 2: Technical Foundation with Research
@!xcc/instruct/002_create-adr.md
@!xcc/prds/000_PPRD|[project-name].md
# Research technology choices before making architectural decisions
# Output: !xcc/adrs/000_PADR|[project-name].md
# Action: Copy Project Standards section to CLAUDE.md
```

### Phase 2: Feature Development (For each feature)
```bash
# Feature Requirements with Research Support
@!xcc/instruct/003_create-feature-prd.md
@!xcc/prds/000_PPRD|[project-name].md
@!xcc/adrs/000_PADR|[project-name].md
# Research feature patterns, user stories, and security requirements
# Output: !xcc/prds/[###]_FPRD|[feature-name].md

# Technical Design with Architecture Research
@!xcc/instruct/004_create-tdd.md  
@!xcc/prds/[###]_FPRD|[feature-name].md
# Research architecture patterns, data design, and component organization
# Output: !xcc/tdds/[###]_FTDD|[feature-name].md

# Implementation Planning with Best Practices Research
@!xcc/instruct/005_create-tid.md
@!xcc/prds/[###]_FPRD|[feature-name].md
@!xcc/tdds/[###]_FTDD|[feature-name].md
# Research implementation patterns, coding standards, and optimization strategies
# Output: !xcc/tids/[###]_FTID|[feature-name].md

# Task Generation with Planning Research
@!xcc/instruct/006_generate-tasks.md
@!xcc/prds/[###]_FPRD|[feature-name].md
# Optional: Reference TDD and TID for enhanced context
# Output: !xcc/tasks/[###]_FTASKS|[feature-name].md

# Implementation with Progress Tracking
@!xcc/instruct/007_process-task-list.md
@!xcc/tasks/[###]_FTASKS|[feature-name].md
# Execute tasks with automatic progress tracking and checkpointing
```

---

## What You Get

### Enhanced Project Structure
```
your-project-name/
├── !xcc/                           # XCC Framework (sorts to top)
│   ├── adrs/                       # Architecture Decision Records
│   │   └── 000_PADR|Project_Name.md
│   ├── docs/                       # Additional framework documentation
│   ├── instruct/                   # XCC Framework instruction files
│   │   ├── 000_README.md
│   │   ├── 001_create-project-prd.md
│   │   ├── 002_create-adr.md
│   │   ├── 003_create-feature-prd.md
│   │   ├── 004_create-tdd.md
│   │   ├── 005_create-tid.md
│   │   ├── 006_generate-tasks.md
│   │   ├── 007_process-task-list.md
│   │   └── 008_housekeeping.md
│   ├── prds/                       # Product Requirements Documents
│   │   ├── 000_PPRD|Project_Name.md
│   │   ├── 001_FPRD|Feature_A.md
│   │   └── 002_FPRD|Feature_B.md
│   ├── tasks/                      # Task Lists with progress tracking
│   │   ├── 001_FTASKS|Feature_A.md
│   │   └── 002_FTASKS|Feature_B.md
│   ├── tdds/                       # Technical Design Documents
│   │   ├── 001_FTDD|Feature_A.md
│   │   └── 002_FTDD|Feature_B.md
│   ├── tids/                       # Technical Implementation Documents
│   │   ├── 001_FTID|Feature_A.md
│   │   └── 002_FTID|Feature_B.md
│   ├── transcripts/                # Session transcripts for learning
│   │   ├── session_001.md
│   │   └── research_log.md
│   ├── checkpoints/                # Automated state backups
│   ├── scripts/                    # Optional automation scripts
│   ├── session_state.json          # Current session tracking
│   └── research_context.json       # Research history and context
├── CLAUDE.md                       # Project memory system
├── src/                            # Your actual project code
├── tests/                          # Your project tests
├── package.json                    # Your project dependencies (if applicable)
└── README.md                       # This file
```

### Key Benefits

#### 🗂️ **Clean Organization**
- **Framework isolation:** All XCC files in `!xcc/` directory
- **Easy navigation:** `!` prefix sorts framework to top in file explorers
- **Clear boundaries:** Framework vs project code separation
- **Portable updates:** Framework can be updated independently

#### 🔍 **Research-Informed Development**
- **Contextual research suggestions** for every major decision point
- **MCP integration** for seamless research without workflow interruption
- **Research tracking** in session transcripts and context
- **Informed decision making** with current best practices and data

#### 🏠 **Advanced Session Management**  
- **Automatic state tracking** with comprehensive progress monitoring
- **Smart context cleanup** when conversations get too large
- **Transcript capture** for learning, team collaboration, and knowledge transfer
- **Intelligent resumption** that preserves research findings and decision context
- **Progress analytics** across sessions and development phases

#### 📊 **Enhanced Productivity**
- **Time tracking** across sessions with realistic estimation improvements
- **Decision consistency** through documented research and standards
- **Reduced context switching** with integrated research capabilities
- **Team collaboration** through comprehensive session documentation

---

## Example Usage Patterns

### Starting a New Session
```bash
# Claude Code chat
@CLAUDE.md
"Please help me resume where I left off"

# Claude will automatically:
# - Check !xcc/session_state.json for last position
# - Load current document context  
# - Show progress and next actions
# - Present any blockers or research findings
# - Provide specific resume guidance
```

### Making Research-Informed Decisions
```bash
# When you see research options in the workflow:
"I'll choose option B to research this topic first"

# Claude provides:
# - Specific MCP search commands: /mcp ref search "context-aware query"
# - Research focus areas and key questions to investigate
# - Framework for applying research findings to your specific project
# - Structured way to resume with informed choice
```

### Mid-Session Checkpoint
```bash
"Please create a checkpoint before I take a break"

# Claude will:
# - Update !xcc/session_state.json with current progress
# - Save transcript with key decisions and research findings
# - Commit progress with structured message including research context
# - Provide specific resume commands for next session
```

### Context Management
```bash
"My context is getting too large, please clean up"

# Claude will:
# - Create comprehensive checkpoint preserving all research and decisions
# - Clean conversation context while preserving essential information
# - Reload only critical project information and current work context
# - Resume exactly where you left off with clean, focused context
```

### Research Integration Example
```bash
# During ADR creation, when choosing backend technology:
"I'll research the backend options first"

# Claude responds with:
/mcp ref search "Python web framework comparison FastAPI Django Flask 2024"

# After reviewing research results:
"Based on this research, FastAPI seems best for our API-first SaaS platform because..."
# Decision gets documented in both ADR and research context
```

---

## Advanced Features

### Research-Informed Development
The framework captures and leverages research throughout development:
- **Decision tracking** with research basis and confidence levels
- **Pattern recognition** from research queries across projects
- **Knowledge accumulation** for improved future decision making
- **Team knowledge sharing** through research documentation

### Session Analytics and Learning
- **Time estimation** improvements based on actual session data
- **Decision quality** metrics correlating research with successful outcomes
- **Process optimization** from transcript analysis and pattern recognition
- **Framework evolution** based on real usage patterns and feedback

### Team Collaboration
- **Context handoffs** with complete research and decision history
- **Knowledge preservation** that survives team changes and project pauses
- **Onboarding acceleration** through comprehensive project documentation
- **Decision transparency** for stakeholders and team alignment

### Framework Portability
- **Easy updates:** Replace `!xcc/` directory to update framework
- **Project templates:** Copy `!xcc/` structure to new projects
- **Custom extensions:** Add organization-specific instructions
- **Version control:** Track framework evolution separately from project code

---

## Troubleshooting

### If Context Gets Lost
```bash
# Emergency context recovery
@CLAUDE.md
@!xcc/session_state.json
@!xcc/prds/000_PPRD|[project-name].md
@!xcc/adrs/000_PADR|[project-name].md

# Then ask: "Please help me understand where I am in the workflow"
```

### If Session State is Corrupted
```bash
# Manual session state recreation
@CLAUDE.md
@!xcc/research_context.json
git log --oneline -10

# Ask: "Please help me recreate the session state based on recent commits and research history"
```

### If MCP Research Isn't Working
```bash
# Test MCP connection
/mcp ref search "test query"

# If no response, check MCP server installation:
npm list -g @modelcontextprotocol/server-ref

# Reinstall if needed:
npm install -g @modelcontextprotocol/server-ref
```

### If You Need to Start a Phase Over
```bash
# Clean restart while preserving research and decisions
"Please create a final checkpoint and help me restart the [current phase] with a clean approach"

# Claude will preserve research findings while providing a fresh start
```

---

## Migration from Old Structure

If you have an existing XCC project without the `!xcc/` structure:

### Quick Migration Script
```bash
#!/bin/bash
echo "Migrating XCC framework to !xcc directory..."

# Create new structure
mkdir -p !xcc

# Move existing directories
[ -d "adrs" ] && mv adrs !xcc/
[ -d "docs" ] && mv docs !xcc/
[ -d "instruct" ] && mv instruct !xcc/
[ -d "prds" ] && mv prds !xcc/
[ -d "tasks" ] && mv tasks !xcc/
[ -d "tdds" ] && mv tdds !xcc/
[ -d "tids" ] && mv tids !xcc/

# Create missing directories
mkdir -p !xcc/transcripts !xcc/checkpoints !xcc/scripts

# Initialize session state
echo '{"sessionNumber": 0, "currentPhase": "migrated", "totalSessionTime": "0 hours"}' > !xcc/session_state.json

echo "Migration complete! Update your CLAUDE.md file references to use !xcc/ paths"
```

### Update File References
After migration, update your CLAUDE.md file references:
- Change `@prds/` to `@!xcc/prds/`
- Change `@adrs/` to `@!xcc/adrs/`
- Update all other framework paths to include `!xcc/` prefix

---

**Setup Time:** ~5 minutes  
**Enhanced Features:** Organized structure, research integration, advanced housekeeping  
**Ready to Code:** Start with enhanced Project PRD creation!

The XCC Framework now provides a more organized, research-informed, and automatically managed development experience within Claude Code and VS Code. The `!xcc/` structure ensures your framework files are organized, easily updatable, and clearly separated from your project code.