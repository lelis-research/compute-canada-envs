#!/bin/bash
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4000M
#SBATCH --time=0-02:00
#SBATCH --output=%N-%j.out
#SBATCH --account=def-lelis
#SBATCH --array=1-256

module load python/3.8
module load scipy-stack/2022a

source $HOME/rl_env/bin/activate
cd $HOME/scratch/rl-control-evaluation
python3 eval_checkpoint_ac.py 4650 500 $SLURM_ARRAY_TASK_ID
