#!/bin/bash

# Support Agents Init Script
# Sets up OpenCode configuration

set -e

echo "Setting up Support Agents..."

# OpenCode setup
echo "Configuring OpenCode..."
mkdir -p ~/.config/opencode/agent
mkdir -p ~/.config/opencode/command
mkdir -p ~/.config/opencode/themes

rsync -u ~/.support-agents/OPENCODE_ASSETS/agent/* ~/.config/opencode/agent/
rsync -u ~/.support-agents/OPENCODE_ASSETS/command/* ~/.config/opencode/command/
rsync -u ~/.support-agents/OPENCODE_ASSETS/themes/* ~/.config/opencode/themes/

echo "Done! OpenCode assets installed to ~/.config/opencode/"
echo ""
echo "Available commands:"
echo "  /drizzle      - Get info about Drizzle ORM"
echo "  /effect       - Get info about Effect.ts"
echo "  /svelte       - Get info about Svelte"
echo "  /opencode     - Get info about OpenCode"
echo "  /docs-update  - Update library subtrees"
echo ""
echo "Available agents:"
echo "  docs-support-agent - Expert agent for library documentation"
