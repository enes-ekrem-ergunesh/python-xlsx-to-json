# Python Excel → JSON Converter

This small project converts an Excel `.xlsx` file into a JSON file with the same name and location.  
It automatically sets up a virtual environment and installs dependencies.

---

## 🧩 Requirements

- Python 3.8+  

The script automatically creates a virtual environment and installs everything listed in `.requirements.txt`.

---

## 📘 Excel File Guidelines

Before converting, make sure your Excel file follows these rules:

1. ✅ The **first row** should contain **column headers** (field names).  
2. 🚫 **Do not leave empty columns** before your data starts.  
3. 🧾 All data should be in a **single sheet** (only the first sheet is read).  
4. 📄 The file must be saved as `.xlsx` (not `.xls` or `.csv`).  

---

## ⚙️ How to Use

1. Place your Excel file anywhere on your system.  
2. Run the script with the full path to your file:

```
bash run.sh /full/path/to/yourfile.xlsx
```

3. The script will:
   - Create or reuse `.venv`  
   - Install dependencies from `.requirements.txt`  
   - Convert the `.xlsx` file to `.json` in the **same folder**

---

## 🧠 Example

```
bash run.sh /home/ubuntu/documents/data.xlsx
```

This creates:

```
/home/ubuntu/documents/data.json
```

---

## 🧹 Notes

- You can run the script from **any directory**; it always uses its own path internally.  

