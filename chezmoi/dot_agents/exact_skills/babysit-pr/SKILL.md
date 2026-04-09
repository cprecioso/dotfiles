---
name: babysit-pr
description: Monitor a PR's CI checks every 5 minutes, automatically fix and push failures until CI passes. Ignores flaky Railway/Fly deploy jobs. Use when user wants to babysit a PR, watch CI, or auto-fix CI failures.
---

## Instructions

Use the `/loop` skill to check the current PR's CI status every 5 minutes. Follow this procedure on each loop iteration:

### 1. Check CI status

Run `gh pr checks` (or `gh pr view --json statusCheckRollup`) to get the current state of all CI checks for the PR on the current branch.

### 2. Evaluate results

- **Ignore** any failures from the "Deploy to Railway" and "Deploy to Fly" jobs -- these are flaky deploy jobs and should not block you.
- Every other failing job is a real failure that needs fixing.

### 3. If all non-ignored checks pass (or are still pending)

- If all non-ignored checks have **passed**: report success and **cancel the loop**. The PR is green.
- If checks are still **pending** with none failing: do nothing, wait for the next loop iteration.

### 4. If any non-ignored check fails

1. Read the failed job's logs using `gh run view <run-id> --log-failed` to understand what went wrong.
2. Fix the issue in the code.
3. Commit and push. If the commit or push hangs or times out due to GPG signing, retry with signing disabled (`git -c commit.gpgsign=false commit ...` and/or `git -c push.gpgSign=false push`).
4. Wait for the next loop iteration to verify the fix.

### 5. Loop behavior

- Interval: **5 minutes**
- The loop continues until all non-ignored CI checks pass, at which point cancel it.
- If you fix a failure and push, the next iteration will check the new run.

Start by invoking: `/loop 5m check PR CI, fix failures, push again if needed`
