#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --mem=64000M
#SBATCH --time=2-00:00
#SBATCH --account=def-lelis
#SBATCH --array=2-4

module load python/3.8
module load scipy-stack/2022a

source $HOME/okp_env/bin/activate
cd $HOME/scratch/online-knapsack
mkdir -p logs
source configs/$SLURM_ARRAY_TASK_ID.env
python3 main.py exp3_$SLURM_ARRAY_TASK_ID $e $n 3 $w_max $p_min $p_max > logs/exp3_$SLURM_ARRAY_TASK_ID.out
