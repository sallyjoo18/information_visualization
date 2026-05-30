#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="$ROOT/dist"

rm -rf "$DIST"
mkdir -p "$DIST"
cp "$ROOT/final/submission_prototype.html" "$DIST/index.html"
cp "$ROOT/data/countries-110m.json" "$DIST/"

echo "Vercel build ready: dist/index.html + dist/countries-110m.json"
