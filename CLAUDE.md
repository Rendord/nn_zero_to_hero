# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal learning repo following Andrej Karpathy's *Neural Networks: Zero to Hero* lecture
series (micrograd → makemore → GPT). Content is notebook-driven; there is no application to
build, no test suite, and no lint config. Code here is meant to be read, run cell-by-cell, and
compared against the lecture — favor explicitness over abstraction, and mirror the lecture's
variable names (`xs`, `ys`, `C`, `W1`, `b1`, `logits`, `emb`, `itos`, `stoi`) so notebooks stay
diff-able against the reference implementations.

## Environment

Everything runs in the repo-local `.venv`, exposed to Jupyter as the kernel
**`nn-zero-to-hero`** (display name "Python (nn-zero-to-hero)"). `.venv/` is gitignored and
recreated per machine.

```bash
./scripts/setup.sh                       # macOS: create venv, install deps, register kernel
.\scripts\setup.ps1                      # Windows PowerShell equivalent
.venv/bin/python -m pip install -r requirements.txt   # after requirements.txt changes
.venv/bin/jupyter lab                    # launch notebooks
```

Always invoke the interpreter by path (`.venv/bin/python`, `.venv\Scripts\python.exe`) rather
than assuming an activated shell — activation does not persist between Bash tool calls.

Run a notebook headlessly (useful for checking a change actually executes):

```bash
.venv/bin/jupyter nbconvert --to notebook --execute --inplace notebooks/<name>.ipynb
```

## Cross-machine constraints

The repo moves between a macOS laptop and a Windows PC, so:

- Never commit anything under `.venv/`, and never hardcode absolute paths or platform-specific
  path separators — use `pathlib.Path`.
- `.gitattributes` forces LF on `.py`/`.ipynb`/`.md`; don't add tooling that rewrites endings.
- Device selection must degrade gracefully: `mps` on the Mac, `cuda` on the PC, `cpu` otherwise.
  Prefer `torch.device('cuda' if torch.cuda.is_available() else 'mps' if torch.backends.mps.is_available() else 'cpu')`
  over a hardcoded device.
- Pin a version in `requirements.txt` only when a lecture depends on specific behavior;
  otherwise leave it unpinned so both machines can resolve a working wheel.

## Notebook hygiene

Notebooks are the primary artifact and their outputs are committed (plots and printed losses are
part of the learning record). Keep cells small and in execution order — a notebook that only runs
top-to-bottom after out-of-order execution is a bug. Datasets (`names.txt`, `input.txt`) belong in
`data/`; download them in a cell rather than committing large files.

`graphviz` needs both the Python package and a system `dot` binary. If graph drawing fails with an
`ExecutableNotFound`, the system package is missing — not the Python one.
