---
description: Update the linked codebases to the latest version
agent: build
---

# Update Command

This command updates all the linked codebases to their latest versions by pulling fresh changes from the upstream repositories.

You will need to run the following commands in this directory: `~/.support-agents`

## Instructions

Execute the following git subtree pull commands in sequence to update each repository:

1. **Update Drizzle ORM**

   ```bash
   git subtree pull --prefix resources/drizzle-orm https://github.com/drizzle-team/drizzle-orm.git beta --squash
   ```

2. **Update Effect.ts**

   ```bash
   git subtree pull --prefix resources/effect https://github.com/Effect-TS/effect.git main --squash
   ```

3. **Update Svelte docs**

   ```bash
   git subtree pull --prefix resources/svelte.dev https://github.com/sveltejs/svelte.dev.git main --squash
   ```

4. **Update OpenCode**

   ```bash
   git subtree pull --prefix resources/opencode https://github.com/sst/opencode.git dev --squash
   ```

Each command will fetch the latest changes from the upstream repository and merge them into the local subtree. There should be no conflicts, if there are ask the user what they want to do.
