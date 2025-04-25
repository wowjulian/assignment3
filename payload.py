import shutil
from pathlib import Path
import os
dir_path = os.path.dirname(os.path.realpath(__file__))

def copy_and_rename(src_path, new_name):
    new_path = f"{dir_path}\{new_name}"
    shutil.copy(src_path, new_path)

script_dir = Path(__file__).resolve().parent
for file in script_dir.glob("*"):
    if(os.path.isfile(file)):
        print(file.name)
        copy_and_rename(file, f"copy_{file.name}")
        print("Successfully copied file and rename" +  f"{dir_path}\copy_{file.name}")
        break