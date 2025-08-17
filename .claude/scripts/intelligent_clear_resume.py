#!/usr/bin/env python3
"""
Intelligent Context Clear and Resume System

Automatically captures full context, performs housekeeping, clears the session,
and provides immediate resumption instructions for Claude Code.
"""

import os
import sys
import json
import subprocess
from pathlib import Path
from datetime import datetime, timezone
from typing import Dict, List, Optional, Any

# Add the scripts directory to Python path for imports
script_dir = Path(__file__).parent
sys.path.insert(0, str(script_dir))

# Import housekeeping module (you'll need to create this or adapt existing)
try:
    from housekeeping import HousekeepingManager, SessionSnapshot
except ImportError:
    # Fallback if housekeeping module doesn't exist yet
    print("⚠️  Warning: housekeeping module not found. Creating minimal implementation.")
    
    class SessionSnapshot:
        def __init__(self, session_id: str, timestamp: str, **kwargs):
            self.session_id = session_id
            self.timestamp = timestamp
            for key, value in kwargs.items():
                setattr(self, key, value)
    
    class HousekeepingManager:
        def __init__(self, project_root: Path):
            self.project_root = project_root
            self.housekeeping_dir = project_root / ".housekeeping"
            self.housekeeping_dir.mkdir(exist_ok=True)
        
        def read_claude_md(self) -> Dict:
            claude_md_path = self.project_root / "CLAUDE.md"
            if not claude_md_path.exists():
                return {}
            
            content = claude_md_path.read_text(encoding='utf-8')
            # Parse current status section
            current_status = {}
            in_status = False
            for line in content.split('\n'):
                if line.strip() == "## Current Status":
                    in_status = True
                    continue
                elif line.startswith('##') and in_status:
                    break
                elif in_status and ':' in line:
                    key, value = line.split(':', 1)
                    current_status[key.strip('- *')] = value.strip()
            
            return {'current_status': current_status}
        
        def read_task_file(self) -> Dict:
            tasks_dir = self.project_root / "!xcc" / "tasks"
            if not tasks_dir.exists():
                tasks_dir = self.project_root / "tasks"
            
            if not tasks_dir.exists():
                return {'pending_tasks': [], 'completed_tasks': []}
            
            # Find the most recent task file
            task_files = list(tasks_dir.glob("*.md"))
            if not task_files:
                return {'pending_tasks': [], 'completed_tasks': []}
            
            # Use the first task file found
            task_file = task_files[0]
            content = task_file.read_text(encoding='utf-8')
            
            pending_tasks = []
            completed_tasks = []
            
            for line in content.split('\n'):
                if '- [ ]' in line:
                    pending_tasks.append(line.strip())
                elif '- [x]' in line:
                    completed_tasks.append(line.strip())
            
            return {'pending_tasks': pending_tasks, 'completed_tasks': completed_tasks}
        
        def capture_git_state(self) -> Dict:
            try:
                # Get git status
                status_result = subprocess.run(
                    ['git', 'status', '--porcelain'],
                    capture_output=True, text=True, cwd=self.project_root
                )
                
                # Get recent commits
                log_result = subprocess.run(
                    ['git', 'log', '--oneline', '-10'],
                    capture_output=True, text=True, cwd=self.project_root
                )
                
                return {
                    'status_files': status_result.stdout.strip().split('\n') if status_result.stdout.strip() else [],
                    'recent_commits': log_result.stdout.strip().split('\n') if log_result.stdout.strip() else []
                }
            except Exception as e:
                return {'status_files': [], 'recent_commits': [], 'error': str(e)}
        
        def capture_session_snapshot(self, context_summary: str, next_steps: List[str], notes: str) -> SessionSnapshot:
            session_id = datetime.now().strftime("%Y%m%d_%H%M%S")
            timestamp = datetime.now().isoformat()
            
            git_state = self.capture_git_state()
            task_data = self.read_task_file()
            claude_data = self.read_claude_md()
            
            return SessionSnapshot(
                session_id=session_id,
                timestamp=timestamp,
                context_summary=context_summary,
                next_steps=next_steps,
                notes=notes,
                git_state=git_state,
                task_data=task_data,
                claude_data=claude_data
            )
        
        def save_session_snapshot(self, snapshot: SessionSnapshot) -> Path:
            snapshot_file = self.housekeeping_dir / f"snapshot_{snapshot.session_id}.json"
            
            snapshot_data = {
                'session_id': snapshot.session_id,
                'timestamp': snapshot.timestamp,
                'context_summary': snapshot.context_summary,
                'next_steps': snapshot.next_steps,
                'notes': snapshot.notes,
                'git_state': snapshot.git_state,
                'task_data': snapshot.task_data,
                'claude_data': snapshot.claude_data
            }
            
            snapshot_file.write_text(json.dumps(snapshot_data, indent=2), encoding='utf-8')
            return snapshot_file
        
        def create_transcript_archive(self, session_id: str) -> Optional[Path]:
            # This would archive the current Claude Code transcript
            # For now, just create a placeholder
            transcript_file = self.housekeeping_dir / f"transcript_{session_id}.md"
            content = f"""# Session Transcript Archive - {session_id}

Generated: {datetime.now().isoformat()}

This would contain the archived transcript from Claude Code.
For automatic transcript archiving, you would need to:
1. Access Claude Code's transcript files
2. Copy/archive the current session
3. Parse and format for future reference

Current placeholder - implement based on Claude Code's transcript storage.
"""
            transcript_file.write_text(content, encoding='utf-8')
            return transcript_file
        
        def create_resumption_script(self, snapshot: SessionSnapshot) -> Path:
            resume_file = self.housekeeping_dir / f"resume_{snapshot.session_id}.md"
            
            content = f"""# Resume Session {snapshot.session_id}

Generated: {snapshot.timestamp}

## Context Summary
{snapshot.context_summary}

## Next Steps
{chr(10).join(f"- {step}" for step in snapshot.next_steps)}

## Notes
{snapshot.notes}

## Git State
- Modified files: {len(snapshot.git_state.get('status_files', []))}
- Recent commits: {len(snapshot.git_state.get('recent_commits', []))}

## Task Progress
- Completed: {len(snapshot.task_data.get('completed_tasks', []))}
- Pending: {len(snapshot.task_data.get('pending_tasks', []))}

## Quick Actions
1. Check git status: `git status`
2. Review pending tasks: `@!xcc/tasks/` or `@tasks/`
3. Continue from: {snapshot.context_summary}

## Files to Load
- `@CLAUDE.md` - Project memory
- `@!xcc/tasks/` - Current tasks
- `@!xcc/adrs/` - Architecture decisions
"""
            
            resume_file.write_text(content, encoding='utf-8')
            return resume_file
        
        def update_claude_md_with_housekeeping(self, snapshot: SessionSnapshot):
            claude_md_path = self.project_root / "CLAUDE.md"
            if not claude_md_path.exists():
                return
            
            content = claude_md_path.read_text(encoding='utf-8')
            
            # Update the current status section
            new_status = f"""## Current Status
- **Phase:** Context cleared and preserved
- **Last Session:** {datetime.now().strftime('%Y-%m-%d %H:%M')} - Intelligent context clear (Session {snapshot.session_id})
- **Next Steps:** {' | '.join(snapshot.next_steps[:2])}
- **Active Document:** Resume from @.housekeeping/resume_{snapshot.session_id}.md
- **Context Health:** Cleared and archived

## Housekeeping Status
- **Last Checkpoint:** {snapshot.timestamp} - Session {snapshot.session_id}
- **Last Transcript Save:** @.housekeeping/transcript_{snapshot.session_id}.md
- **Context Health:** Cleared and ready for fresh start
- **Quick Resume:** @.housekeeping/QUICK_RESUME.md
"""
            
            # Replace the current status section
            lines = content.split('\n')
            new_lines = []
            in_status = False
            in_housekeeping = False
            
            for line in lines:
                if line.strip() == "## Current Status":
                    in_status = True
                    new_lines.extend(new_status.split('\n'))
                    continue
                elif line.strip() == "## Housekeeping Status":
                    in_housekeeping = True
                    continue
                elif line.startswith('##') and (in_status or in_housekeeping):
                    in_status = False
                    in_housekeeping = False
                    new_lines.append(line)
                elif not (in_status or in_housekeeping):
                    new_lines.append(line)
            
            claude_md_path.write_text('\n'.join(new_lines), encoding='utf-8')


class IntelligentClearResume:
    """Manages intelligent context clearing and resumption."""
    
    def __init__(self, project_root: Path = None):
        """Initialize the clear/resume system."""
        self.project_root = project_root or Path.cwd()
        self.hk_manager = HousekeepingManager(self.project_root)
    
    def auto_detect_current_context(self) -> Dict[str, Any]:
        """Auto-detect what we're currently working on."""
        try:
            # Read CLAUDE.md for current status
            claude_md_data = self.hk_manager.read_claude_md()
            current_status = claude_md_data.get('current_status', {})
            
            # Read task file for progress
            task_data = self.hk_manager.read_task_file()
            
            # Get git changes
            git_state = self.hk_manager.capture_git_state()
            
            # Auto-generate context summary
            phase = current_status.get('Phase', 'Unknown phase')
            next_steps = current_status.get('Next Steps', 'Unknown next steps')
            
            # Detect recent changes
            recent_files = []
            if git_state.get('status_files'):
                for status_line in git_state['status_files'][:5]:  # Top 5 files
                    if len(status_line) >= 3:
                        filename = status_line[3:]
                        recent_files.append(filename)
            
            # Auto-generate summary
            summary = f"Working on {phase}. Next: {next_steps}"
            if recent_files:
                summary += f". Recently modified: {', '.join(recent_files[:3])}"
            
            # Extract next steps from current status
            next_steps_list = []
            if 'Next Steps' in current_status:
                # Try to parse next steps
                steps_text = current_status['Next Steps']
                if 'Task' in steps_text:
                    next_steps_list = [steps_text]
                else:
                    next_steps_list = [line.strip() for line in steps_text.split(',') if line.strip()]
            
            # Add fallback next steps based on pending tasks
            if not next_steps_list and task_data.get('pending_tasks'):
                next_steps_list = task_data['pending_tasks'][:3]  # First 3 pending tasks
            
            return {
                'summary': summary,
                'next_steps': next_steps_list,
                'notes': f"Auto-context clear at {datetime.now().strftime('%H:%M')}. "
                        f"Progress: {len(task_data.get('completed_tasks', []))} tasks done, "
                        f"{len(task_data.get('pending_tasks', []))} pending.",
                'detected_phase': phase,
                'recent_files': recent_files
            }
            
        except Exception as e:
            return {
                'summary': f"Context clear checkpoint - {datetime.now().strftime('%H:%M')}",
                'next_steps': ['Continue current work'],
                'notes': f"Auto-detected context (error: {str(e)})",
                'detected_phase': 'Unknown',
                'recent_files': []
            }
    
    def create_instant_resume_commands(self, session_id: str) -> str:
        """Create immediate resume commands for copy-paste."""
        
        # Detect if using !xcc structure or traditional structure
        xcc_exists = (self.project_root / "!xcc").exists()
        tasks_path = "!xcc/tasks/" if xcc_exists else "tasks/"
        adrs_path = "!xcc/adrs/" if xcc_exists else "adrs/"
        
        # Find actual task and ADR files
        task_files = []
        adr_files = []
        
        if xcc_exists:
            task_dir = self.project_root / "!xcc" / "tasks"
            adr_dir = self.project_root / "!xcc" / "adrs"
        else:
            task_dir = self.project_root / "tasks"
            adr_dir = self.project_root / "adrs"
        
        if task_dir.exists():
            task_files = [f.name for f in task_dir.glob("*.md")]
        if adr_dir.exists():
            adr_files = [f.name for f in adr_dir.glob("*.md")]
        
        # Essential context recovery
        commands = [
            f"# 🚀 INSTANT RESUME - Session {session_id}",
            "",
            "# 1. Load core project context",
            "@CLAUDE.md",
        ]
        
        # Add task files if they exist
        if task_files:
            commands.append(f"@{tasks_path}{task_files[0]}")
        
        # Add ADR files if they exist
        if adr_files:
            commands.append(f"@{adrs_path}{adr_files[0]}")
        
        commands.extend([
            "",
            "# 2. Load session resume script",
            f"@.housekeeping/resume_{session_id}.md",
            "",
            "# 3. Check current status", 
            "ls -la src/" if (self.project_root / "src").exists() else "ls -la",
            "git status",
            "",
            "# 4. Quick project overview",
            "/compact",
            "",
            "# ✅ READY TO CONTINUE!"
        ])
        
        return "\n".join(commands)
    
    def perform_intelligent_clear(self) -> Dict[str, Any]:
        """Perform intelligent context clear with auto-resume."""
        print("🧠 Performing intelligent context clear...")
        
        # Auto-detect current context
        context = self.auto_detect_current_context()
        
        print(f"📍 Detected: {context['detected_phase']}")
        print(f"📝 Summary: {context['summary']}")
        print(f"📋 Next Steps: {len(context['next_steps'])} items")
        
        # Perform housekeeping with detected context
        snapshot = self.hk_manager.capture_session_snapshot(
            context_summary=context['summary'],
            next_steps=context['next_steps'],
            notes=context['notes']
        )
        
        # Save snapshot
        snapshot_path = self.hk_manager.save_session_snapshot(snapshot)
        
        # Create transcript archive  
        transcript_path = self.hk_manager.create_transcript_archive(snapshot.session_id)
        
        # Create resume script
        resume_script = self.hk_manager.create_resumption_script(snapshot)
        
        # Update CLAUDE.md
        self.hk_manager.update_claude_md_with_housekeeping(snapshot)
        
        # Create instant resume commands
        instant_commands = self.create_instant_resume_commands(snapshot.session_id)
        
        # Create a quick resume file for immediate use
        quick_resume_path = self.project_root / ".housekeeping" / "QUICK_RESUME.md"
        quick_resume_path.write_text(instant_commands, encoding='utf-8')
        
        return {
            'session_id': snapshot.session_id,
            'snapshot_path': snapshot_path,
            'transcript_path': transcript_path, 
            'resume_script': resume_script,
            'quick_resume_path': quick_resume_path,
            'instant_commands': instant_commands,
            'detected_context': context
        }


def main():
    """Main execution for clear and resume."""
    print("🚀 Intelligent Context Clear & Resume")
    print("=====================================")
    
    try:
        # Handle command line arguments
        args = sys.argv[1:] if len(sys.argv) > 1 else []
        
        # Initialize system
        clear_resume = IntelligentClearResume()
        
        # Perform intelligent clear
        result = clear_resume.perform_intelligent_clear()
        
        print("\n✅ Context intelligently captured!")
        print(f"📸 Session: {result['session_id']}")
        print(f"📚 Archive: {result['transcript_path']}")
        print(f"🚀 Resume: {result['resume_script']}")
        
        print("\n" + "="*60)
        print("🎯 COPY-PASTE THESE COMMANDS TO RESUME:")
        print("="*60)
        print(result['instant_commands'])
        print("="*60)
        
        print(f"\n💡 Quick resume file: @.housekeeping/QUICK_RESUME.md")
        print("\n🧹 You can now safely use /clear - everything is preserved!")
        
        # Also save commands to a file for easy access
        commands_file = Path.cwd() / "RESUME_COMMANDS.txt"
        commands_file.write_text(result['instant_commands'])
        print(f"📄 Commands also saved to: {commands_file}")
        
        # Show additional context if arguments provided
        if args:
            print(f"\n📝 Additional context: {' '.join(args)}")
        
        return 0
        
    except Exception as e:
        print(f"❌ Error: {str(e)}")
        import traceback
        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())