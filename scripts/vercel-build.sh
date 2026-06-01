#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="$ROOT/dist"
FINAL="$ROOT/final"

rm -rf "$DIST"
mkdir -p "$DIST" "$DIST/data"
cp "$FINAL/submission_prototype.html" "$DIST/index.html"
cp "$FINAL/story-data.js" "$DIST/"
cp "$FINAL/viz-shared.js" "$DIST/"
cp "$FINAL/data/story-data.json" "$DIST/data/"
cp "$ROOT/data/countries-110m.json" "$DIST/"

echo "Vercel build ready: dist/index.html + assets"
