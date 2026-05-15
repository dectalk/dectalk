#!/bin/sh
set -eu

usage() {
    echo "Usage: tools/baseline/capture_dist_manifest.sh DIST_DIR OUT_DIR" >&2
}

if [ "$#" -ne 2 ]; then
    usage
    exit 2
fi

DIST_DIR=$1
OUT_DIR=$2

if [ ! -d "$DIST_DIR" ]; then
    echo "error: DIST_DIR does not exist or is not a directory: $DIST_DIR" >&2
    exit 1
fi

mkdir -p "$OUT_DIR"

stat_fields() {
    path=$1
    if stat -c '%s	%a	%Y' "$path" 2>/dev/null; then
        return 0
    fi
    if stat -f '%z	%Lp	%m' "$path" 2>/dev/null; then
        return 0
    fi
    printf 'unknown\tunknown\tunknown\n'
}

path_type() {
    path=$1
    if [ -L "$path" ]; then
        printf 'symlink'
    elif [ -f "$path" ]; then
        printf 'file'
    elif [ -d "$path" ]; then
        printf 'dir'
    else
        printf 'other'
    fi
}

{
    echo "# DECtalk dist/install manifest"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Source directory: $DIST_DIR"
    echo "# Columns: type size mode mtime path"
    (
        cd "$DIST_DIR"
        find . -print | sort | while IFS= read -r path; do
            rel=${path#./}
            type=$(path_type "$path")
            fields=$(stat_fields "$path")
            printf '%s\t%s\t%s\n' "$type" "$fields" "$rel"
        done
    )
} > "$OUT_DIR/dist-manifest.txt"

if command -v sha256sum >/dev/null 2>&1; then
    {
        echo "# SHA-256 hashes from: sha256sum"
        echo "# Source directory: $DIST_DIR"
        (
            cd "$DIST_DIR"
            find . -type f -print | sort | while IFS= read -r path; do
                sha256sum "$path"
            done
        )
    } > "$OUT_DIR/dist-sha256.txt"
elif command -v shasum >/dev/null 2>&1; then
    {
        echo "# SHA-256 hashes from: shasum -a 256"
        echo "# Source directory: $DIST_DIR"
        (
            cd "$DIST_DIR"
            find . -type f -print | sort | while IFS= read -r path; do
                shasum -a 256 "$path"
            done
        )
    } > "$OUT_DIR/dist-sha256.txt"
fi
