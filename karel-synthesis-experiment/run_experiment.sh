#!/bin/bash
#SBATCH --gpus-per-node=2
#SBATCH --cpus-per-task=8
#SBATCH --mem=32000M
#SBATCH --time=1-10:00
#SBATCH --output=%N-%j.out
#SBATCH --account=def-lelis

module load python/3.8
module load scipy-stack/2022a
module load cuda/11.0
module load cudnn/8.0.3

cd $HOME/scratch/karel-synthesis
python3 experiment/train.py
