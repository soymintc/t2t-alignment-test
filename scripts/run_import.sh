destination_path=/fscratch/chois7/T2T/alignment/data/fastq/AK-RT-004-N
path=/igo/delivery/share/kentsisa/Project_14118/230207_14118/AK-RT-004-LR-N/20230207_1320_2D_PAK94235_1210f1c0/fastq_pass
for sample_id in AK-RT-004-N; do 
    cmd="python import.py"
    cmd="$cmd --destination_path ${destination_path}"
    cmd="$cmd --sample_id ${sample_id}"
    #cmd="$cmd --path \"/igo/delivery/share/yuh/Project_15434/Project_15434/${sample_id}_1_?_1/*/fastq_pass\""
    cmd="$cmd --path ${path}"
    echo $cmd
    eval $cmd &
done
