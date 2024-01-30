cmd="snakemake"
cmd="$cmd -p"
cmd="$cmd -c1"
# cmd="$cmd --dry-run"

echo $cmd
eval $cmd
