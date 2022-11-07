#!/bin/bash

module load python/3.8
module load scipy-stack/2022a
module load cuda/11.0
module load cudnn/8.0.3

virtualenv --no-download $HOME/leaps_env
source $HOME/leaps_env/bin/activate
pip install -r requirements.txt