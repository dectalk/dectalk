#!/bin/sh
set -eu

usage() {
    echo "Usage: tools/baseline/capture_symbols.sh ARTIFACT_DIR OUT_DIR" >&2
}

if [ "$#" -ne 2 ]; then
    usage
    exit 2
fi

ARTIFACT_DIR=$1
OUT_DIR=$2

if [ ! -d "$ARTIFACT_DIR" ]; then
    echo "error: ARTIFACT_DIR does not exist or is not a directory: $ARTIFACT_DIR" >&2
    exit 1
fi

mkdir -p "$OUT_DIR"

sanitize_name() {
    printf '%s' "$1" | sed 's#^\./##; s#[^A-Za-z0-9._-]#_#g'
}

inspect_artifact() {
    artifact=$1
    out_file=$2
    status=1

    {
        echo "# Artifact: $artifact"
        echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"

        if command -v file >/dev/null 2>&1; then
            echo
            echo "## file"
            file "$artifact" || true
        fi

        if command -v nm >/dev/null 2>&1; then
            echo
            echo "## nm -g"
            if nm -g "$artifact"; then
                status=0
            else
                echo "# nm failed for this artifact"
            fi
        fi

        if [ "$status" -ne 0 ] && command -v objdump >/dev/null 2>&1; then
            echo
            echo "## objdump -T"
            if objdump -T "$artifact"; then
                status=0
            else
                echo "# objdump -T failed for this artifact"
                echo
                echo "## objdump -t"
                if objdump -t "$artifact"; then
                    status=0
                else
                    echo "# objdump -t failed for this artifact"
                fi
            fi
        fi

        if [ "$status" -ne 0 ] && command -v otool >/dev/null 2>&1; then
            echo
            echo "## otool -Iv"
            if otool -Iv "$artifact"; then
                status=0
            else
                echo "# otool failed for this artifact"
            fi
        fi

        if [ "$status" -ne 0 ] && command -v dumpbin >/dev/null 2>&1; then
            echo
            echo "## dumpbin /EXPORTS"
            if dumpbin /EXPORTS "$artifact"; then
                status=0
            else
                echo "# dumpbin failed for this artifact"
            fi
        fi

        if [ "$status" -ne 0 ]; then
            echo
            echo "# No available symbol tool succeeded for this artifact"
        fi
    } > "$out_file" 2>&1

    return "$status"
}

SUMMARY="$OUT_DIR/symbols-summary.txt"

{
    echo "# DECtalk symbol capture summary"
    echo "# Captured at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "# Artifact directory: $ARTIFACT_DIR"
    echo "# Columns: status artifact symbol_file"
} > "$SUMMARY"

count=0
LIST_FILE="$OUT_DIR/.symbols-artifacts.$$"
trap 'rm -f "$LIST_FILE"' EXIT HUP INT TERM

(
    cd "$ARTIFACT_DIR"
    find . -type f \( -name '*.so' -o -name '*.so.*' -o -name '*.dylib' -o -name '*.dll' -o -name '*.a' \) -print | sort
) > "$LIST_FILE"

if [ ! -s "$LIST_FILE" ]; then
    echo "# No shared-library-style artifacts found" >> "$SUMMARY"
    exit 0
fi

while IFS= read -r rel_path; do
    count=$((count + 1))
    safe=$(sanitize_name "$rel_path")
    symbol_file="$OUT_DIR/${count}-${safe}.symbols.txt"
    artifact="$ARTIFACT_DIR/$rel_path"

    if inspect_artifact "$artifact" "$symbol_file"; then
        printf 'ok\t%s\t%s\n' "$rel_path" "$symbol_file" >> "$SUMMARY"
    else
        printf 'failed\t%s\t%s\n' "$rel_path" "$symbol_file" >> "$SUMMARY"
    fi
done < "$LIST_FILE"
