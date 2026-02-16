# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
.dotfiles/
├── claude-code/        # Claude Code configuration
│   └── .claude/
│       ├── CLAUDE.md   # Global instructions
│       ├── commands/   # Custom slash commands
│       ├── skills/     # Custom skills
│       └── settings.json
├── mise/               # Mise configuration
│   └── config.toml
└── scripts/            # Helper scripts
    └── sync-dotfiles   # Stow sync script
```

## Installation

### Prerequisites

```bash
# Install GNU Stow
brew install stow
```

### Initial Setup

```bash
cd ~/.dotfiles
stow claude-code
stow mise
```

Or use the sync script:

```bash
./scripts/sync-dotfiles
```

## Sync Script

The `sync-dotfiles` script automates symlink management with stow.

### Usage

```bash
# Sync all packages
./scripts/sync-dotfiles

# Sync specific package
./scripts/sync-dotfiles claude-code

# Preview changes without applying
./scripts/sync-dotfiles --dry-run

# Show help
./scripts/sync-dotfiles --help
```

### Adding New Content

When you add new files or directories to any package:

```bash
cd ~/.dotfiles
./scripts/sync-dotfiles
```

The script will automatically create/update symlinks in your home directory.

## Packages

### claude-code

Claude Code CLI configuration including:
- **CLAUDE.md** - Global instructions for all projects
- **skills/** - Custom skills (testing, remotion, etc.)
- **commands/** - Custom slash commands
- **settings.json** - Editor settings

### mise

[Mise](https://mise.jdx.dev/) version manager configuration.

## Notes

- Files listed in `.stow-local-ignore` won't be symlinked
- Use `stow --restow` to refresh symlinks after changes
- The sync script handles this automatically
