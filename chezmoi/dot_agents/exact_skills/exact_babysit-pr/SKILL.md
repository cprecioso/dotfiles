---
name: babysit-pr
description: Monitor a PR's CI checks, automatically fix and push failures until CI passes. Retries flaky Railway/Fly deploy jobs. Use when user wants to babysit a PR, watch CI, or auto-fix CI failures.
---

## Instructions

Watch the current PR's CI with a **persistent background Monitor**, and act only when a check fails or all checks pass. Do not poll on a timer from the agent loop -- let the monitor emit events and react to them.

### 1. Arm the monitor

Start a persistent Monitor (`persistent: true`) on the PR for the current branch. The script polls `gh pr checks` and emits one line per check that lands in a terminal state, plus a final line when everything has passed. It must emit on **every** terminal state (failures included), never only on success -- otherwise a crashed or hung check is indistinguishable from "still pending".

```bash
prev=""
while true; do
  s=$(gh pr checks --json name,bucket,link 2>/dev/null) || { sleep 30; continue; }
  cur=$(jq -r '.[] | select(.bucket!="pending") | "\(.bucket)\t\(.name)\t\(.link)"' <<<"$s" | sort)
  # emit only newly-terminal checks since last poll
  comm -13 <(echo "$prev") <(echo "$cur")
  prev=$cur
  if jq -e 'all(.bucket!="pending")' <<<"$s" >/dev/null; then
    if jq -e 'all(.bucket=="pass" or .bucket=="skipping")' <<<"$s" >/dev/null; then
      echo "ALL_PASS"
    fi
    break
  fi
  sleep 30
done
```

Use a clear `description` like `CI checks for PR <branch>`.

### 2. React to each event

Each emitted line is `<bucket>\t<name>\t<link>`. Decide per event:

- **`pass` / `skipping`**: nothing to do.
- **`cancel`**: could be because of a new CI run is scheduled (wait and check again), or because the CI failed or the user manually canceled it (TaskStop)
- **`fail` on deploy jobs**: first time it happens, treat as **flaky** and retry with `gh run rerun <run-id> --failed`
- **other `fail`s**: needs an investigation and possibly a code fix
- **`ALL_PASS`**: report success, **stop the monitor** (TaskStop) -- done

### 3. When a check fails

1. Read the failed job's logs: `gh run view <run-id> --log-failed`.
2. Fix the issue in the code.
3. Commit and push. If commit or push hangs or times out due to GPG signing, retry with signing disabled (`git -c commit.gpgsign=false commit ...` and/or `git -c push.gpgSign=false push`).
4. The push starts a new CI run; the monitor will emit its results as new events.

### 4. Re-arming after a fix or retry

A push or rerun starts a fresh CI run. If the monitor exited (because all checks for the previous run were terminal), arm a new monitor for the new run. If you used a persistent monitor that is still polling, it will pick up the new run's checks automatically. Keep watching until you see `ALL_PASS`, then stop the monitor.
