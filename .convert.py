import sys
import os
import pandas as pd

def xlsx_to_json(xlsx_path):
    # Read the Excel file
    try:
        df = pd.read_excel(xlsx_path)
    except Exception as e:
        print(f"❌ Failed to read Excel file: {e}")
        sys.exit(1)
    # Create the output path (same folder, same name, .json)
    json_path = os.path.splitext(xlsx_path)[0] + ".json"

    # Convert to JSON
    df.to_json(json_path, orient="records", indent=2, force_ascii=False)
    print(f"✅ JSON file created: {json_path}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python convert.py <path_to_xlsx_file>")
        sys.exit(1)
    xlsx_to_json(sys.argv[1])
