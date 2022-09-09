#!/bin/bash

virtualenv --no-download $HOME/leaps_env
source $HOME/leaps_env/bin/activate
pip install -r requirements.txt