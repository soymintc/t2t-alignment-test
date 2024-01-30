cmd="snakemake"
cmd="$cmd -p"
cmd="$cmd -c4"
cmd="$cmd --jobs 30"
# cmd="$cmd --dry-run"

echo $cmd
eval $cmd
