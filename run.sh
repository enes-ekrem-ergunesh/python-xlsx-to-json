#!/bin/bash
set -e

# --- Handle script directory safely ---
# Get the absolute path of this script, even if run via symlink
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if an argument (xlsx path) is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_xlsx_file>"
  exit 1
fi

XLSX_PATH="$1"

# Check if the file exists
if [ ! -f "$XLSX_PATH" ]; then
  echo "❌ Error: File not found: $XLSX_PATH"
  exit 1
fi

# Check if file has .xlsx extension (case-insensitive)
if [[ ! "$XLSX_PATH" =~ \.xlsx$ && ! "$XLSX_PATH" =~ \.XLSX$ ]]; then
  echo "❌ Error: The provided file is not an .xlsx file: $XLSX_PATH"
  exit 1
fi

# --- Virtual environment setup ---
if [ ! -d "$SCRIPT_DIR/.venv" ]; then
  echo "📦 Creating virtual environment..."
  python3 -m venv "$SCRIPT_DIR/.venv"
fi

# Activate .venv
source "$SCRIPT_DIR/.venv/bin/activate"

# Install dependencies
if [ -f "$SCRIPT_DIR/.requirements.txt" ]; then
  echo "⬇️ Checking dependencies..."
  if ! pip check &>/dev/null || ! pip freeze | grep -Fxf "$SCRIPT_DIR/.requirements.txt" &>/dev/null; then
    echo "⬇️ Installing missing dependencies..."
    pip install --quiet -r "$SCRIPT_DIR/.requirements.txt"
  else
    echo "✅ All dependencies are already satisfied."
  fi
else
  echo "⚠️ Warning: .requirements.txt not found in $SCRIPT_DIR"
fi

# --- Run Python converter ---
echo "⚙️ Running conversion..."
python3 "$SCRIPT_DIR/.convert.py" "$XLSX_PATH"

# Deactivate venv
deactivate

echo "✅ Conversion complete!"
