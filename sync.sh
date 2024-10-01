#!/bin/sh

# Capture the latest commit message from private branch
commit_message=$(git log -1 --pretty=%B)

# Switch to the main branch
git checkout main

# Bring over changes from private, excluding the Papers/ folder
git checkout private -- .  # Check out changes from private
git reset HEAD Papers/     # Unstage changes in Papers/
git add .                  # Add remaining changes
git commit -m "$commit_message"  # Use the same commit message as in private
git push origin main       # Push changes to main

# Switch back to the private branch
git checkout private
