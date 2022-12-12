#!/bin/bash
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4000M
#SBATCH --time=0-06:00
#SBATCH --account=def-lelis
#SBATCH --array=33-1024

module load python/3.8
module load scipy-stack/2022a

source $HOME/rl_env/bin/activate
cd $HOME/scratch/rl-control-evaluation
python3 ac_train.py $SLURM_ARRAY_TASK_ID
