#!/usr/bin/env bash
# Create .venv, install deps, and register the Jupyter kernel. Safe to re-run.
set -euo pipefail
cd "$(dirname "$0")/.."

PYTHON="${PYTHON:-python3}"

"$PYTHON" -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python -m ipykernel install --user \
  --name nn-zero-to-hero --display-name "Python (nn-zero-to-hero)"

command -v dot >/dev/null || echo "warning: graphviz 'dot' not on PATH — run: brew install graphviz"

echo "Done. Select the 'Python (nn-zero-to-hero)' kernel in your notebooks."
