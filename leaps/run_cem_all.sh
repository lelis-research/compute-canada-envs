#!/bin/bash

for env in leaps_maze leaps_stairclimber leaps_topoff leaps_harvester leaps_fourcorners leaps_cleanhouse
do
    sbatch run_cem.sh env
done