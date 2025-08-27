#!/bin/bash
# Fixed Essential Prompts Setup Script

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗"
    echo "║          Claude Extensions - Essential Prompts               ║"
    echo "║              Pure Markdown Templates                         ║"  
    echo "╚═══════════════════════════════════════════════════════════════╝${NC}"
}

create_prompts_structure() {
    echo "📁 Creating prompts structure..."
    
    # Create directories
    mkdir -p .claude/prompts/analysis/{product,quality,architecture,testing,integration}
    mkdir -p .claude/prompts/{templates,workflows}
    
    echo -e "${GREEN}✅ Prompts directory structure created${NC}"
}

create_analyze_command() {
    echo "🎮 Creating /analyze command..."
    
    cat > .claude/commands/analyze.md << 'ANALYZE_EOF'
# /analyze - Deep Analysis Using Expert Prompts

**Usage:** `/analyze [type] [scope]`
**Types:** product, quality, architecture, testing, integration

## Quick Analysis

### Product Context Analysis
```
@.claude/prompts/analysis/product/context_analysis_template.md
```
Copy to `product_analysis_[scope]_[date].md` and complete.

### Code Quality Analysis  
```
@.claude/prompts/analysis/quality/code_review_template.md
```
Copy to `quality_analysis_[scope]_[date].md` and complete.

### Architecture Analysis
```
@.claude/prompts/analysis/architecture/assessment_template.md
```
Copy to `architecture_analysis_[scope]_[date].md` and complete.

### Testing Strategy Analysis
```
@.claude/prompts/analysis/testing/strategy_analysis_template.md
```
Copy to `testing_analysis_[scope]_[date].md` and complete.

### Integration Analysis
```
@.claude/prompts/analysis/integration/review_template.md
```
Copy to `integration_analysis_[scope]_[date].md` and complete.

## Multi-Perspective Analysis

For comprehensive evaluation:
1. Load all five prompt templates
2. Complete systematic analysis from each perspective
3. Update relevant agent contexts with findings
4. Prioritize actions by impact and effort

## What This Accomplishes
- ✅ Expert-level systematic analysis
- ✅ Comprehensive quality assessment
- ✅ Actionable recommendations with priorities
- ✅ Integration with agent system
- ✅ Historical tracking of analysis results
ANALYZE_EOF
    
    echo -e "${GREEN}✅ /analyze command created${NC}"
}

create_product_analysis_template() {
    echo "🎯 Creating Product Context Analysis template..."
    
    cat > .claude/prompts/analysis/product/context_analysis_template.md << 'PRODUCT_EOF'
# Product Context Analysis Template

**Analysis Date:** [DATE]
**Analyst:** [YOUR NAME]  
**Scope:** [Feature/Project/Component being analyzed]

## Context Completeness Assessment

### Requirements Analysis
**Status:** [COMPLETE/PARTIAL/UNCLEAR/MISSING]

#### User Stories Review
- [ ] All user stories have clear acceptance criteria
- [ ] Edge cases and error scenarios identified
- [ ] User journey flows documented end-to-end
- [ ] Success metrics defined for each story

**User Story Quality Score:** ___/10

**Gaps Identified:**
1. 
2. 
3. 

#### Business Logic Documentation  
- [ ] Core business rules explicitly documented
- [ ] Validation requirements clearly defined
- [ ] Data transformation rules specified
- [ ] Integration business logic mapped

**Business Logic Clarity Score:** ___/10

### Context Quality Gates

#### Gate 1: Requirements Completeness
- [ ] All user stories complete with acceptance criteria
- [ ] Business rules documented and validated
- [ ] Integration requirements specified
- [ ] Success metrics defined

**Gate 1 Status:** [PASS/FAIL]

#### Gate 2: Context Depth
- [ ] User journeys mapped end-to-end
- [ ] Edge cases identified and planned
- [ ] Error scenarios documented
- [ ] Data validation rules complete

**Gate 2 Status:** [PASS/FAIL]

## Recommendations by Priority

### Critical (Blocks Development)
1. **Issue:** [Description]
   **Impact:** [Why this blocks development]
   **Action:** [Specific steps to resolve]

### Important (Impacts Quality/Future Maintainability)
1. **Issue:** [Description]
   **Impact:** [Long-term consequences]
   **Action:** [Recommended approach]

### Optimization (Enhances Development Velocity)
1. **Enhancement:** [Description]
   **Benefit:** [How this helps]
   **Effort:** [Implementation complexity]

## Overall Assessment
**Context Completeness:** ___/10
**Requirements Quality:** ___/10
**Development Readiness:** [READY/NEEDS WORK/BLOCKED]

---
*Focus on maintaining extreme context depth while ensuring practical development velocity.*
PRODUCT_EOF
    
    echo -e "${GREEN}✅ Product analysis template created${NC}"
}

create_quality_review_template() {
    echo "🔍 Creating Code Quality Review template..."
    
    cat > .claude/prompts/analysis/quality/code_review_template.md << 'QUALITY_EOF'
# Code Quality Review Template

**Review Date:** [DATE]
**Reviewer:** [YOUR NAME]
**Scope:** [Files/Components/Feature being reviewed]
**Review Type:** [PRE-COMMIT/POST-IMPLEMENTATION/REFACTORING/AUDIT]

## Code Standards Review

### Standards Compliance Assessment
- [ ] Variables use clear, descriptive names
- [ ] Functions/methods follow naming patterns
- [ ] Classes/modules named appropriately
- [ ] Code organization follows project patterns
- [ ] Import statements organized and minimal

**Standards Compliance Score:** ___/10

### Error Handling and Security
- [ ] All error conditions identified and handled
- [ ] User-facing error messages clear and helpful
- [ ] Input sanitization implemented
- [ ] Authentication/authorization correctly applied
- [ ] No hardcoded secrets or credentials

**Security Score:** ___/10

## Logic Correctness Assessment

### Business Rule Implementation
- [ ] Business rules correctly implemented in code
- [ ] Algorithm efficiency appropriate for data size
- [ ] Database queries optimized
- [ ] Performance acceptable for use case

**Logic Correctness Score:** ___/10

### Maintainability Assessment
- [ ] Code is self-documenting
- [ ] Complex logic has explanatory comments
- [ ] Function/method purposes clear
- [ ] Dependencies injected/mockable for testing

**Maintainability Score:** ___/10

## Quality Issues Classification

### Blocking Issues (Must Fix Before Deployment)
1. **Issue:** [description]
   **Location:** [file:line]
   **Risk:** [what could go wrong]
   **Fix:** [specific action needed]

### Critical Issues (Should Fix Before Deployment)  
1. **Issue:** [description]
   **Impact:** [business/technical impact]
   **Fix:** [recommended approach]

### Quality Improvements (Enhance Maintainability/Performance)
1. **Improvement:** [what to enhance]
   **Benefit:** [why it helps]
   **Effort:** [implementation complexity]

## Overall Assessment
- **Standards Compliance:** ___/10
- **Security:** ___/10
- **Logic Correctness:** ___/10
- **Maintainability:** ___/10

**Overall Code Quality:** ___/40

**Deployment Recommendation:** [APPROVE/APPROVE WITH CONDITIONS/REJECT]

---
*Focus on preventing production issues while maintaining development velocity.*
QUALITY_EOF
    
    echo -e "${GREEN}✅ Quality review template created${NC}"
}

create_architecture_template() {
    echo "🏗️ Creating Architecture Assessment template..."
    
    cat > .claude/prompts/analysis/architecture/assessment_template.md << 'ARCH_EOF'
# Architecture Assessment Template

**Assessment Date:** [DATE]
**Architect:** [YOUR NAME]
**Scope:** [System/Component/Feature being assessed]

## Design Pattern Analysis

### Current Architectural Patterns
- [ ] Patterns applied consistently across similar components
- [ ] Pattern boundaries clear and well-defined
- [ ] Anti-patterns avoided or mitigated
- [ ] New code follows established patterns

**Pattern Consistency Score:** ___/10

### Component Coupling and Cohesion
- [ ] High cohesion within components/modules
- [ ] Low coupling between components/modules
- [ ] Dependencies flow in consistent direction
- [ ] Circular dependencies avoided

**Coupling/Cohesion Score:** ___/10

## Scalability and Performance

### System Scalability Patterns
- [ ] Stateless components where appropriate
- [ ] Database scaling strategy defined
- [ ] Load balancing considerations addressed
- [ ] Resource pooling implemented

**Scalability Score:** ___/10

### Performance Architecture Review
- [ ] Database query patterns optimized
- [ ] Caching strategy implemented appropriately
- [ ] Resource utilization efficient
- [ ] Network communication optimized

**Performance Score:** ___/10

## Technical Debt Assessment

### Architectural Technical Debt
**Debt Level:** [LOW/MEDIUM/HIGH/CRITICAL]

**Major Debt Items:**
1. **Area:** [component/system area]
   **Debt:** [what's problematic]
   **Impact:** [current and future cost]
   **Priority:** [HIGH/MEDIUM/LOW]

## Architecture Recommendations

### Immediate (Critical Issues)
1. **Issue:** [critical problem]
   **Risk:** [what could go wrong]
   **Fix:** [specific action needed]

### Strategic (Long-term Health)
1. **Improvement:** [strategic enhancement]
   **Benefit:** [long-term value]
   **Timeline:** [when to implement]

## Overall Assessment
- **Design Patterns:** ___/10
- **Scalability:** ___/10
- **Performance:** ___/10
- **Technical Debt:** ___/10 (10 = low debt)

**Overall Architecture Score:** ___/40
**Architecture Health:** [EXCELLENT/GOOD/FAIR/CONCERNING/CRITICAL]

---
*Focus on sustainable architecture that supports rapid development and long-term maintainability.*
ARCH_EOF
    
    echo -e "${GREEN}✅ Architecture template created${NC}"
}

create_testing_template() {
    echo "🧪 Creating Testing Strategy template..."
    
    cat > .claude/prompts/analysis/testing/strategy_analysis_template.md << 'TESTING_EOF'
# Testing Strategy Analysis Template

**Analysis Date:** [DATE]
**Test Engineer:** [YOUR NAME]
**Scope:** [System/Feature/Component being analyzed]

## Test Coverage Analysis

### Current Coverage Assessment
- **Unit Test Coverage:** ___%  (Target: ___%)
- **Integration Test Coverage:** ___%  (Target: ___%)
- **End-to-End Test Coverage:** ___%  (Target: ___%)

**Coverage Quality Assessment:**
- [ ] Coverage metrics reflect actual risk coverage
- [ ] Critical paths have comprehensive test coverage
- [ ] Edge cases covered in tests
- [ ] Error conditions tested thoroughly

**Coverage Quality Score:** ___/10

### Test Effectiveness Analysis
- [ ] Tests catch real defects (not just code coverage)
- [ ] Test failures indicate actual problems
- [ ] Tests provide clear failure diagnostics
- [ ] Test execution time reasonable

**Test Effectiveness Score:** ___/10

## Risk-Based Testing Assessment

### High-Risk Component Identification
**Critical Risk Areas:**
1. **Component:** [high-risk area]
   **Risk Type:** [security/performance/business-critical]
   **Current Testing:** [what testing exists]
   **Additional Testing Needed:** [what's missing]

**Risk Coverage Score:** ___/10

### Edge Case and Error Testing
- [ ] Boundary value testing implemented
- [ ] Invalid input handling tested
- [ ] Network failure scenarios simulated
- [ ] Concurrent access patterns tested

**Edge Case Testing Score:** ___/10

## Testing Recommendations

### Critical Gaps (Missing Tests That Pose Significant Risk)
1. **Gap:** [what testing is missing]
   **Risk:** [potential production impact]
   **Action:** [specific tests to implement]

### Quality Improvements (Enhance Test Reliability)
1. **Improvement:** [what to enhance]
   **Benefit:** [why this helps]
   **Implementation:** [how to achieve]

### Automation Opportunities
1. **Target:** [what to automate]
   **Current Process:** [manual process]
   **ROI:** [effort vs benefit]

## Overall Assessment
- **Test Coverage:** ___/10
- **Test Effectiveness:** ___/10
- **Risk Coverage:** ___/10
- **Edge Case Testing:** ___/10

**Overall Testing Health:** ___/40
**Testing Maturity:** [COMPREHENSIVE/GOOD/BASIC/MINIMAL]

---
*Focus on comprehensive testing that prevents production issues and enables confident deployment.*
TESTING_EOF
    
    echo -e "${GREEN}✅ Testing template created${NC}"
}

create_integration_template() {
    echo "🔗 Creating Integration Review template..."
    
    cat > .claude/prompts/analysis/integration/review_template.md << 'INTEGRATION_EOF'
# Integration Review Template

**Review Date:** [DATE]
**Reviewer:** [YOUR NAME]
**Integration Scope:** [System/Service/Component integrations being reviewed]

## Cross-Component Integration Analysis

### Component Communication Patterns
- [ ] Communication patterns consistent across similar integrations
- [ ] Data serialization/deserialization efficient
- [ ] Protocol selection justified and documented
- [ ] Message schemas versioned and backward compatible

**Communication Quality Score:** ___/10

### Data Flow and Transformation
- [ ] Data transformations preserve semantic meaning
- [ ] Data validation comprehensive at integration boundaries
- [ ] Data consistency maintained across integrations
- [ ] Data lineage traceable for auditing

**Data Flow Score:** ___/10

## External System Integration

### Third-Party Service Integration
**External Dependencies:**
1. **Service:** [external service name]
   **Purpose:** [why integrated]
   **Reliability:** [SLA/uptime expectations]
   **Fallback Strategy:** [backup plan]
   **Security:** [authentication/data protection]

**External Integration Score:** ___/10

### Integration Resilience
- [ ] Circuit breaker patterns implemented
- [ ] Timeout and retry logic configured
- [ ] Rate limiting respected and handled
- [ ] Graceful degradation when services unavailable

**Resilience Score:** ___/10

## End-to-End Workflow Validation

### User Journey Implementation
**Primary Workflows:**
1. **Workflow:** [end-to-end user journey]
   **Systems Involved:** [list of systems]
   **Integration Points:** [where systems connect]
   **Error Handling:** [how failures handled]

**Workflow Integration Score:** ___/10

## Integration Quality Gates

### System-Breaking Issues
1. **Issue:** [critical integration failure]
   **Systems Affected:** [what stops working]
   **Fix:** [immediate resolution needed]

### User-Impacting Issues
1. **Issue:** [integration problem affecting users]
   **Impact:** [how UX degraded]
   **Fix:** [proper resolution]

### Performance Issues  
1. **Bottleneck:** [performance issue]
   **Current Performance:** [baseline]
   **Target:** [required performance]
   **Optimization:** [how to improve]

## Overall Assessment
- **Communication Patterns:** ___/10
- **Data Flow:** ___/10
- **External Integration:** ___/10
- **Resilience:** ___/10
- **Workflow Integration:** ___/10

**Overall Integration Health:** ___/50
**Integration Maturity:** [SEAMLESS/SOLID/FUNCTIONAL/FRAGILE/BROKEN]

---
*Focus on seamless system integration that delivers reliable user experiences and operational excellence.*
INTEGRATION_EOF
    
    echo -e "${GREEN}✅ Integration template created${NC}"
}

create_usage_guide() {
    echo "📚 Creating usage guide..."
    
    cat > .claude/prompts/usage_guide.md << 'GUIDE_EOF'
# Essential Prompts Usage Guide

## The Five Expert Analysis Templates

### 1. Product Context Analysis
**File:** `.claude/prompts/analysis/product/context_analysis_template.md`
**Use for:** Requirements analysis, user story validation, business alignment

### 2. Code Quality Review  
**File:** `.claude/prompts/analysis/quality/code_review_template.md`
**Use for:** Code reviews, quality gates, production readiness

### 3. Architecture Assessment
**File:** `.claude/prompts/analysis/architecture/assessment_template.md` 
**Use for:** System design review, scalability planning, technical debt

### 4. Testing Strategy Analysis
**File:** `.claude/prompts/analysis/testing/strategy_analysis_template.md`
**Use for:** Test coverage analysis, risk assessment, testing strategy

### 5. Integration Review
**File:** `.claude/prompts/analysis/integration/review_template.md`
**Use for:** System integration health, workflow validation, performance

## How to Use

### Step 1: Copy Template
```bash
# Copy template to working file
cp .claude/prompts/analysis/[type]/[template].md analysis_[scope]_$(date +%Y%m%d).md
```

### Step 2: Load Context
```
@CLAUDE.md
@.claude/context/agents/[relevant-agent].md  
@.claude/context/health/dashboard.md
```

### Step 3: Complete Analysis
- Fill in all template sections
- Use objective scoring where provided
- Document specific examples and locations
- Focus on actionable recommendations

### Step 4: Update Agent Contexts
After analysis, update relevant agent files with findings.

### Step 5: Update Project Health
Reflect analysis results in health dashboard.

## Quick Access via /analyze Command

- `/analyze product feature-name` - Product context analysis
- `/analyze quality component-name` - Code quality review
- `/analyze architecture system-part` - Architecture assessment  
- `/analyze testing coverage-area` - Testing strategy analysis
- `/analyze integration workflow-name` - Integration review

## Integration with Agent System

Each analysis type corresponds to agent expertise:
- **Product Analysis** → Update Product Engineer agent context
- **Quality Analysis** → Update QA Engineer agent context
- **Architecture Analysis** → Update Architect agent context
- **Testing Analysis** → Update Test Engineer agent context
- **Integration Analysis** → Update multiple agent contexts

## Best Practices

### Analysis Preparation
- Define scope clearly before starting
- Load all relevant context files
- Set aside adequate time for thoroughness

### During Analysis  
- Be objective in scoring and assessment
- Document specific examples rather than generalities
- Focus on actionable insights over theoretical issues

### Post-Analysis Actions
- Update agent contexts immediately
- Create action items with owners and timelines
- Share findings with stakeholders
- Schedule follow-up analysis as needed

---

The prompt system provides expert-level analysis frameworks that integrate seamlessly with the agent system and project health monitoring - all using pure Markdown templates.
GUIDE_EOF
    
    echo -e "${GREEN}✅ Usage guide created${NC}"
}

update_claude_md() {
    echo "📝 Updating CLAUDE.md..."
    
    # Check if CLAUDE.md exists and update it
    if [ -f "CLAUDE.md" ]; then
        # Create backup
        cp CLAUDE.md CLAUDE.md.backup
        
        # Add prompts section if not already present
        if ! grep -q "Essential Prompts" CLAUDE.md; then
            # Add after the commands section
            sed -i '/### ✅ Available Commands/a\\n### 📝 Essential Prompts (Expert Analysis Templates)\n- **Product Context Analysis** - Deep requirements and business alignment\n- **Code Quality Review** - Comprehensive code quality assessment  \n- **Architecture Assessment** - System design and scalability evaluation\n- **Testing Strategy Analysis** - Testing coverage and risk assessment\n- **Integration Review** - Cross-system integration health analysis\n\n### 🎯 Analysis Command\n- `/analyze [type] [scope]` - Access expert analysis templates' CLAUDE.md
        fi
        
        echo -e "${GREEN}✅ CLAUDE.md updated with prompts information${NC}"
    else
        echo -e "${YELLOW}ℹ️  CLAUDE.md not found - skipping update${NC}"
    fi
}

main() {
    print_header
    
    echo "🚀 Setting up Essential Prompts System..."
    echo ""
    
    create_prompts_structure
    create_analyze_command
    create_product_analysis_template
    create_quality_review_template
    create_architecture_template
    create_testing_template
    create_integration_template
    create_usage_guide
    update_claude_md
    
    echo ""
    echo -e "${GREEN}🎉 Essential Prompts System Setup Complete!${NC}"
    echo ""
    echo -e "${BLUE}📝 What was created:${NC}"
    echo "   📋 5 Expert Analysis Templates"
    echo "   🎯 /analyze command for easy access"
    echo "   📚 Comprehensive usage guide"
    echo ""
    echo -e "${YELLOW}🚀 Quick Test:${NC}"
    echo "   1. Try: /analyze"
    echo "   2. Load: @.claude/prompts/analysis/product/context_analysis_template.md"
    echo "   3. Guide: @.claude/prompts/usage_guide.md"
    echo ""
    echo -e "${GREEN}✅ All templates are pure Markdown - no scripts required!${NC}"
}

main "$@"