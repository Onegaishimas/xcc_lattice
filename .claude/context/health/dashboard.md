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

## Available Analysis Commands

- `/analyze product [scope]` - Requirements and business alignment
- `/analyze quality [scope]` - Code quality and standards
- `/analyze architecture [scope]` - System design and scalability
- `/analyze testing [scope]` - Test coverage and strategy
- `/analyze integration [scope]` - System integration health

## Agent Contexts Integration

All agent contexts ready for multi-perspective analysis:
- **Product Engineer:** Business and requirements focus
- **QA Engineer:** Quality and testing focus  
- **Architect:** Design and scalability focus
- **Test Engineer:** Testing and reliability focus

### Loading for Health Assessment
```markdown
@.claude/context/health/dashboard.md
@.claude/context/agents/product_engineer.md
@.claude/context/agents/qa_engineer.md
@.claude/context/agents/architect.md
@.claude/context/agents/test_engineer.md
@CLAUDE.md
```

---
*Update this dashboard weekly or after major changes using `/health` command*
