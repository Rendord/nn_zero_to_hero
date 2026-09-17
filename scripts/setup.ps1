# Create .venv, install deps, and register the Jupyter kernel. Safe to re-run.
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install --upgrade pip
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m ipykernel install --user `
  --name nn-zero-to-hero --display-name "Python (nn-zero-to-hero)"

if (-not (Get-Command dot -ErrorAction SilentlyContinue)) {
  Write-Warning "graphviz 'dot' not on PATH - run: winget install Graphviz.Graphviz"
}

Write-Host "Done. Select the 'Python (nn-zero-to-hero)' kernel in your notebooks."
