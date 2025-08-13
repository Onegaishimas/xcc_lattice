# XCC Framework - New Project Setup

## Quick Setup: From Template to Your Project

### Prerequisites
- Git installed
- GitHub account
- VS Code with Claude Code extension

---

## Step-by-Step Process

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

### 4. Create New GitHub Repository
1. Go to [github.com](https://github.com)
2. Click **"+"** → **"New repository"**
3. Repository name: `your-project-name`
4. Set to **Public** or **Private**
5. **DO NOT** check "Add a README file"
6. Click **"Create repository"**

### 5. Initialize New Git Repository
```bash
git init
git add .
git commit -m "Initial commit: XCC Framework project setup"
git branch -M main
```

### 6. Connect to GitHub and Push
```bash
git remote add origin https://github.com/yourusername/your-project-name.git
git push -u origin main
```

**Authentication:** GitHub will prompt for:
- **Username:** `yourusername`
- **Password:** Use your Personal Access Token (not your GitHub password)

---

## What You Get

Your new project will have this structure:
```
your-project-name/
├── adrs/                        # Architecture Decision Records
├── CLAUDE.md                    # Project memory system
├── docs/                        # Additional documentation
├── instruct/                    # XCC Framework instruction files
├── prds/                        # Product Requirements Documents
├── tasks/                       # Task Lists
├── tdds/                        # Technical Design Documents
└── tids/                        # Technical Implementation Documents
```

---

## Quick Claude Code Start

### 1. Open Project in VS Code
```bash
code .
```

### 2. Start Claude Code Session
- Press `Ctrl+Shift+P` (Command Palette)
- Type: **"Claude Code: Start"**
- Or click the Claude Code icon in the sidebar

### 3. Load Context and Begin
```
# In Claude Code chat window:
@CLAUDE.md

@instruct/001_create-project-prd.md

I want to build [describe your project idea in detail]
```

### 4. Follow the Process
Claude will guide you through strategic questions to create your Project PRD:
- Project scope and timeline
- Target users and use cases  
- Success criteria and goals
- Feature breakdown and priorities

**Output:** `000_PPRD|[project-name].md` in `/prds/` folder

### 5. Continue the Workflow
After completing the Project PRD, follow the XCC sequence:
1. **ADR** (Architecture Decision Record) - `@instruct/002_create-adr.md`
2. **Feature PRDs** - `@instruct/003_create-feature-prd.md`
3. **Technical Design** - `@instruct/004_create-tdd.md`
4. **Implementation Guide** - `@instruct/005_create-tid.md`
5. **Task Generation** - `@instruct/006_generate-tasks.md`
6. **Development** - `@instruct/007_process-task-list.md`

---

**Setup Time:** ~3 minutes  
**Ready to Code:** Start with Project PRD creation!