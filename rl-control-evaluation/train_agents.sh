#!/bin/bash
#SBATCH --cpus-per-task=32
#SBATCH --mem=8000M
#SBATCH --time=1-00:00
#SBATCH --output=%N-%j.out
#SBATCH --account=def-lelis

module load python/3.8
module load scipy-stack/2022a

source $HOME/rl_env/bin/activate
cd $HOME/scratch/rl-control-evaluation
python3 train_agent.py
