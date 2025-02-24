import os
import subprocess
from pathlib import Path

origin_files = []
new_files = []

file_dict: dict[str, str] = dict()

fonts_file = "./sourcecodepro.txt"

def runcmd(cmd: list[str]):
    rsp = subprocess.run(cmd, capture_output=True, text=True)
    print("return code:", rsp.returncode)
    print(rsp.stdout)
    print(rsp.stderr)

with open(fonts_file, "r", encoding="utf-8") as f:
    origin_files = f.readlines()

    for line in origin_files:
        line = line.rstrip("\r\n")
        font_file = Path(line)
        stem_name = font_file.stem
        suffix = font_file.suffix

        dir = Path(fonts_file).stem
        Path(dir).mkdir(exist_ok=True)
        file_name = os.sep.join([Path(dir).stem, stem_name + suffix])

        file_dict[line] = file_name

for origin, target in file_dict.items():
    print(f"{origin} -> {target}")
    syscmd = ["pyftfeatfreeze", "-f", "zero", origin, target]
    runcmd(syscmd)
