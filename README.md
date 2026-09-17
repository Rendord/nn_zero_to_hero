# nn-zero-to-hero

Working through Andrej Karpathy's [Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html).

## Setup

The `.venv/` is machine-local and never committed — recreate it on each machine.

macOS / Linux:

```bash
./scripts/setup.sh
```

Windows (PowerShell):

```powershell
.\scripts\setup.ps1
```

Both create `.venv`, install `requirements.txt`, and register a Jupyter kernel named
**Python (nn-zero-to-hero)**. Select that kernel in any notebook.

Graphviz needs a system binary in addition to the Python package (micrograd's
computation-graph drawing uses it):

- macOS: `brew install graphviz`
- Windows: `winget install Graphviz.Graphviz`

## Running notebooks

```bash
.venv/bin/jupyter lab            # macOS
.\.venv\Scripts\jupyter lab      # Windows
```

Or open the folder in VS Code / Cursor and pick the kernel from the notebook toolbar.

## Layout

- `notebooks/` — one notebook per lecture
- `data/` — downloaded datasets (`names.txt`, `input.txt`, …); gitignored if large
- `scripts/` — environment setup

## Syncing between machines

`git pull` → run the setup script if `requirements.txt` changed → work → `git commit && git push`.
Line endings are normalized to LF via `.gitattributes` so notebooks don't churn across OSes.
