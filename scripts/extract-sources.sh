#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$project_dir/sources"

pdftotext -layout "$project_dir/looking-for-a-challenge-2-en.pdf" \
  "$project_dir/sources/looking-for-a-challenge-2-en.txt"
pdftotext -layout "$project_dir/looking-for-a-challenge-2-pl.pdf" \
  "$project_dir/sources/looking-for-a-challenge-2-pl.txt"

echo "Extracted English and Polish sources into sources/."
