import shutil
from pathlib import Path
import os

def copy_and_rename(src_path, new_name):
	new_path = f"./{new_name}"
	shutil.copy(src_path, new_path)
	
script_dir = Path(__file__).resolve().parent
for file in script_dir.glob("*"):
    if(os.path.isfile(file)):
        print(file.name)
        copy_and_rename(file.name, f"copy_{file.name}")
        print("Successfully copied file and rename")
        break