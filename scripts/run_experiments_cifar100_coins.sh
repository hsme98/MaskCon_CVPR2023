#!/bin/bash

#SBATCH -o logs/cifar100_coins.log-%j-%a
#SBATCH -c 4
#SBATCH -a 0-4  # Job array indices from 0 to 4
#SBATCH --gres=gpu:volta:1

source /etc/profile
module load anaconda/2022a

# Define an array with the values for the --t parameter
w_values=(0 0.2 0.5 0.8 1.0)

# Access the value corresponding to the job array index
w_param="${w_values[$SLURM_ARRAY_TASK_ID]}"

# Execute the Python script with the selected --t parameter
python main_rd.py --mode coins --w $w_param
