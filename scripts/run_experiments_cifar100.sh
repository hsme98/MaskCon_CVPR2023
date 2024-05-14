#!/bin/bash

#SBATCH -o logs/eval_unsupervisedcond.log-%j-%a
#SBATCH -c 20
#SBATCH -a 0-4
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2022a

python main_rd.py
