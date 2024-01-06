import os
import sys
import re


def get_exist_files(raw_names: list[str]):
    """check file exists and walk through sub directories"""
    exists_files = []
    for raw_name in raw_names:
        if os.path.exists(raw_name):
            if (os.path.isdir(raw_name)):
                for sub_file_name in os.listdir(raw_name):
                    exists_files.append(os.path.join(raw_name, sub_file_name))
            exists_files.append(raw_name)
        else:
            print(f'file : {raw_name} not exists', file=sys.stderr)
    if len(exists_files) > 0:
        print(f'files to be renamed: {exists_files}')
    return exists_files


def get_file_names():
    file_names = sys.argv
    print(file_names)
    if len(file_names) > 1:
        return file_names[1:]
    else:
        print("""
              Usage:
              recfnames args...
              """)
    return []


def rectify_file_names(file_names: list[str]):
    result_map = {}
    for file_name in file_names:
        new_file_name = re.sub(r'[ ：:%*$^&!#@``！。，=+]',
                               "",
                               file_name,
                               count=len(file_name))
        new_file_name = new_file_name.replace("（", "(")
        new_file_name = new_file_name.replace("）", ")")
        new_file_name = new_file_name.replace("《", "_")
        new_file_name = new_file_name.replace("》", "_")
        new_file_name = new_file_name.replace("-", "_")
        new_file_name = new_file_name.replace("·", "[")
        new_file_name = new_file_name.replace("「", "]")
        result_map[file_name] = new_file_name
    return result_map


def batch_rename(file_map: dict[str, str]):
    for key, value in file_map.items():
        print(f'rename {key} => {value}')
        os.rename(key, value)


def main():
    file_names = get_file_names()
    exists_file_names = get_exist_files(file_names)
    rename_file_map = rectify_file_names(exists_file_names)
    batch_rename(rename_file_map)


if __name__ == "__main__":
    main()
