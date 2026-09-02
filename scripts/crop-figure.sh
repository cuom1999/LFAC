#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 7 ]]; then
  echo "Usage: $0 PDF PAGE X Y WIDTH HEIGHT OUTPUT.png" >&2
  echo "Coordinates are pixels at 300 DPI, measured from the rendered page's top-left." >&2
  exit 2
fi

pdf=$1
page=$2
x=$3
y=$4
width=$5
height=$6
output=$7

mkdir -p "$(dirname "$output")"
pdftoppm -f "$page" -l "$page" -r 300 -png -singlefile \
  -x "$x" -y "$y" -W "$width" -H "$height" "$pdf" > "$output"
