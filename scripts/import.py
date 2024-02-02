import pandas as pd
import subprocess
import glob
import yaml
import time
import gzip
import os
import argparse

def parse_args():
    description = 'Import and merge FASTQ files from /igo'
    p = argparse.ArgumentParser(description=description)
    p.add_argument('--destination_path', help="Destination path", required=True)
    p.add_argument('--sample_id', help="Sample ID", required=True)
    p.add_argument('--path', help="Input FASTQ path", required=True)
    args = p.parse_args()
    return args

def main():
    args = parse_args()
    destination_path = args.destination_path
    sample_id = args.sample_id
    path = args.path

    # create merge directory
    merged_fastq_path = f'{destination_path}/merged/{sample_id}_R1_001.fastq.gz'
    merged_path = f'{destination_path}/merged'
    if not os.path.exists(merged_path):
        subprocess.run(f'mkdir -p {merged_path}', shell=True)
    merged_command_path = f'{merged_path}/merged_command_{sample_id}.log'

    # get FASTQ files
    fastqs = []
    fastqs += glob.glob(f'{path}/*.fastq.gz')
    assert len(fastqs) > 0, fastqs

    # submit merge jobs
    file_num = 1
    start = 0
    temp_file_list_tracker = []
    for end in range(1000, len(fastqs), 1000):
        args = ['cat'] + fastqs[start: end]
        tmp_fastq_path = f'{destination_path}/merged/tmp{file_num}_{sample_id}_R1_001.fastq.gz'
        with open(tmp_fastq_path, 'wb') as f:
            subprocess.check_call(args, stdout=f)
        start = end
        file_num += 1

        temp_file_list_tracker.append(tmp_fastq_path)

    args = ['cat'] + fastqs[start: -1]
    tmp_fastq_path = f'{destination_path}/merged/tmp{file_num}_{sample_id}_R1_001.fastq.gz'
    temp_file_list_tracker.append(tmp_fastq_path)
    with open(tmp_fastq_path, 'wb') as f:
        subprocess.check_call(args, stdout=f)

    args = ['cat'] + temp_file_list_tracker

    with open(merged_command_path, 'w') as f:
        for item in args:
            f.write("%s\n" % item)

    with open(merged_fastq_path, 'wb') as f:
        subprocess.check_call(args, stdout=f)

    for temp_file in temp_file_list_tracker:
        os.remove(temp_file)

if __name__ == "__main__":
    main()

