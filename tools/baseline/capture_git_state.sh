#!/bin/sh
set -eu

usage() {
    echo "Usage: tools/baseline/capture_git_state.sh OUT_DIR" >&2
}

if [ "$#" -ne 1 ]; then
    usage
    exit 2
fi

OUT_DIR=$1
mkdir -p "$OUT_DIR"

git_cmd() {
    if [ "${GIT_SAFE_DIRECTORY:-}" != "" ]; then
        git -c safe.directory="$GIT_SAFE_DIRECTORY" "$@"
    else
        git "$@"
    fi
}

capture() {
    out_file=$1
    shift
    {
        echo "# Command: git $*"
        echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
        if ! git_cmd "$@"; then
            echo "# Command failed"
        fi
    } > "$out_file" 2>&1
}

capture "$OUT_DIR/git-status.txt" status --short --branch
capture "$OUT_DIR/git-branch.txt" branch -vv
capture "$OUT_DIR/git-head.txt" show -s --format=fuller HEAD
capture "$OUT_DIR/git-remotes.txt" remote -v

{
    echo "# Command: git diff --stat"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    if ! git_cmd diff --stat; then
        echo "# Command failed: git diff --stat"
    fi
    echo
    echo "# Command: git diff --cached --stat"
    if ! git_cmd diff --cached --stat; then
        echo "# Command failed: git diff --cached --stat"
    fi
} > "$OUT_DIR/git-diff-stat.txt" 2>&1
