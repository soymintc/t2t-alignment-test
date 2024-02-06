cmd="snakemake"
cmd="$cmd -p"
cmd="$cmd -c60"
cmd="$cmd --jobs 60"
cmd="$cmd --use-singularity"
cmd="$cmd --singularity-args \"--bind /rtsess01 --bind /home\""
# cmd="$cmd --dry-run"
# cmd="$cmd --allowed-rules bwa_mem"

echo $cmd
eval $cmd
