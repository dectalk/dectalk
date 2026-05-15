#!/usr/bin/env python3
"""Summarize compiler warning logs for baseline capture."""

from __future__ import annotations

import argparse
import collections
import datetime as _datetime
from pathlib import Path
import re
import sys


CATEGORIES = [
    "missing prototype / implicit declaration",
    "incompatible pointer type",
    "pointer/integer conversion",
    "integer conversion / truncation",
    "signed/unsigned comparison",
    "unused variable/function/parameter",
    "format string mismatch",
    "uninitialized variable",
    "unsafe temporary file API",
    "deprecated declaration/API",
    "macro redefinition",
    "unreachable/dead code",
    "syntax/preprocessor",
    "unknown compiler warning",
    "uncategorized",
]


CATEGORY_PATTERNS = [
    (
        "unsafe temporary file API",
        [
            r"\btmpnam\b",
            r"\bmktemp\b",
            r"\btempnam\b",
            r"\bmkstemp\b",
        ],
    ),
    (
        "missing prototype / implicit declaration",
        [
            r"\bimplicit declaration\b",
            r"\bimplicitly declaring\b",
            r"\bno previous prototype\b",
            r"\bmissing prototype\b",
            r"\bnot declared\b",
            r"\bundeclared\b",
            r"\bC4013\b",
            r"\bC2065\b",
        ],
    ),
    (
        "incompatible pointer type",
        [
            r"\bincompatible pointer type",
            r"\bincompatible pointer types",
            r"\bpointer type mismatch\b",
            r"\bC4133\b",
            r"\bC4047\b",
        ],
    ),
    (
        "pointer/integer conversion",
        [
            r"\bcast (to|from) pointer from integer",
            r"\bcast (to|from) integer from pointer",
            r"\bpointer from integer",
            r"\binteger from pointer",
            r"\bmakes pointer from integer",
            r"\bmakes integer from pointer",
            r"\bpointer-to-int",
            r"\bint-to-pointer",
            r"\bC4311\b",
            r"\bC4312\b",
        ],
    ),
    (
        "integer conversion / truncation",
        [
            r"\bconversion\b.*\bmay (alter|change|lose)\b",
            r"\bconversion\b.*\bpossible loss of data\b",
            r"\bconversion\b.*\btruncat",
            r"\bshorten\b",
            r"\boverflow\b",
            r"\bconstant conversion\b",
            r"\bC4244\b",
            r"\bC4267\b",
            r"\bC4305\b",
            r"\bC4309\b",
        ],
    ),
    (
        "signed/unsigned comparison",
        [
            r"\bsigned and unsigned\b",
            r"\bcomparison of integer expressions of different signedness\b",
            r"\b-Wsign-compare\b",
            r"\bC4018\b",
        ],
    ),
    (
        "unused variable/function/parameter",
        [
            r"\bunused (variable|function|parameter|argument|label|value)\b",
            r"\bdefined but not used\b",
            r"\bdeclared but never referenced\b",
            r"\bunreferenced formal parameter\b",
            r"\bunreferenced local variable\b",
            r"\bset but not used\b",
            r"\b-Wunused",
            r"\bC4100\b",
            r"\bC4101\b",
            r"\bC4189\b",
            r"\bC4505\b",
        ],
    ),
    (
        "format string mismatch",
        [
            r"\bformat\b.*\bexpects\b",
            r"\bformat\b.*\bargument\b",
            r"\bformat specifies type\b",
            r"\btoo (many|few) arguments for format\b",
            r"\b-Wformat",
            r"\bC4473\b",
            r"\bC4474\b",
            r"\bC4477\b",
        ],
    ),
    (
        "uninitialized variable",
        [
            r"\buninitialized\b",
            r"\bmay be used uninitialized\b",
            r"\bused without having been initialized\b",
            r"\bC4700\b",
            r"\bC4701\b",
            r"\bC4703\b",
        ],
    ),
    (
        "deprecated declaration/API",
        [
            r"\bdeprecated\b",
            r"\bwas declared deprecated\b",
            r"\bC4996\b",
        ],
    ),
    (
        "macro redefinition",
        [
            r"\bmacro redefined\b",
            r"\bredefined\b.*\bmacro\b",
            r"\b(re)?definition of macro\b",
            r"\bC4005\b",
        ],
    ),
    (
        "unreachable/dead code",
        [
            r"\bunreachable code\b",
            r"\bwill never be executed\b",
            r"\bstatement is unreachable\b",
            r"\bC4702\b",
        ],
    ),
    (
        "syntax/preprocessor",
        [
            r"\bextra tokens at end of #",
            r"\bunterminated\b",
            r"\bmissing .*#endif\b",
            r"\b#pragma\b",
            r"\bunknown pragma\b",
            r"\b-Wcpp\b",
            r"\bC4068\b",
            r"\bC4067\b",
        ],
    ),
]


GCC_CLANG_WARNING_RE = re.compile(
    r"^(?P<file>.*?):(?P<line>\d+)(?::(?P<column>\d+))?:\s+warning:\s+(?P<message>.*)$"
)
MSVC_WARNING_RE = re.compile(
    r"^(?P<file>.*?)(?:\((?P<line>\d+)(?:,\d+)?\))?\s*:\s+warning\s+"
    r"(?P<code>[A-Z]+\d+)\s*:\s*(?P<message>.*)$",
    re.IGNORECASE,
)
GENERIC_WARNING_RE = re.compile(r"\bwarning\b", re.IGNORECASE)
GCC_FLAG_RE = re.compile(r"\[-W[^\]]+\]")
MSVC_CODE_RE = re.compile(r"\b(?:C|LNK)\d{4,5}\b", re.IGNORECASE)


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Summarize compiler/build warning logs into Markdown."
    )
    parser.add_argument(
        "--output",
        required=True,
        help="Markdown output file to write.",
    )
    parser.add_argument(
        "--max-examples-per-category",
        type=int,
        default=10,
        help="Maximum representative warning lines to keep per category.",
    )
    parser.add_argument(
        "logs",
        nargs="+",
        help="Compiler or build log files to summarize.",
    )
    return parser.parse_args(argv)


def normalize_warning_line(line: str) -> str | None:
    stripped = line.rstrip("\n")
    if GCC_CLANG_WARNING_RE.search(stripped):
        return stripped
    if MSVC_WARNING_RE.search(stripped):
        return stripped
    if GENERIC_WARNING_RE.search(stripped):
        return stripped
    return None


def classify_warning(line: str) -> str:
    lower = line.lower()
    for category, patterns in CATEGORY_PATTERNS:
        for pattern in patterns:
            if re.search(pattern, lower, re.IGNORECASE):
                return category
    if GCC_CLANG_WARNING_RE.search(line) or MSVC_WARNING_RE.search(line):
        return "unknown compiler warning"
    return "uncategorized"


def extract_markers(line: str) -> list[str]:
    markers = []
    markers.extend(GCC_FLAG_RE.findall(line))
    markers.extend(match.upper() for match in MSVC_CODE_RE.findall(line))
    return markers


def read_warnings(log_paths: list[Path]) -> list[tuple[Path, int, str]]:
    warnings = []
    for log_path in log_paths:
        if not log_path.exists():
            raise FileNotFoundError(f"input log file does not exist: {log_path}")
        if not log_path.is_file():
            raise FileNotFoundError(f"input log path is not a file: {log_path}")
        with log_path.open("r", encoding="utf-8", errors="replace") as handle:
            for line_number, line in enumerate(handle, start=1):
                warning_line = normalize_warning_line(line)
                if warning_line is not None:
                    warnings.append((log_path, line_number, warning_line))
    return warnings


def markdown_escape_cell(value: str) -> str:
    return value.replace("|", "\\|").replace("\n", " ")


def write_markdown(
    output_path: Path,
    log_paths: list[Path],
    warnings: list[tuple[Path, int, str]],
    max_examples: int,
) -> None:
    counts = collections.Counter()
    examples: dict[str, list[tuple[Path, int, str]]] = {category: [] for category in CATEGORIES}
    markers: dict[str, collections.Counter[str]] = {
        category: collections.Counter() for category in CATEGORIES
    }

    for log_path, line_number, line in warnings:
        category = classify_warning(line)
        counts[category] += 1
        if len(examples[category]) < max_examples:
            examples[category].append((log_path, line_number, line))
        for marker in extract_markers(line):
            markers[category][marker] += 1

    output_path.parent.mkdir(parents=True, exist_ok=True)
    generated_at = _datetime.datetime.now(_datetime.timezone.utc).strftime(
        "%Y-%m-%dT%H:%M:%SZ"
    )

    with output_path.open("w", encoding="utf-8") as out:
        out.write("# Warning Summary\n\n")
        out.write(f"Generated at: `{generated_at}`\n\n")
        out.write(
            "This is a heuristic warning inventory for baseline capture. "
            "It does not prove behavior preservation.\n\n"
        )

        out.write("## Input Logs\n\n")
        for log_path in log_paths:
            out.write(f"- `{log_path}`\n")
        out.write("\n")

        out.write("## Totals\n\n")
        out.write(f"- Total warning-like lines: `{len(warnings)}`\n")
        out.write(f"- Categorized warning-like lines: `{sum(counts.values())}`\n\n")

        out.write("## Category Counts\n\n")
        out.write("| Category | Count |\n")
        out.write("| --- | ---: |\n")
        for category in CATEGORIES:
            out.write(f"| {markdown_escape_cell(category)} | {counts[category]} |\n")
        out.write("\n")

        out.write("## Categories\n\n")
        for category in CATEGORIES:
            count = counts[category]
            if count == 0:
                continue
            out.write(f"### {category}\n\n")
            out.write(f"Count: `{count}`\n\n")

            if markers[category]:
                out.write("Detected warning markers:\n\n")
                for marker, marker_count in markers[category].most_common():
                    out.write(f"- `{marker}`: `{marker_count}`\n")
                out.write("\n")

            out.write("Representative examples:\n\n")
            for log_path, line_number, line in examples[category]:
                out.write(f"- `{log_path}:{line_number}`\n\n")
                out.write("  ```text\n")
                out.write(f"  {line}\n")
                out.write("  ```\n\n")

        out.write("## Limitations\n\n")
        out.write("- Warning categorization is heuristic and compiler messages vary.\n")
        out.write("- Multi-line diagnostics are not reconstructed; only warning-like lines are summarized.\n")
        out.write("- Some DECtalk-specific or tool-specific warnings may appear as `uncategorized`.\n")
        out.write("- Counts are for warning-like lines, not necessarily unique compiler diagnostics.\n")
        out.write("- This summary is for cleanup planning and baseline capture only.\n")


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    if args.max_examples_per_category < 0:
        print("error: --max-examples-per-category must be non-negative", file=sys.stderr)
        return 2

    log_paths = [Path(log) for log in args.logs]
    output_path = Path(args.output)

    try:
        warnings = read_warnings(log_paths)
        write_markdown(
            output_path=output_path,
            log_paths=log_paths,
            warnings=warnings,
            max_examples=args.max_examples_per_category,
        )
    except OSError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
