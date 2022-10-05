#!/bin/bash

module load python/3.8
module load scipy-stack/2022a

virtualenv --no-download $HOME/karel_env
source $HOME/karel_env/bin/activate
pip install -r requirements.txt