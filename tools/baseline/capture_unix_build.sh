#!/bin/sh
set -eu

usage() {
    cat >&2 <<'EOF'
Usage: tools/baseline/capture_unix_build.sh OUT_DIR

Capture the existing Unix build flow logs from src/:
  autoreconf -i
  ./configure
  make

Writes logs and status files under OUT_DIR.
EOF
}

if [ "$#" -eq 1 ] && { [ "$1" = "--help" ] || [ "$1" = "-h" ]; }; then
    usage
    exit 0
fi

if [ "$#" -ne 1 ]; then
    usage
    exit 2
fi

if [ ! -f "AGENTS.md" ] || [ ! -f "src/configure.ac" ] || [ ! -d "tools/baseline" ]; then
    echo "error: run this script from the repository root" >&2
    exit 1
fi

REPO_ROOT=$(pwd)
OUT_DIR=$1
case "$OUT_DIR" in
    /*) OUT_DIR_ABS=$OUT_DIR ;;
    *) OUT_DIR_ABS=$REPO_ROOT/$OUT_DIR ;;
esac

mkdir -p "$OUT_DIR_ABS"

STATUS_FILE=$OUT_DIR_ABS/build-status.txt
AUTORECONF_LOG=$OUT_DIR_ABS/autoreconf.log
CONFIGURE_LOG=$OUT_DIR_ABS/configure.log
MAKE_LOG=$OUT_DIR_ABS/make.log
SUMMARY_LOG=$OUT_DIR_ABS/warnings-summary.md
LAST_RC=0

{
    echo "# DECtalk Unix build log capture"
    echo "# Started at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Repository root: $REPO_ROOT"
    echo "# Output directory: $OUT_DIR_ABS"
    echo "# This capture does not prove behavior preservation."
    echo
} > "$STATUS_FILE"

append_status() {
    step=$1
    code=$2
    log_file=$3
    command_text=$4
    {
        echo "step: $step"
        echo "command: $command_text"
        echo "exit_code: $code"
        echo "log: $log_file"
        echo "timestamp: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
        echo
    } >> "$STATUS_FILE"
}

write_skipped_log() {
    log_file=$1
    reason=$2
    {
        echo "# Step skipped"
        echo "# Reason: $reason"
        echo "# Timestamp: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    } > "$log_file"
}

run_step() {
    step=$1
    log_file=$2
    command_text=$3
    shift 3

    echo "running $step: $command_text" >&2
    set +e
    (
        cd "$REPO_ROOT/src"
        "$@"
    ) > "$log_file" 2>&1
    rc=$?
    set -e
    LAST_RC=$rc

    append_status "$step" "$rc" "$log_file" "$command_text"
    if [ "$rc" -ne 0 ]; then
        echo "error: $step failed with exit code $rc; see $log_file" >&2
    fi
    return "$rc"
}

capture_git_state() {
    git_capture=$REPO_ROOT/tools/baseline/capture_git_state.sh
    if [ -x "$git_capture" ]; then
        echo "capturing git state" >&2
        set +e
        GIT_SAFE_DIRECTORY=${GIT_SAFE_DIRECTORY:-$REPO_ROOT} "$git_capture" "$OUT_DIR_ABS/git"
        rc=$?
        set -e
        append_status "git-state" "$rc" "$OUT_DIR_ABS/git" "$git_capture $OUT_DIR_ABS/git"
        if [ "$rc" -ne 0 ]; then
            echo "warning: git state capture failed with exit code $rc" >&2
        fi
    else
        append_status "git-state" "skipped" "$OUT_DIR_ABS/git" "capture_git_state.sh not executable"
    fi
}

summarize_warnings() {
    summarizer=$REPO_ROOT/tools/baseline/summarize_warnings.py
    if command -v python3 >/dev/null 2>&1 && [ -f "$summarizer" ]; then
        echo "summarizing warnings" >&2
        set +e
        python3 "$summarizer" \
            --output "$SUMMARY_LOG" \
            "$AUTORECONF_LOG" "$CONFIGURE_LOG" "$MAKE_LOG"
        rc=$?
        set -e
        append_status "warning-summary" "$rc" "$SUMMARY_LOG" "python3 $summarizer --output $SUMMARY_LOG ..."
        if [ "$rc" -ne 0 ]; then
            echo "warning: warning summarization failed with exit code $rc" >&2
        fi
    else
        append_status "warning-summary" "skipped" "$SUMMARY_LOG" "python3 or summarize_warnings.py unavailable"
    fi
}

final_rc=0

capture_git_state

if run_step "autoreconf" "$AUTORECONF_LOG" "autoreconf -i" autoreconf -i; then
    if run_step "configure" "$CONFIGURE_LOG" "./configure" ./configure; then
        if ! run_step "make" "$MAKE_LOG" "make" make; then
            final_rc=$LAST_RC
        fi
    else
        final_rc=$LAST_RC
        write_skipped_log "$MAKE_LOG" "configure failed"
        append_status "make" "skipped" "$MAKE_LOG" "make"
    fi
else
    final_rc=$LAST_RC
    write_skipped_log "$CONFIGURE_LOG" "autoreconf failed"
    write_skipped_log "$MAKE_LOG" "autoreconf failed"
    append_status "configure" "skipped" "$CONFIGURE_LOG" "./configure"
    append_status "make" "skipped" "$MAKE_LOG" "make"
fi

summarize_warnings

{
    echo "# Finished at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Final exit code: $final_rc"
} >> "$STATUS_FILE"

exit "$final_rc"
