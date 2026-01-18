# Support Agents

A practical approach to enhancing coding agent responses by including source code from libraries and frameworks as git subtrees.

## Included Libraries

- **Drizzle ORM** (beta branch) - `resources/drizzle-orm-beta`
- **Drizzle ORM** (main branch) - `resources/drizzle-orm-main`
- **Effect.ts** (main branch) - `resources/effect`
- **Svelte** (main branch) - `resources/svelte.dev`
- **OpenCode** (dev branch) - `resources/opencode`

## Setup

### Linux / macOS

#### 1. Clone the repository

```bash
git clone <your-repo-url> ~/.support-agents
```

#### 2. Initialize OpenCode assets

Run the init script:

```bash
~/.support-agents/init.sh
```

Or manually copy the assets:

```bash
# Create OpenCode config directories if they don't exist
mkdir -p ~/.config/opencode/agent
mkdir -p ~/.config/opencode/command
mkdir -p ~/.config/opencode/themes

# Copy assets (only overwrites if source is newer)
rsync -u ~/.support-agents/OPENCODE_ASSETS/agent/* ~/.config/opencode/agent/
rsync -u ~/.support-agents/OPENCODE_ASSETS/command/* ~/.config/opencode/command/
rsync -u ~/.support-agents/OPENCODE_ASSETS/themes/* ~/.config/opencode/themes/
```

### Windows

#### 1. Clone the repository

```powershell
git clone <your-repo-url> $env:USERPROFILE\.support-agents
```

#### 2. Initialize OpenCode assets

Run the PowerShell init script:

```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.support-agents\init.ps1"
```

This will copy assets to `%APPDATA%\opencode\` (typically `C:\Users\<username>\AppData\Roaming\opencode\`).

## Updating Libraries

To pull the latest changes from upstream:

```bash
cd ~/.support-agents

# Drizzle ORM (beta)
git subtree pull --prefix=resources/drizzle-orm-beta https://github.com/drizzle-team/drizzle-orm.git beta --squash

# Drizzle ORM (main)
git subtree pull --prefix=resources/drizzle-orm-main https://github.com/drizzle-team/drizzle-orm.git main --squash

# Effect.ts
git subtree pull --prefix=resources/effect https://github.com/Effect-TS/effect.git main --squash

# Svelte
git subtree pull --prefix=resources/svelte.dev https://github.com/sveltejs/svelte.dev.git main --squash

# OpenCode
git subtree pull --prefix=resources/opencode https://github.com/sst/opencode.git dev --squash
```

## Adding More Libraries

To add a new library as a subtree:

```bash
cd ~/.support-agents
git subtree add --prefix=resources/<library-name> <repo-url> <branch> --squash
```

Then create corresponding command files in `OPENCODE_ASSETS/command/` and update the agent file.

## Structure

```
~/.support-agents/
├── OPENCODE_ASSETS/
│   ├── agent/           # Agent configuration files
│   ├── command/         # Slash command definitions
│   └── themes/          # OpenCode themes
├── resources/
│   ├── drizzle-orm-beta/ # Drizzle ORM source (beta branch)
│   ├── drizzle-orm-main/ # Drizzle ORM source (main branch)
│   ├── effect/          # Effect.ts source (main branch)
│   ├── svelte.dev/      # Svelte docs (main branch)
│   └── opencode/        # OpenCode source (dev branch)
├── init.sh              # Setup script (Linux/macOS)
├── init.ps1             # Setup script (Windows)
└── README.md
```
