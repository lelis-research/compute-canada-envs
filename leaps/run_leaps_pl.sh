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

source $HOME/leaps_env/bin/activate
cd $HOME/scratch/leaps
python3 pretrain/trainer.py -c pretrain/cfg.py -d data/karel_dataset/ --verbose --train.batch_size 256 --device cuda:0 --num_lstm_cell_units 256 --loss.latent_loss_coef 0.1 --optimizer.params.lr 1e-3 --prefix LEAPSPL
