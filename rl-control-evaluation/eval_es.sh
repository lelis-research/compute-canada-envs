#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --mem=8000M
#SBATCH --time=0-02:00
#SBATCH --output=%N-%j.out
#SBATCH --account=def-lelis
#SBATCH --array=5000,2000,1950,1900,1850,1800

module load python/3.8
module load scipy-stack/2022a

source $HOME/rl_env/bin/activate
cd $HOME/scratch/rl-control-evaluation
python3 eval_checkpoint.py expected_sarsa_agent $SLURM_ARRAY_TASK_ID 500
