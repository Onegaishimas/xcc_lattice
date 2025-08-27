#!/bin/bash
# Pure Markdown Claude Extensions Setup - No Scripts, Only .md Files

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗"
    echo "║          Claude Extensions - Pure Markdown Version           ║"
    echo "║              Only .md Files - No Scripts Required            ║"  
    echo "╚═══════════════════════════════════════════════════════════════╝${NC}"
}

create_markdown_structure() {
    echo "📁 Creating pure Markdown structure..."
    
    # Create directories
    mkdir -p .claude/{commands,prompts,context,workflows,templates}
    mkdir -p .claude/context/{project,sessions,health,agents}
    
    echo -e "${GREEN}✅ Directory structure created${NC}"
}

create_health_system() {
    # Health Assessment Template
    cat > .claude/context/health/assessment_template.md << 'EOF'
# Project Health Assessment

**Assessment Date:** [DATE]
**Assessor:** [YOUR NAME]

## Health Checklist

### 📁 Project Structure
- [ ] Source code organized in `src/`, `lib/`, or `app/` directory
- [ ] Clear separation of concerns in directory structure  
- [ ] Logical file naming conventions
- **Notes:** 

### 🔧 Version Control
- [ ] Git repository initialized
- [ ] Regular commits with meaningful messages
- [ ] Clean working directory (no uncommitted critical changes)
- [ ] Branches used appropriately
- **Current Status:** 
- **Last Commit:** 
- **Notes:**

### 📚 Documentation  
- [ ] README.md with project overview
- [ ] CLAUDE.md for session memory
- [ ] Architecture documentation (ADR or !xcc)
- [ ] API documentation where applicable
- **Documentation Score:** _/4
- **Notes:**

### 🧪 Testing & Quality
- [ ] Test directory structure exists
- [ ] Test files present for core functionality
- [ ] Code follows consistent style
- [ ] No obvious code smells or technical debt
- **Testing Score:** _/4
- **Notes:**

### 🤖 Claude Extensions
- [ ] .claude/ directory structure complete
- [ ] Commands available and documented
- [ ] Context management system active
- [ ] Agent workflows defined
- **Extensions Score:** _/4

## Overall Health Score
**Total Points:** ___/20
**Health Level:** 
- 18-20: 🟢 EXCELLENT
- 14-17: 🟡 GOOD  
- 10-13: 🟠 FAIR
- 6-9: 🔴 NEEDS ATTENTION
- 0-5: 💀 CRITICAL

## Action Items
1. [ ] 
2. [ ] 
3. [ ]

## Next Assessment Date
**Scheduled:** [DATE + 1 week]

---
*Use this template by copying it to a new file and filling in your assessment*
EOF

    # Health Dashboard Template  
    cat > .claude/context/health/dashboard.md << 'EOF'
# Project Health Dashboard

**Last Updated:** [UPDATE DATE]
**Health Status:** [EXCELLENT/GOOD/FAIR/NEEDS ATTENTION/CRITICAL]

## Quick Status
- 🏗️ **Structure:** [SCORE/4] 
- 🔧 **Version Control:** [SCORE/4]
- 📚 **Documentation:** [SCORE/4] 
- 🧪 **Testing:** [SCORE/4]
- 🤖 **Claude Extensions:** [SCORE/4]

**Overall:** [TOTAL]/20

## Current Focus Areas
1. **Primary:** [What needs immediate attention]
2. **Secondary:** [What should be improved soon]  
3. **Future:** [What can wait but should be planned]

## Recent Improvements
- **[DATE]:** [What was improved]
- **[DATE]:** [What was improved]

## Trend
- **Direction:** [IMPROVING/STABLE/DECLINING]
- **Key Metric:** [What you're tracking]

## Quick Actions
- **Today:** [Immediate action needed]
- **This Week:** [Weekly goal]
- **This Month:** [Monthly objective]

---
*Update this dashboard weekly or after major changes*
EOF

    echo -e "${GREEN}✅ Health system created${NC}"
}

create_agent_system() {
    # Product Engineer Agent (Markdown workflow)
    cat > .claude/context/agents/product_engineer.md << 'EOF'
# Product Engineer Agent

**Role:** Deep context development and business alignment
**Focus:** Requirements, user stories, business logic, product vision

## Current Analysis

### Context Completeness
**Last Assessed:** [DATE]
**Status:** [COMPLETE/PARTIAL/NEEDS WORK]

**Requirements Coverage:**
- [ ] User stories defined with acceptance criteria
- [ ] Business rules documented and understood
- [ ] Edge cases identified and planned
- [ ] Integration requirements mapped
- [ ] Success metrics defined

**Context Gaps Identified:**
1. 
2. 
3. 

### Product Health Check
- **User Story Coverage:** _% complete
- **Business Logic Clarity:** [CLEAR/PARTIAL/UNCLEAR]
- **Integration Readiness:** [READY/PARTIAL/NOT READY]

### Current Recommendations
**High Priority:**
1. 
2. 

**Medium Priority:**
1. 
2. 

**Low Priority:**
1. 

### Session Context
**Working On:** [Current feature/task]
**Next Steps:** 
1. 
2. 
3. 

**Blockers:** 
- 

**Notes:**


---
*Update this when working on product/requirements analysis*
EOF

    # QA Engineer Agent
    cat > .claude/context/agents/qa_engineer.md << 'EOF'
# QA Engineer Agent

**Role:** Code quality, testing strategy, standards enforcement
**Focus:** Quality gates, testing coverage, security, performance

## Current Analysis

### Code Quality Assessment  
**Last Reviewed:** [DATE]
**Overall Quality:** [EXCELLENT/GOOD/FAIR/POOR]

**Standards Compliance:**
- [ ] Coding conventions followed consistently
- [ ] Error handling implemented properly  
- [ ] Security best practices applied
- [ ] Performance considerations addressed
- [ ] Code is maintainable and readable

**Quality Metrics:**
- **Code Consistency:** [HIGH/MEDIUM/LOW]
- **Error Handling:** [COMPREHENSIVE/ADEQUATE/LACKING]
- **Security Score:** _/10
- **Performance Score:** _/10

### Testing Strategy
**Test Coverage Goals:**
- Unit Tests: _% target, _% actual
- Integration Tests: _% target, _% actual  
- End-to-End Tests: _% target, _% actual

**Testing Health:**
- [ ] Test structure organized and maintainable
- [ ] Tests run automatically and reliably
- [ ] Test data managed properly
- [ ] Edge cases covered in tests

### Current Issues
**Blocking Issues:**
1. 
2. 

**Critical Issues:**
1. 
2. 

**Quality Improvements:**
1. 
2. 

### Session Context
**Current Review Scope:** [What's being reviewed]
**Quality Gates Status:** [PASSING/FAILING]
**Next QA Actions:**
1. 
2. 

---
*Update this during code reviews and quality assessments*
EOF

    # Architect Agent
    cat > .claude/context/agents/architect.md << 'EOF'
# Architect Agent

**Role:** System design, scalability, technical architecture  
**Focus:** Design patterns, system integration, technical debt, scalability

## Current Analysis

### Architecture Assessment
**Last Reviewed:** [DATE]
**Architecture Health:** [EXCELLENT/GOOD/FAIR/POOR]

**Design Consistency:**
- [ ] Architectural patterns followed consistently
- [ ] Component boundaries well-defined
- [ ] Separation of concerns maintained
- [ ] Integration patterns standardized
- [ ] Data flow clearly designed

**Architecture Scores:**
- **Pattern Consistency:** _/10
- **Scalability:** _/10
- **Maintainability:** _/10
- **Integration Quality:** _/10

### Technical Debt Analysis
**Debt Level:** [LOW/MEDIUM/HIGH/CRITICAL]

**Debt Areas:**
1. **[AREA]:** [Description and impact]
2. **[AREA]:** [Description and impact]

**Refactoring Priorities:**
1. **High:** [What needs immediate attention]
2. **Medium:** [What should be planned]
3. **Low:** [What can wait]

### Scalability Assessment
**Current Capacity:** [Assessment of current system limits]
**Bottlenecks Identified:**
1. 
2. 

**Scalability Recommendations:**
1. 
2. 

### Session Context  
**Current Design Focus:** [What architecture area you're working on]
**Design Decisions Pending:**
1. 
2. 

**Architecture Next Steps:**
1. 
2. 

---
*Update this when working on system design and architecture*
EOF

    # Test Engineer Agent
    cat > .claude/context/agents/test_engineer.md << 'EOF'
# Test Engineer Agent

**Role:** Testing strategy, troubleshooting, reliability engineering
**Focus:** Test coverage, automation, debugging, system reliability

## Current Analysis

### Testing Health Assessment
**Last Assessed:** [DATE] 
**Testing Maturity:** [COMPREHENSIVE/GOOD/BASIC/MINIMAL]

**Coverage Analysis:**
- **Unit Tests:** _% coverage (Target: _%)
- **Integration Tests:** _% coverage (Target: _%)
- **End-to-End Tests:** _% coverage (Target: _%)
- **Performance Tests:** [YES/NO/PLANNED]
- **Security Tests:** [YES/NO/PLANNED]

**Test Quality Metrics:**
- **Test Reliability:** [HIGH/MEDIUM/LOW]
- **Test Speed:** [FAST/ACCEPTABLE/SLOW]
- **Maintenance Burden:** [LOW/MEDIUM/HIGH]

### Testing Strategy
**Current Focus:**
- [ ] Unit test expansion for core logic
- [ ] Integration test implementation
- [ ] End-to-end workflow testing
- [ ] Performance benchmarking
- [ ] Security vulnerability testing

**Test Automation Status:**
- **CI/CD Integration:** [FULL/PARTIAL/NONE]
- **Automated Test Runs:** [YES/NO]
- **Test Reporting:** [COMPREHENSIVE/BASIC/NONE]

### Risk Assessment
**High-Risk Areas:**
1. **[COMPONENT]:** [Risk description and testing approach]
2. **[COMPONENT]:** [Risk description and testing approach]

**Testing Gaps:**
1. 
2. 
3. 

### Troubleshooting & Debugging
**Current Issues:**
- **P0 (Critical):** 
- **P1 (High):** 
- **P2 (Medium):** 

**Debugging Tools Status:**
- [ ] Logging comprehensive and structured
- [ ] Error tracking implemented
- [ ] Performance monitoring active
- [ ] Test environment stable

### Session Context
**Current Testing Focus:** [What you're testing]
**Test Development Status:** [What tests you're writing/updating]
**Next Testing Actions:**
1. 
2. 

---
*Update this when working on testing and quality assurance*
EOF

    echo -e "${GREEN}✅ Agent system created${NC}"
}

create_command_system() {
    # Health Command
    cat > .claude/commands/health.md << 'EOF'
# /health - Project Health Assessment

## Quick Health Check

Load and review these files to assess project health:

1. **Load Health Dashboard:**
   ```
   @.claude/context/health/dashboard.md
   ```

2. **Review Agent Status:**
   ```
   @.claude/context/agents/product_engineer.md
   @.claude/context/agents/qa_engineer.md  
   @.claude/context/agents/architect.md
   @.claude/context/agents/test_engineer.md
   ```

3. **Analyze Current State:**
   - Check git status: `git status`
   - Review project structure: `ls -la`
   - Check documentation: `ls *.md`

## Health Assessment Workflow

### Step 1: Load Assessment Template
```
@.claude/context/health/assessment_template.md
```

### Step 2: Fill Out Assessment
Copy the template to a new file and complete the assessment:
```bash
cp .claude/context/health/assessment_template.md .claude/context/health/assessment_$(date +%Y%m%d).md
```

### Step 3: Update Dashboard
After completing assessment, update:
```
@.claude/context/health/dashboard.md
```

## What This Command Does
- Provides structured approach to health assessment
- Uses only file loading and Markdown templates
- No scripts required - pure Claude interaction
- Creates historical health tracking

## Quick Status Indicators
- 🟢 **Excellent (18-20/20):** Well-organized, documented, tested
- 🟡 **Good (14-17/20):** Solid foundation, minor improvements needed  
- 🟠 **Fair (10-13/20):** Functional but needs attention
- 🔴 **Needs Attention (6-9/20):** Multiple issues to address
- 💀 **Critical (0-5/20):** Requires immediate restructuring
EOF

    # Smart Clear Command
    cat > .claude/commands/smart-clear.md << 'EOF'
# /smart-clear - Intelligent Context Management

## Pre-Clear Context Capture

### Step 1: Update Current Session Context
```
@CLAUDE.md
```
Update the "Current Status" section with:
- What you're currently working on
- Next immediate steps
- Any blockers or important decisions

### Step 2: Update Agent Context
Load and update relevant agent files:
```
@.claude/context/agents/product_engineer.md
@.claude/context/agents/qa_engineer.md
@.claude/context/agents/architect.md  
@.claude/context/agents/test_engineer.md
```

### Step 3: Create Session Snapshot
```
@.claude/context/sessions/session_template.md
```
Copy template to new session file with current timestamp.

### Step 4: Update Health Status (if needed)
```
@.claude/context/health/dashboard.md
```

## Post-Clear Resume Sequence

After using `/clear`, load files in this order:

### Essential Context
```
@CLAUDE.md
@.claude/context/health/dashboard.md
```

### Current Work Context
```
@.claude/context/sessions/[latest-session-file].md
```

### Agent Context (as needed)
```
@.claude/context/agents/product_engineer.md
@.claude/context/agents/qa_engineer.md
@.claude/context/agents/architect.md
@.claude/context/agents/test_engineer.md
```

### Project Context (if using XCC)
```
@!xcc/tasks/[current-task-file].md
@!xcc/prds/[current-prd-file].md
```

## What This Accomplishes
- ✅ Preserves all important context in Markdown files
- ✅ No scripts to fail or dependencies to break
- ✅ Human-readable context that can be edited
- ✅ Structured approach to context management
- ✅ Historical session tracking

## Session Template Location
The session template is at `.claude/context/sessions/session_template.md`
EOF

    # Feature Development Command
    cat > .claude/commands/feature.md << 'EOF'
# /feature - Feature Development Workflow

**Usage:** `/feature [feature-name] [mode]`
**Modes:** quick, standard, comprehensive

## Feature Development Workflow

### Step 1: Agent Coordination Setup

Load and update agent contexts for the feature:

```
@.claude/context/agents/product_engineer.md
```
Update with:
- Feature requirements analysis
- User story breakdown
- Business logic requirements

```
@.claude/context/agents/architect.md  
```
Update with:
- System design approach
- Integration points
- Architecture decisions

```
@.claude/context/agents/qa_engineer.md
```
Update with:
- Quality requirements
- Testing strategy
- Acceptance criteria

```
@.claude/context/agents/test_engineer.md
```
Update with:
- Test planning approach
- Coverage targets
- Risk assessment

### Step 2: XCC Framework Integration (if available)

If XCC framework exists:
```
@!xcc/instruct/003_create-feature-prd.md
@!xcc/instruct/004_create-tdd.md
@!xcc/instruct/005_create-tid.md
@!xcc/instruct/006_generate-tasks.md
```

### Step 3: Feature Session Tracking

```
@.claude/context/sessions/session_template.md
```
Copy to `feature_[name]_[date].md` and update with feature-specific context.

### Step 4: Development Mode Configuration

**Quick Mode:**
- Focus on Product Engineer and basic Architect input
- Minimal documentation requirements
- Rapid prototyping approach

**Standard Mode:**
- All four agents provide input
- Standard documentation and testing
- Balanced approach

**Comprehensive Mode:**
- Deep agent analysis and collaboration
- Extensive documentation and testing
- Enterprise-grade development approach

## Feature Context Management

Each feature gets:
1. **Agent Analysis:** All agents provide perspective
2. **Session Tracking:** Feature-specific session files
3. **Health Monitoring:** Feature impact on project health
4. **Documentation:** Integrated with XCC or standalone docs

## What This Accomplishes
- ✅ Multi-agent feature development coordination
- ✅ Structured approach based on development mode
- ✅ Integration with existing project frameworks
- ✅ Complete context preservation for features
- ✅ No external dependencies or scripts
EOF

    # Review Command
    cat > .claude/commands/review.md << 'EOF'
# /review - Multi-Agent Code Review

**Usage:** `/review [scope]`
**Scopes:** feature, code, architecture, tests, all

## Multi-Agent Review Process

### Step 1: Load Agent Contexts
```
@.claude/context/agents/product_engineer.md
@.claude/context/agents/qa_engineer.md
@.claude/context/agents/architect.md
@.claude/context/agents/test_engineer.md
```

### Step 2: Review Coordination

**Product Engineer Review:**
- Requirements alignment check
- User story coverage validation
- Business logic correctness
- Context completeness assessment

**QA Engineer Review:**  
- Code quality standards compliance
- Error handling adequacy
- Security best practices
- Testing coverage analysis

**Architect Review:**
- Design pattern consistency
- System integration quality
- Scalability implications
- Technical debt assessment

**Test Engineer Review:**
- Test strategy effectiveness
- Coverage gap identification
- Risk area analysis
- Debugging capability assessment

### Step 3: Review Documentation

Create review session file:
```
@.claude/context/sessions/session_template.md
```
Copy to `review_[scope]_[date].md`

### Step 4: Update Agent Contexts

After review, update each agent's .md file with:
- Findings from their perspective
- Recommendations for improvement
- Priority levels for issues found
- Next review focus areas

### Step 5: Health Impact Assessment

Update project health based on review findings:
```
@.claude/context/health/dashboard.md
```

## Review Scopes

**Feature Review:**
- Focus on specific feature implementation
- Cross-agent validation of feature requirements
- Feature-level quality gates

**Code Review:**
- Broad code quality assessment
- Standards compliance check
- Technical debt identification

**Architecture Review:**
- System design consistency
- Integration patterns
- Scalability bottlenecks

**Test Review:**
- Testing strategy effectiveness
- Coverage analysis
- Risk assessment

**All (Comprehensive Review):**
- Complete multi-agent analysis
- Cross-cutting concern identification
- Full project health assessment

## What This Accomplishes
- ✅ Systematic multi-perspective code review
- ✅ Agent-specific expertise application
- ✅ Structured review documentation
- ✅ Continuous project health monitoring
- ✅ Pure Markdown workflow - no scripts
EOF

    # Collaboration Command
    cat > .claude/commands/collaborate.md << 'EOF'
# /collaborate - Multi-Agent Collaboration

**Usage:** `/collaborate [challenge-type] [description]`
**Types:** design, problem-solving, optimization, debugging

## Collaboration Workflow

### Step 1: Define Challenge

Create collaboration session:
```
@.claude/context/sessions/session_template.md
```
Copy to `collaboration_[type]_[date].md` and document:
- Challenge description
- Desired outcome
- Constraints or requirements
- Timeline expectations

### Step 2: Agent Consultation

Load each agent for their perspective:

**Product Engineer Input:**
```
@.claude/context/agents/product_engineer.md
```
Focus on:
- Business impact analysis
- User experience implications
- Requirements clarification
- Product vision alignment

**QA Engineer Input:**
```
@.claude/context/agents/qa_engineer.md
```
Focus on:
- Quality implications
- Testing considerations
- Risk assessment
- Standards impact

**Architect Input:**
```
@.claude/context/agents/architect.md
```
Focus on:
- Technical approach options
- System design implications
- Integration considerations
- Scalability impact

**Test Engineer Input:**
```
@.claude/context/agents/test_engineer.md
```
Focus on:
- Testing strategy implications
- Debugging considerations
- Reliability impact
- Risk mitigation

### Step 3: Synthesis and Decision

Document in collaboration session file:
- Each agent's input and recommendations
- Conflicting viewpoints and resolutions
- Consensus decisions
- Implementation plan
- Success criteria

### Step 4: Update Project Context

Update relevant files based on decisions:
- `CLAUDE.md` - Update project direction
- Agent files - Update with decision outcomes
- Health dashboard - Note any health impacts

## Collaboration Types

**Design Challenges:**
- System architecture decisions
- User interface design choices
- Data model design
- Integration approach selection

**Problem-Solving:**
- Bug resolution strategies
- Performance issue diagnosis
- Technical roadblock solutions
- Process improvement initiatives

**Optimization:**
- Performance enhancement strategies
- Code quality improvement plans
- Workflow efficiency improvements
- Resource utilization optimization

**Debugging:**
- Complex issue diagnosis
- Root cause analysis
- Solution strategy development
- Prevention strategy planning

## What This Accomplishes
- ✅ Structured multi-agent problem solving
- ✅ Documented decision-making process
- ✅ Preserved reasoning and rationale
- ✅ Cross-functional perspective integration
- ✅ No external tools or scripts required
EOF

    echo -e "${GREEN}✅ Command system created${NC}"
}

create_session_templates() {
    # Session Template
    cat > .claude/context/sessions/session_template.md << 'EOF'
# Session Template

**Session ID:** [session_YYYYMMDD_HHMM]
**Date:** [YYYY-MM-DD]
**Type:** [development/review/collaboration/planning]

## Session Context
**Working On:** [Current focus/feature/task]
**Phase:** [What phase of work]
**Mode:** [quick/standard/comprehensive]

## Session Goals
1. 
2. 
3. 

## Agent Status
**Product Engineer:** [Status/focus]
**QA Engineer:** [Status/focus]  
**Architect:** [Status/focus]
**Test Engineer:** [Status/focus]

## Progress Made
- [ ] 
- [ ] 
- [ ] 

## Decisions Made
1. **Decision:** [What was decided]
   **Rationale:** [Why]
   **Impact:** [What this affects]

## Blockers/Issues
- **Blocker:** [Description]
  **Status:** [How being addressed]

## Next Steps
1. **Immediate (Next Session):** 
2. **Short Term (This Week):** 
3. **Medium Term (This Month):** 

## Context for Resume
**Load These Files:**
```
@CLAUDE.md
@.claude/context/agents/[relevant-agent].md
@[other-relevant-files]
```

**Key Context Points:**
- 
- 

## Notes


---
*Copy this template for each session and fill in details*
EOF

    echo -e "${GREEN}✅ Session templates created${NC}"
}

create_claude_md_template() {
    # Only create if CLAUDE.md doesn't exist
    if [ ! -f "CLAUDE.md" ]; then
        cat > CLAUDE.md << 'EOF'
# Project: [Your Project Name]

## Current Status
- **Phase:** Pure Markdown Claude Extensions Setup
- **Last Session:** [DATE] - Initial setup complete
- **Next Steps:** Run /health to assess project and begin structured development
- **Active Document:** Ready for Markdown-based workflow
- **Current Feature:** N/A (setup phase)

## Claude Extensions - Pure Markdown Model

### ✅ Available Commands (Markdown-Based)
- `/health` - Project health assessment using Markdown templates
- `/smart-clear` - Context management through file updates
- `/feature [name] [mode]` - Feature development coordination
- `/review [scope]` - Multi-agent review process
- `/collaborate [type] [description]` - Agent collaboration workflow

### 🤖 Agent System (Markdown Context Files)
- **Product Engineer:** Context tracking in `.claude/context/agents/product_engineer.md`
- **QA Engineer:** Quality tracking in `.claude/context/agents/qa_engineer.md`  
- **Architect:** Design tracking in `.claude/context/agents/architect.md`
- **Test Engineer:** Testing tracking in `.claude/context/agents/test_engineer.md`

### 📊 Health Monitoring (Markdown Templates)
- **Dashboard:** `.claude/context/health/dashboard.md`
- **Assessment:** `.claude/context/health/assessment_template.md`
- **Tracking:** Historical assessments in dated files

### 💡 How It Works
This system uses only Markdown files and Claude's file loading capabilities:

1. **Commands** load and guide you through Markdown templates
2. **Agent contexts** are maintained in editable .md files
3. **Health monitoring** uses structured Markdown assessments
4. **Session management** through template-based context files
5. **No scripts** - everything works through `@file.md` loading

### 🚀 Quick Start
1. **Check health:** `/health` 
2. **Start feature:** `/feature my-first-feature`
3. **Smart clear:** `/smart-clear` (before breaks)
4. **Review work:** `/review all`
5. **Collaborate:** `/collaborate design "How should we structure X?"`

## Project Standards
*[This will be populated when you create an ADR using XCC framework or manually]*

## Current Health Status
**Last Assessment:** [DATE]
**Health Level:** [Not yet assessed]
**Score:** [Not yet assessed]

Quick health indicators:
- 🏗️ Structure: [Update after first /health]
- 🔧 Git: [Update after first /health]  
- 📚 Documentation: [Update after first /health]
- 🧪 Testing: [Update after first /health]
- 🤖 Claude Extensions: ✅ Pure Markdown system active

## Session Management

### Quick Resume Commands
```bash
# Essential context for any session
@CLAUDE.md
@.claude/context/health/dashboard.md

# Agent context (load as needed)
@.claude/context/agents/product_engineer.md
@.claude/context/agents/qa_engineer.md

# Current session (load latest)
@.claude/context/sessions/[latest-session].md
```

### Before Taking Breaks
1. Update this CLAUDE.md "Current Status" section
2. Run `/smart-clear` to update all context files
3. Note any important decisions or next steps

## Agent Context Quick Access

### Product Focus
```
@.claude/context/agents/product_engineer.md
```

### Quality Focus  
```
@.claude/context/agents/qa_engineer.md
```

### Architecture Focus
```
@.claude/context/agents/architect.md
```

### Testing Focus
```
@.claude/context/agents/test_engineer.md
```

## Integration with XCC Framework
If you're using the XCC framework, this Markdown system integrates seamlessly:
- Commands can trigger XCC workflows
- Agent contexts inform XCC document creation
- Session tracking complements XCC task management
- Health monitoring covers both systems

---

**System Type:** Pure Markdown Claude Extensions  
**No Dependencies:** ✅ No Python, no scripts, no external tools
**Last Updated:** [DATE]  
**Status:** 🚀 Fully Operational
EOF
        echo -e "${GREEN}✅ CLAUDE.md template created${NC}"
    else
        echo -e "${YELLOW}ℹ️  CLAUDE.md already exists - not overwriting${NC}"
    fi
}

create_quick_reference() {
    cat > .claude/context/quick_reference.md << 'EOF'
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
├── commands/                    # Command definitions  
│   ├── health.md               # /health command
│   ├── smart-clear.md          # /smart-clear command
│   ├── feature.md              # /feature command
│   ├── review.md               # /review command
│   └── collaborate.md          # /collaborate command
├── context/                    # Context management
│   ├── agents/                 # Agent context files
│   │   ├── product_engineer.md
│   │   ├── qa_engineer.md
│   │   ├── architect.md
│   │   └── test_engineer.md
│   ├── health/                 # Health monitoring
│   │   ├── dashboard.md
│   │   └── assessment_template.md
│   └── sessions/               # Session tracking
│       ├── session_template.md
│       └── [dated-session-files].md
└── quick_reference.md          # This file

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

### First Time Setup
1. Run setup script to create all files
2. Load `@CLAUDE.md` 
3. Run `/health` to establish baseline
4. Try `/feature test-feature` to test workflow

### Daily Usage
1. Start: `@CLAUDE.md`
2. Check: `@.claude/context/health/dashboard.md`
3. Work: Update agent contexts as needed
4. End: `/smart-clear` before breaks

---
*This system provides all the power of the Python-based system using only Markdown files and Claude's native capabilities.*
EOF

    echo -e "${GREEN}✅ Quick reference created${NC}"
}

main() {
    print_header
    
    echo "🚀 Setting up Pure Markdown Claude Extensions..."
    echo ""
    
    create_markdown_structure
    create_health_system
    create_agent_system
    create_command_system
    create_session_templates
    create_claude_md_template
    create_quick_reference
    
    echo ""
    echo -e "${GREEN}🎉 Pure Markdown Claude Extensions Setup Complete!${NC}"
    echo ""
    echo -e "${BLUE}📖 What was created:${NC}"
    echo "   📋 5 Commands (health, smart-clear, feature, review, collaborate)"
    echo "   🤖 4 Agent context files (Product, QA, Architect, Test)"
    echo "   📊 Health monitoring system (dashboard + assessments)"
    echo "   📝 Session management templates"
    echo "   🧠 CLAUDE.md project memory system"
    echo ""
    echo -e "${YELLOW}🚀 Quick Start:${NC}"
    echo "   1. Load project memory: @CLAUDE.md"
    echo "   2. Check project health: /health"
    echo "   3. Try feature development: /feature my-test-feature"
    echo "   4. Before breaks: /smart-clear"
    echo ""
    echo -e "${BLUE}📚 Key Features:${NC}"
    echo "   ✅ No Python scripts or dependencies"
    echo "   ✅ Pure Markdown files - human readable/editable"
    echo "   ✅ Agent contexts preserved between sessions"
    echo "   ✅ Health monitoring and tracking"
    echo "   ✅ Structured development workflows"
    echo "   ✅ Integrates with XCC framework"
    echo ""
    echo -e "${GREEN}🎯 Everything works through @file.md loading - no scripts to fail!${NC}"
}

main "$@"
