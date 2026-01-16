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
   git subtree pull --prefix resources/drizzle-orm https://github.com/drizzle-team/drizzle-orm.git beta
   ```

Each command will fetch the latest changes from the upstream repository and merge them into the local subtree. There should be no conflicts, if there are ask the user what they want to do.
