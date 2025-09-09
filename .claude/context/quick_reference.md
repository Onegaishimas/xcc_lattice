# Claude Extensions Quick Reference - Pure Markdown

## 🚀 Essential Commands

### /health - Project Health Assessment
```
@.claude/context/health/dashboard.md
@.claude/context/health/assessment_template.md
```

### /smart-clear - Context Management
```
# Before /clear:
@CLAUDE.md  # Update current status
@.claude/context/agents/[relevant-agents].md  # Update agent contexts

# After /clear:
@CLAUDE.md
@.claude/context/health/dashboard.md  
@.claude/context/sessions/[latest-session].md
```

### /feature [name] [mode] - Feature Development
```
@.claude/context/agents/product_engineer.md  # Requirements
@.claude/context/agents/architect.md         # Design  
@.claude/context/agents/qa_engineer.md       # Quality
@.claude/context/agents/test_engineer.md     # Testing
```

### /review [scope] - Multi-Agent Review
```
@.claude/context/agents/product_engineer.md  # Business alignment
@.claude/context/agents/qa_engineer.md       # Code quality
@.claude/context/agents/architect.md         # Design consistency  
@.claude/context/agents/test_engineer.md     # Test coverage
```

### /collaborate [type] [description] - Agent Collaboration
```
@.claude/context/sessions/session_template.md  # Document challenge
# Then load all agent contexts for input
```

## 🤖 Agent System

### Product Engineer Agent
**File:** `.claude/context/agents/product_engineer.md`
**Focus:** Requirements, user stories, business logic, product vision
**Update When:** Working on requirements, user research, product decisions

### QA Engineer Agent  
**File:** `.claude/context/agents/qa_engineer.md`
**Focus:** Code quality, testing strategy, standards, security
**Update When:** Code reviews, quality assessments, testing planning

### Architect Agent
**File:** `.claude/context/agents/architect.md`
**Focus:** System design, patterns, scalability, technical debt
**Update When:** Architecture decisions, design reviews, system planning

### Test Engineer Agent
**File:** `.claude/context/agents/test_engineer.md`
**Focus:** Testing coverage, automation, debugging, reliability  
**Update When:** Test planning, coverage analysis, debugging sessions

## 📊 Health System

### Health Dashboard
**File:** `.claude/context/health/dashboard.md`
**Purpose:** Current project health overview
**Update:** Weekly or after major changes

### Health Assessment
**File:** `.claude/context/health/assessment_template.md`
**Purpose:** Detailed health evaluation template
**Usage:** Copy to dated file and complete assessment

## 📝 Session Management

### Session Template
**File:** `.claude/context/sessions/session_template.md`
**Purpose:** Structure for tracking work sessions
**Usage:** Copy to `session_YYYYMMDD_HHMM.md` for each major work session

### Session Types
- **Development:** Feature work, coding, implementation
- **Review:** Code reviews, quality assessments  
- **Planning:** Architecture decisions, requirement analysis
- **Collaboration:** Multi-agent problem solving

## 🔄 Workflow Patterns

### Daily Development Flow
1. Load: `@CLAUDE.md`
2. Check: `@.claude/context/health/dashboard.md`
3. Work: Update relevant agent contexts as you go
4. Before break: `/smart-clear`

### Feature Development Flow
1. Start: `/feature feature-name mode`
2. Plan: Update all 4 agent contexts with feature-specific analysis
3. Develop: Track progress in session files  
4. Review: `/review feature` with all agents
5. Complete: Update health dashboard

### Problem Solving Flow
1. Define: `/collaborate problem-solving "description"`
2. Analyze: Get input from relevant agents
3. Decide: Document decision in collaboration session
4. Update: Modify agent contexts with outcomes

### Weekly Health Flow  
1. Assess: `/health` - complete assessment template
2. Update: Refresh dashboard with current status
3. Plan: Identify improvement priorities
4. Track: Note trends and progress

## 🏗️ File Structure

```
.claude/
├── agents/                     # Specialized AI agents
│   └── hardcore-debugger.md   # Deep debugging agent
├── commands/                   # Command definitions  
│   ├── analyze.md              # /analyze command
│   ├── collaborate.md          # /collaborate command
│   ├── feature.md              # /feature command
│   ├── health.md               # /health command
│   ├── review.md               # /review command
│   ├── smart-clear.md          # /smart-clear command
│   └── update_repo.md          # /update-repo command
├── context/                    # Context management
│   ├── agents/                 # Agent context files
│   │   ├── architect.md        # System design agent
│   │   ├── product_engineer.md # Requirements agent
│   │   ├── qa_engineer.md      # Quality assurance agent
│   │   └── test_engineer.md    # Testing strategy agent
│   ├── health/                 # Health monitoring
│   │   ├── assessment_template.md # Health evaluation template
│   │   └── dashboard.md        # Current project health
│   ├── sessions/               # Session tracking
│   │   ├── session_template.md # Session documentation template
│   │   └── [dated-sessions].md # Actual session files
│   └── quick_reference.md      # This file
├── prompts/                    # Analysis templates
│   ├── analysis/               # Expert analysis prompts
│   │   ├── architecture/       # System design analysis
│   │   ├── integration/        # Integration review
│   │   ├── product/            # Product context analysis
│   │   ├── quality/            # Code quality review
│   │   └── testing/            # Testing strategy analysis
│   └── usage_guide.md          # Prompts usage guide
└── settings.local.json         # Claude Code settings

CLAUDE.md                       # Project memory (root level)
```

## ✨ Key Benefits

### ✅ No Dependencies
- Pure Markdown files
- No Python, no scripts, no external tools
- Works with Claude's native file loading
- Human-readable and editable

### ✅ Persistent Context
- Agent contexts preserved between sessions
- Health tracking over time  
- Session history maintenance
- Decision documentation

### ✅ Structured Workflows
- Clear command definitions
- Multi-agent coordination
- Systematic problem solving
- Quality gates and reviews

### ✅ Flexible and Extensible
- Easy to customize for your project
- Add new agents or commands
- Integrate with existing workflows (XCC)
- Scale from simple to complex projects

## 🔧 Customization

### Adding New Agents
1. Create `.claude/context/agents/new_agent.md`
2. Define role, focus, and analysis templates
3. Update commands to include new agent
4. Add to quick reference

### Custom Commands
1. Create `.claude/commands/custom_command.md`
2. Define workflow using file loading
3. Document in quick reference
4. Test with your project

### Integration with XCC
- Commands can reference XCC instruction files
- Agent contexts inform XCC document creation
- Health monitoring covers XCC compliance
- Session tracking complements XCC tasks

## 🚀 Getting Started

### System Status
**Setup Date:** Current  
**System Type:** Pure Markdown Claude Extensions  
**Status:** ✅ Fully Operational

### System Components
- ✅ 7 Commands (analyze, collaborate, feature, health, review, smart-clear, update-repo)
- ✅ 5 Expert Analysis Prompts (product, quality, architecture, testing, integration)
- ✅ 4 Specialized Agents (product, qa, architect, test contexts)
- ✅ Health monitoring system
- ✅ Session management templates

### First Time Setup
1. Load `@CLAUDE.md` for project context
2. Run `/health` to establish baseline
3. Try `/analyze quality codebase` for initial assessment
4. Use `/feature test-feature` to test workflow

### Daily Usage
1. Start: `@CLAUDE.md`
2. Check: `@.claude/context/health/dashboard.md`
3. Work: Update agent contexts as needed
4. End: `/smart-clear` before breaks

### Next Steps After Setup
- Run `/health` to establish project baseline
- Try `/analyze product requirements` for deep analysis  
- Use `/feature test-feature` to test development workflow
- Practice `/smart-clear` for context management

---
*This system provides all the power of the Python-based system using only Markdown files and Claude's native capabilities.*
