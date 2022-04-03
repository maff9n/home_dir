#!/usr/bin/python3.8

from os import getcwd
from sys import argv
from pathlib import Path
import hashlib


def main():
    _, *whitelist_elem = Path(argv[0]).parts
    target_gitignore = getcwd() + "/" + argv[2]
    print(argv[0])
    print(str(whitelist_elem))
    print("ende")
    current_path_expansion = ""
    output = ""
    for i in range(len(whitelist_elem)):
        if i == 0:
            current_path_expansion = whitelist_elem[i]
            output = output + "/" + current_path_expansion + "\n"
            output = output + "!/" + current_path_expansion + "\n"
            continue
        if i == len(whitelist_elem) - 1:
            current_path_expansion = current_path_expansion + \
                "/" + whitelist_elem[i]
            output = output + "/" + current_path_expansion
            break
        current_path_expansion = current_path_expansion + \
            "/" + whitelist_elem[i]
        output = output + "/" + current_path_expansion + "\n"
        output = output + "!/" + current_path_expansion + "\n"

    print(output)
    with open(target_gitignore, "a") as myfile:
        myfile.write(output)

    # 1
    output_file_path = target_gitignore
    input_file_path = target_gitignore

    # 2
    completed_lines_hash = set()

    # 3
    output_file = open(output_file_path, "w")

    # 4
    for line in open(input_file_path, "r"):
        # 5
        hashValue = hashlib.md5(line.rstrip().encode('utf-8')).hexdigest()
        # 6
        if hashValue not in completed_lines_hash:
            output_file.write(line)
            completed_lines_hash.add(hashValue)
    # 7
    output_file.close()


if __name__ == '__main__':
    main()
