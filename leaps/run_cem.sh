#!/bin/bash
#SBATCH --cpus-per-task=8
#SBATCH --mem=32000M
#SBATCH --time=1-00:00
#SBATCH --account=def-lelis
#SBATCH --array=8,16,32,64,128,256

module load python/3.8
module load scipy-stack/2022a
module load cuda/11.0
module load cudnn/8.0.3

source $HOME/leaps_env/bin/activate
cd $HOME/scratch/leaps

mkdir -p logs
mkdir -p results
mkdir -p logs/$1
mkdir -p results/$1
mkdir -p logs/$1/leaps_$SLURM_ARRAY_TASK_ID
outdir=results/$1
netmodel=weights/leaps_$SLURM_ARRAY_TASK_ID.ptp
for i in {1..20}
do
    output=logs/$1/leaps_$SLURM_ARRAY_TASK_ID/seed_$i.txt
    python3 pretrain/trainer.py --configfile pretrain/$1.py --outdir=$outdir --net.saved_params_path $netmodel --save_interval 1 --seed $i --num_lstm_cell_units $SLURM_ARRAY_TASK_ID --prefix LEAPS_$SLURM_ARRAY_TASK_ID --device cpu > $output
done