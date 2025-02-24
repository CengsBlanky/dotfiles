import os
from pathlib import Path

origin_files = []
new_files = []

file_dict = dict()

fonts_file = "jetbrains.txt"

with open(fonts_file, "r", encoding="utf-8") as f:
    origin_files = f.readlines()

    for line in origin_files:
        line = line.rstrip("\r\n")
        font_file = Path(line)
        stem_name = font_file.stem
        suffix = font_file.suffix

        dir = Path(fonts_file).stem
        print(f"save to dir: {dir}")
        Path(dir).mkdir(exist_ok=True)
        file_name = os.sep.join([Path(dir).stem, stem_name + suffix])

        file_dict[line] = file_name

for origin, target in file_dict.items():
    print(f"{origin} -> {target}")
    os.system(f"pyftfeatfreeze -f 'zero' {origin} {target}")
