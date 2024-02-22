tumor_fastq=/fscratch/chois7/ont-alignment/data/fastq/SPECTRUM-OV-044-T/SPECTRUM-OV-044-T_R1.fastq.gz
normal_fastq=/fscratch/chois7/ont-alignment/data/fastq/SPECTRUM-OV-044-N/SPECTRUM-OV-044-N_R1.fastq.gz
tumor_bam=/fscratch/chois7/ont-alignment/data/output_bam/SPECTRUM-OV-044-T/SPECTRUM-OV-044-T.ont_GRCh37.sorted.bam
normal_bam=/fscratch/chois7/ont-alignment/data/output_bam/SPECTRUM-OV-044-N/SPECTRUM-OV-044-N.ont_GRCh37.sorted.bam
savana_vcf=/fscratch/chois7/ont-alignment/results/savana/SPECTRUM-OV-044-T.ont_GRCh37/SPECTRUM-OV-044-T.ont_GRCh37.somatic.sv_breakpoints.lenient.vcf
tumor_fastq_present=0
normal_fastq_present=0
tumor_bam_present=0
normal_bam_present=0
savana_vcf_present=0
for i in {1..10000}; do
    [[ $tumor_fastq_present -eq 0 ]] && [[ -f $tumor_fastq ]] && { send_slack_alarm.py -m "[`date`] tumor fastq created"; tumor_fastq_present=1; };
    [[ $normal_fastq_present -eq 0 ]] && [[ -f $normal_fastq ]] && { send_slack_alarm.py -m "[`date`] normal fastq created"; normal_fastq_present=1; };
    [[ $tumor_bam_present -eq 0 ]] && [[ -f $tumor_bam ]] && { send_slack_alarm.py -m "[`date`] tumor bam created"; tumor_bam_present=1; };
    [[ $normal_bam_present -eq 0 ]] && [[ -f $normal_bam ]] && { send_slack_alarm.py -m "[`date`] normal bam created"; normal_bam_present=1; };
    [[ $savana_vcf_present -eq 0 ]] && [[ -f $savana_vcf ]] && { send_slack_alarm.py -m "[`date`] savana vcf created"; savana_vcf_present=1; };
    sleep 100
done
