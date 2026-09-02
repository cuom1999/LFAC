#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="$project_dir/build"
mkdir -p "$build_dir"
export TEXMFVAR="$build_dir/texmf-var"
export TEXMFCACHE="$build_dir/texmf-cache"
mkdir -p "$TEXMFVAR" "$TEXMFCACHE"

# The TeX Live Markdown package handles $$ display math more reliably than
# backslash-bracket display math. Normalize only the generated build copies.
markdown_build_dir="$build_dir/markdown"
mkdir -p "$markdown_build_dir"
for source in "$project_dir"/book/2011-*.md; do
  sed -e 's/^\\\[$/$$/' -e 's/^\\\]$/$$/' \
    -e 's/★★★★/\\difficulty{4}/g' \
    -e 's/★★★/\\difficulty{3}/g' \
    -e 's/★★/\\difficulty{2}/g' \
    -e 's/★/\\difficulty{1}/g' "$source" \
    > "$markdown_build_dir/$(basename "$source")"
done

for pass in 1 2 3; do
  pass_log="$build_dir/build-pass-$pass.log"
  if ! lualatex --shell-escape -interaction=nonstopmode -halt-on-error \
    -output-directory="$build_dir" "$project_dir/preview.tex" > "$pass_log" 2>&1; then
    tail -n 80 "$pass_log" >&2
    exit 1
  fi
done

cp "$build_dir/preview.pdf" "$project_dir/LFAC2-vi-preview-4-problems.pdf"
echo "Built LFAC2-vi-preview-4-problems.pdf"
