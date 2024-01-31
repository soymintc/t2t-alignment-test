cmd="snakemake"
cmd="$cmd -p"
cmd="$cmd -c16"
cmd="$cmd --jobs 30"
# cmd="$cmd --dry-run"
# cmd="$cmd --allowed-rules bwa_mem"

echo $cmd
eval $cmd
