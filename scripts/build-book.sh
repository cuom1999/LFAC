#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
build_dir="$project_dir/build"
mkdir -p "$build_dir/markdown" "$build_dir/texmf-var" "$build_dir/texmf-cache"
export TEXMFVAR="$build_dir/texmf-var"
export TEXMFCACHE="$build_dir/texmf-cache"

for source in "$project_dir"/book/20*.md; do
  sed -e 's/^\\\[$/$$/' -e 's/^\\\]$/$$/' \
    -e 's/★★★★/\\difficulty{4}/g' \
    -e 's/★★★/\\difficulty{3}/g' \
    -e 's/★★/\\difficulty{2}/g' \
    -e 's/★/\\difficulty{1}/g' "$source" \
    > "$build_dir/markdown/$(basename "$source")"
done

for pass in 1 2 3; do
  pass_log="$build_dir/full-book-pass-$pass.log"
  if ! lualatex --shell-escape -interaction=nonstopmode -halt-on-error \
    -jobname=full-book -output-directory="$build_dir" \
    '\def\FullBook{1}\input{preview.tex}' > "$pass_log" 2>&1; then
    tail -n 100 "$pass_log" >&2
    exit 1
  fi
done

cp "$build_dir/full-book.pdf" "$project_dir/LFAC2-vi-full-draft.pdf"
echo "Built LFAC2-vi-full-draft.pdf"
