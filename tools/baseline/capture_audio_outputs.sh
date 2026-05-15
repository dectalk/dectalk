#!/bin/sh
set -eu

usage() {
    echo "Usage: tools/baseline/capture_audio_outputs.sh SAY_EXE INPUT_DIR OUT_DIR" >&2
}

if [ "$#" -ne 3 ]; then
    usage
    exit 2
fi

SAY_EXE=$1
INPUT_DIR=$2
OUT_DIR=$3

if [ ! -f "AGENTS.md" ] || [ ! -d "tools/baseline" ]; then
    echo "error: must be run from the repository root" >&2
    exit 1
fi

if [ ! -x "$SAY_EXE" ]; then
    echo "error: SAY_EXE is not executable: $SAY_EXE" >&2
    exit 1
fi

if [ ! -d "$INPUT_DIR" ]; then
    echo "error: INPUT_DIR does not exist or is not a directory: $INPUT_DIR" >&2
    exit 1
fi

AUDIO_DIR=$OUT_DIR/audio
LOG_DIR=$OUT_DIR/logs
STATUS_FILE=$OUT_DIR/capture-status.txt
COMMANDS_FILE=$OUT_DIR/commands.txt
MANIFEST_FILE=$OUT_DIR/audio-manifest.txt
SHA_FILE=$OUT_DIR/audio-sha256.txt

mkdir -p "$AUDIO_DIR" "$LOG_DIR"

hash_tool=
if command -v sha256sum >/dev/null 2>&1; then
    hash_tool=sha256sum
elif command -v shasum >/dev/null 2>&1; then
    hash_tool="shasum -a 256"
fi

hash_file() {
    file=$1
    if [ "$hash_tool" = "" ] || [ ! -f "$file" ]; then
        printf 'unavailable'
        return 0
    fi
    # shellcheck disable=SC2086
    $hash_tool "$file" | awk '{print $1}'
}

file_size() {
    file=$1
    if [ ! -f "$file" ]; then
        printf 'missing'
        return 0
    fi
    if stat -c '%s' "$file" 2>/dev/null; then
        return 0
    fi
    if stat -f '%z' "$file" 2>/dev/null; then
        return 0
    fi
    printf 'unknown\n'
}

sanitize_name() {
    printf '%s' "$1" | sed 's/[^A-Za-z0-9._-]/_/g'
}

{
    echo "# DECtalk audio/file-output capture status"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Repository root: $(pwd)"
    echo "# SAY_EXE: $SAY_EXE"
    echo "# INPUT_DIR: $INPUT_DIR"
    echo "# OUT_DIR: $OUT_DIR"
    echo "# Command template: SAY_EXE -fi INPUT_FILE -fo OUT_WAV"
    echo "# This capture does not prove behavior preservation."
    echo
    echo "input	exit_code	output	stdout	stderr"
} > "$STATUS_FILE"

{
    echo "# DECtalk audio/file-output capture commands"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Note: this helper uses -fi/-fo. Some SAY variants document -w with stdin instead."
} > "$COMMANDS_FILE"

{
    echo "# DECtalk audio/file-output manifest"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Columns: input input_size input_sha256 output output_size output_sha256 stdout stderr exit_code"
} > "$MANIFEST_FILE"

if [ "$hash_tool" != "" ]; then
    {
        echo "# SHA-256 hashes from: $hash_tool"
        echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    } > "$SHA_FILE"
else
    rm -f "$SHA_FILE"
fi

found=0
failed=0

for input in "$INPUT_DIR"/*.txt; do
    if [ ! -f "$input" ]; then
        continue
    fi

    found=1
    name=$(basename "$input" .txt)
    safe_name=$(sanitize_name "$name")
    output=$AUDIO_DIR/$safe_name.wav
    stdout_log=$LOG_DIR/$safe_name.stdout.txt
    stderr_log=$LOG_DIR/$safe_name.stderr.txt

    # The current Unix sample SAY documents -fi/-fo, while another SAY sample
    # documents -w plus stdin. Use the requested -fi/-fo form and record the
    # exact command so incompatible SAY variants are visible in the status.
    printf '%s -fi %s -fo %s\n' "$SAY_EXE" "$input" "$output" >> "$COMMANDS_FILE"

    if "$SAY_EXE" -fi "$input" -fo "$output" > "$stdout_log" 2> "$stderr_log"; then
        rc=0
    else
        rc=$?
        failed=1
    fi

    printf '%s\t%s\t%s\t%s\t%s\n' \
        "$input" "$rc" "$output" "$stdout_log" "$stderr_log" >> "$STATUS_FILE"

    input_size=$(file_size "$input")
    output_size=$(file_size "$output")
    input_hash=$(hash_file "$input")
    output_hash=$(hash_file "$output")

    printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$input" "$input_size" "$input_hash" \
        "$output" "$output_size" "$output_hash" \
        "$stdout_log" "$stderr_log" "$rc" >> "$MANIFEST_FILE"

    if [ "$hash_tool" != "" ]; then
        {
            # shellcheck disable=SC2086
            $hash_tool "$input"
            if [ -f "$output" ]; then
                # shellcheck disable=SC2086
                $hash_tool "$output"
            fi
        } >> "$SHA_FILE"
    fi
done

if [ "$found" -eq 0 ]; then
    echo "error: no *.txt input files found in INPUT_DIR: $INPUT_DIR" >&2
    echo "no-inputs	1	-	-	-" >> "$STATUS_FILE"
    exit 1
fi

if [ "$failed" -ne 0 ]; then
    echo "capture completed with one or more failed inputs; see $STATUS_FILE" >&2
    exit 1
fi

echo "capture completed successfully; see $STATUS_FILE"
