#!/usr/bin/env python3
"""Compare DECtalk audio/file-output baseline capture directories."""

from __future__ import annotations

import argparse
import datetime as _dt
import hashlib
import os
from pathlib import Path
import sys
import wave


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Compare two capture_audio_outputs.sh output directories."
    )
    parser.add_argument(
        "--baseline",
        required=True,
        help="Older capture directory containing an audio/ subdirectory.",
    )
    parser.add_argument(
        "--candidate",
        required=True,
        help="Newer capture directory containing an audio/ subdirectory.",
    )
    parser.add_argument(
        "--output",
        required=True,
        help="Markdown report path to write.",
    )
    return parser.parse_args()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def audio_files(audio_dir: Path) -> dict[str, Path]:
    return {
        path.name: path
        for path in sorted(audio_dir.iterdir())
        if path.is_file()
    }


def wav_metadata(path: Path) -> tuple[dict[str, object] | None, str | None]:
    if path.suffix.lower() != ".wav":
        return None, None
    try:
        with wave.open(str(path), "rb") as handle:
            channels = handle.getnchannels()
            sample_width = handle.getsampwidth()
            sample_rate = handle.getframerate()
            frame_count = handle.getnframes()
    except (EOFError, wave.Error, OSError) as exc:
        return None, str(exc)

    duration = None
    if sample_rate:
        duration = frame_count / float(sample_rate)

    return {
        "channels": channels,
        "sample_width": sample_width,
        "sample_rate": sample_rate,
        "frame_count": frame_count,
        "duration": duration,
    }, None


def format_duration(value: object) -> str:
    if isinstance(value, float):
        return f"{value:.6f}"
    return str(value)


def metadata_to_text(metadata: dict[str, object] | None) -> str:
    if metadata is None:
        return "-"
    return (
        f"rate={metadata['sample_rate']}, "
        f"width={metadata['sample_width']}, "
        f"channels={metadata['channels']}, "
        f"frames={metadata['frame_count']}, "
        f"duration={format_duration(metadata['duration'])}"
    )


def md(text: object) -> str:
    value = str(text)
    return value.replace("|", "\\|").replace("\n", " ")


def rel(path: Path) -> str:
    try:
        return str(path.relative_to(Path.cwd()))
    except ValueError:
        return str(path)


def write_section_list(lines: list[str], title: str, rows: list[str]) -> None:
    lines.append(f"## {title}")
    lines.append("")
    if rows:
        lines.extend(rows)
    else:
        lines.append("None.")
    lines.append("")


def compare(baseline_dir: Path, candidate_dir: Path) -> tuple[list[str], bool]:
    baseline_audio = baseline_dir / "audio"
    candidate_audio = candidate_dir / "audio"
    errors: list[str] = []

    if not baseline_audio.is_dir():
        errors.append(f"Baseline audio directory is missing: `{baseline_audio}`")
    if not candidate_audio.is_dir():
        errors.append(f"Candidate audio directory is missing: `{candidate_audio}`")

    if errors:
        lines = report_header(baseline_dir, candidate_dir)
        write_section_list(lines, "Layout Errors", [f"- {error}" for error in errors])
        add_limitations(lines)
        return lines, False

    baseline_files = audio_files(baseline_audio)
    candidate_files = audio_files(candidate_audio)

    baseline_names = set(baseline_files)
    candidate_names = set(candidate_files)
    common_names = sorted(baseline_names & candidate_names)
    missing_names = sorted(baseline_names - candidate_names)
    extra_names = sorted(candidate_names - baseline_names)

    exact_rows: list[dict[str, object]] = []
    differing_rows: list[dict[str, object]] = []
    wav_rows: list[dict[str, object]] = []
    metadata_differences: list[dict[str, object]] = []
    metadata_errors: list[dict[str, object]] = []
    unreadable: list[str] = []

    for name in common_names:
        baseline_path = baseline_files[name]
        candidate_path = candidate_files[name]
        row: dict[str, object] = {"name": name}

        try:
            baseline_size = baseline_path.stat().st_size
            baseline_hash = sha256_file(baseline_path)
        except OSError as exc:
            unreadable.append(f"`{name}` baseline unreadable: {exc}")
            continue

        try:
            candidate_size = candidate_path.stat().st_size
            candidate_hash = sha256_file(candidate_path)
        except OSError as exc:
            unreadable.append(f"`{name}` candidate unreadable: {exc}")
            continue

        row.update(
            {
                "baseline_size": baseline_size,
                "candidate_size": candidate_size,
                "baseline_hash": baseline_hash,
                "candidate_hash": candidate_hash,
                "size_match": baseline_size == candidate_size,
                "hash_match": baseline_hash == candidate_hash,
            }
        )
        exact_rows.append(row)
        if not row["size_match"] or not row["hash_match"]:
            differing_rows.append(row)

        baseline_meta, baseline_meta_error = wav_metadata(baseline_path)
        candidate_meta, candidate_meta_error = wav_metadata(candidate_path)
        wav_row = {
            "name": name,
            "baseline_meta": baseline_meta,
            "candidate_meta": candidate_meta,
            "baseline_error": baseline_meta_error,
            "candidate_error": candidate_meta_error,
            "metadata_match": baseline_meta == candidate_meta
            and baseline_meta_error == candidate_meta_error,
        }
        wav_rows.append(wav_row)

        if baseline_meta_error or candidate_meta_error:
            metadata_errors.append(wav_row)
        elif baseline_meta != candidate_meta:
            metadata_differences.append(wav_row)

    matched_exactly = [
        row
        for row in exact_rows
        if row["size_match"] and row["hash_match"]
    ]
    all_ok = (
        not missing_names
        and not extra_names
        and not unreadable
        and not differing_rows
        and not metadata_errors
        and not metadata_differences
        and bool(common_names)
    )

    lines = report_header(baseline_dir, candidate_dir)
    lines.append("## Summary")
    lines.append("")
    lines.append("| Metric | Count |")
    lines.append("| --- | ---: |")
    lines.append(f"| Baseline artifacts | {len(baseline_names)} |")
    lines.append(f"| Candidate artifacts | {len(candidate_names)} |")
    lines.append(f"| Compared artifacts | {len(common_names)} |")
    lines.append(f"| Exact matches | {len(matched_exactly)} |")
    lines.append(f"| Missing files | {len(missing_names)} |")
    lines.append(f"| Extra files | {len(extra_names)} |")
    lines.append(f"| Differing files | {len(differing_rows)} |")
    lines.append(f"| Unreadable files | {len(unreadable)} |")
    lines.append(f"| WAV metadata differences | {len(metadata_differences)} |")
    lines.append(f"| WAV metadata errors | {len(metadata_errors)} |")
    lines.append("")
    lines.append("## Exact Match Status")
    lines.append("")
    lines.append("PASS" if all_ok else "FAIL")
    lines.append("")

    write_section_list(
        lines,
        "Missing Files",
        [f"- `{name}` is present in baseline but missing from candidate." for name in missing_names],
    )
    write_section_list(
        lines,
        "Extra Files",
        [f"- `{name}` is present in candidate but missing from baseline." for name in extra_names],
    )
    write_section_list(lines, "Unreadable Files", [f"- {item}" for item in unreadable])

    lines.append("## Differing Files")
    lines.append("")
    if differing_rows:
        lines.append(
            "| File | Baseline Size | Candidate Size | Baseline SHA-256 | Candidate SHA-256 |"
        )
        lines.append("| --- | ---: | ---: | --- | --- |")
        for row in differing_rows:
            lines.append(
                "| {name} | {baseline_size} | {candidate_size} | `{baseline_hash}` | `{candidate_hash}` |".format(
                    name=md(row["name"]),
                    baseline_size=row["baseline_size"],
                    candidate_size=row["candidate_size"],
                    baseline_hash=row["baseline_hash"],
                    candidate_hash=row["candidate_hash"],
                )
            )
    else:
        lines.append("None.")
    lines.append("")

    lines.append("## WAV Metadata Comparison")
    lines.append("")
    if wav_rows:
        lines.append(
            "| File | Metadata Match | Baseline Metadata | Candidate Metadata | Metadata Errors |"
        )
        lines.append("| --- | --- | --- | --- | --- |")
        for row in wav_rows:
            errors_text = []
            if row["baseline_error"]:
                errors_text.append(f"baseline: {row['baseline_error']}")
            if row["candidate_error"]:
                errors_text.append(f"candidate: {row['candidate_error']}")
            lines.append(
                "| {name} | {match} | {baseline} | {candidate} | {errors} |".format(
                    name=md(row["name"]),
                    match="yes" if row["metadata_match"] else "no",
                    baseline=md(metadata_to_text(row["baseline_meta"])),
                    candidate=md(metadata_to_text(row["candidate_meta"])),
                    errors=md("; ".join(errors_text) if errors_text else "-"),
                )
            )
    else:
        lines.append("No common artifacts were available for WAV metadata comparison.")
    lines.append("")

    add_limitations(lines)
    return lines, all_ok


def report_header(baseline_dir: Path, candidate_dir: Path) -> list[str]:
    timestamp = _dt.datetime.now(tz=_dt.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    return [
        "# DECtalk Audio/File-Output Comparison",
        "",
        f"- Generated at: {timestamp}",
        f"- Baseline directory: `{rel(baseline_dir)}`",
        f"- Candidate directory: `{rel(candidate_dir)}`",
        "",
    ]


def add_limitations(lines: list[str]) -> None:
    lines.append("## Limitations")
    lines.append("")
    lines.append("- This report does not prove behavior preservation.")
    lines.append("- Exact SHA-256 equality is strict and may be too strong across platforms.")
    lines.append("- WAV metadata is parsed only with Python's standard `wave` module.")
    lines.append("- Non-WAV artifacts are compared by size and SHA-256 only.")
    lines.append("- No NumPy, SciPy, ffmpeg, perceptual analysis, or audio playback is used.")
    lines.append("- No RMS, peak, or sample-delta comparison is performed.")
    lines.append("")


def main() -> int:
    args = parse_args()
    baseline_dir = Path(args.baseline)
    candidate_dir = Path(args.candidate)
    output_path = Path(args.output)

    report_lines, ok = compare(baseline_dir, candidate_dir)

    if output_path.parent != Path(""):
        output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(report_lines), encoding="utf-8")

    if ok:
        return 0
    return 1


if __name__ == "__main__":
    sys.exit(main())
